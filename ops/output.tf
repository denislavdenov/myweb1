output "public_dns" {
  value = "${packet_device.vmonpacket.access_public_ipv4}"
}

output "where_to_curl" {
  value = "${format("curl -sL %s", packet_device.vmonpacket.access_public_ipv4)}"
}

output "where_to_ssh" {
  value = "${format("ssh -i ../priv/id_rsa root@%s", packet_device.vmonpacket.access_public_ipv4)}"
}
