resource "aws_instance" "instance-1" {

  iam_instance_profile = var.iam_profile

  tags = {
    Name = var.iname
    #environment = "dev"
    }
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key
    availability_zone = var.availability_zone
    root_block_device {
        volume_size = var.volume
    }
    vpc_security_group_ids = var.security_groups
    

    provisioner "remote-exec" {
      connection {
        type        = "ssh"
        user        = "ec2-user"
        host        = self.public_ip
        private_key = file("C:/Users/Prasad/Desktop/DevOps/keys/Putty.pem")
      }

      inline = [
        "sudo curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '\"' -f 4)/kops-linux-amd64",
        "sudo chmod +x kops",
        "sudo mv kops /usr/local/bin/kops",
        "sudo kops version",
        "sudo curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl",
        "sudo chmod +x kubectl",
        "sudo mv kubectl /usr/local/bin/",
        "sudo kubectl version",
        "aws s3 ls",
        "export KOPS_STATE_STORE=s3://prashanth.statefile-backup",
        "kops create cluster kops.k8s.local --zones ap-south-1a,ap-south-1b --master-count 1 --master-size m7i-flex.large --master-volume-size 30 --node-count 2 --node-size c7i-flex.large --node-volume-size 20 --image=ami-0cede6fe40e6ac719",
        "kops update cluster --name=kops.k8s.local --state=s3://prashanth.statefile-backup --yes"
      ]
}
}