# token variable
variable "token" {
  description = "packet token"
}

# Configure the Packet Provider
provider "packet" {
  auth_token = "${var.token}"
}

resource "packet_device" "vmonpacket" {
  hostname         = "alvaro1"
  plan             = "baremetal_0"
  facility         = "ewr1"
  operating_system = "ubuntu_16_04"
  billing_cycle    = "hourly"
  project_id       = "a2816230-90c0-4acb-9304-e7ed2d30d022"

  connection {
    type        = "ssh"
    user        = "root"
    private_key = "${file("/Users/alvaro/.ssh/id_rsa")}"
  }

  provisioner "file" {
    source      = "../nginx.conf"
    destination = "/tmp/nginx.conf"
  }

  provisioner "file" {
    source      = "../scripts/provision.sh"
    destination = "/tmp/provision.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "curl -sL -o /tmp/index.html https://github.com/kikitux/myweb1/releases/download/0.0.2/index.html",
      "cd /tmp",
      "bash provision.sh",
    ]
  }
}
