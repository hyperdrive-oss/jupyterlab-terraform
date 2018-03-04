
# Starting point from
# https://tsaprailis.com/2017/09/11/How-to-automate-creating-a-virtual-machine-for-data-science/

provider "aws" {
    region = "us-east-1"
    version = "~> 0.1"
}

resource "aws_security_group" "jupyter_notebook_sg" {
    name = "jupyter_notebook_sg"
    # Open up incoming ssh port
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Open up incoming traffic to port 8888 used by Jupyter Notebook
    ingress {
        from_port   = 8888
        to_port     = 8888
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Open up outbound internet access
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "Node" {
    count = 1
    ami = "${var.ami}"
    instance_type = "t2.large" # m4.xlarge
    key_name = "${var.keypair_name}"
    tags {
        Name = "Jupyter Notebook Meganode"
    }
    vpc_security_group_ids = ["${aws_security_group.jupyter_notebook_sg.id}"]

    provisioner "file" {
        source      = "configure.sh"
        destination = "/tmp/configure.sh"

        connection {
            type     = "ssh"
            user     = "ubuntu"
            private_key = "${file(var.private_key_path)}"
        }
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/configure.sh",
            "/tmp/configure.sh",
        ]
        connection {
            type     = "ssh"
            user     = "ubuntu"
            private_key = "${file(var.private_key_path)}"
        }

    }

}

output "node_dns_name" {
    value = "${aws_instance.Node.public_dns}"
}