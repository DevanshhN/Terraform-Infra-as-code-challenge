resource "aws_instance" "this" {
    ami = var.ami
    instance_type = var.instance_type
    tags = var.resourceTags
    subnet_id = var.subnet_id
    security_groups =  var.security_groups
    key_name = var.ssh_key

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg",
      "echo \"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
      "sudo apt-get update",
      "sudo apt-get install -y docker-ce docker-ce-cli containerd.io",
      "sudo usermod -aG docker ubuntu",  # Add the ubuntu user to the docker group
      "sudo systemctl enable docker",
      "sudo systemctl start docker",
      "git clone https://github.com/docnetwork/InspirationalQuoteGenerator",
      "cd InspirationalQuoteGenerator",
      "sudo docker build -t iqg/my-branch:latest .",
      "sudo docker run -p 80:3000 -d iqg/my-branch:latest"

    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.ssh_key)
    host        = self.public_ip
  }    
}