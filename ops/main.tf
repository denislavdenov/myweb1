# Configure the Packet Provider
provider "packet" {
  auth_token = "${var.token}"
}

resource "packet_device" "vmonpacket" {
  hostname         = "${var.prefix}1"
  plan             = "baremetal_0"
  facility         = "ams1"
  operating_system = "ubuntu_16_04"
  billing_cycle    = "hourly"
  project_id       = "${var.projectid}"

  connection {
    type        = "ssh"
    user        = "root"
    private_key = "${file("../priv/id_rsa")}"
  }

  # in case we need the root password
  provisioner "file" {
    content     = "root/${self.root_password}"
    destination = "/root/roowpw.txt"
  }

  provisioner "file" {
    source      = "../../nginx.conf"
    destination = "/tmp/nginx.conf"
  }

  provisioner "file" {
    source      = "../../scripts/provision.sh"
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
