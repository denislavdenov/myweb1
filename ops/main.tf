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

  provisioner "remote-exec" {
    script = "../scripts/provision.sh"
  }
}
