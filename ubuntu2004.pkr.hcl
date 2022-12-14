source "qemu" "docker-machine" {
  iso_url                = "https://releases.ubuntu.com/focal/ubuntu-20.04.5-desktop-amd64.iso"
  iso_checksum           = "2980570ea889f3467a04df15c8421ef1dc80ecef7bb37243da97f5714cf3f8ef"
  output_directory       = "build_output"
  shutdown_command       = "echo 'packer' | sudo -S shutdown -P now"
  disk_size              = "5000M"
  memory                 = 2048
  format                 = "qcow2"
  accelerator            = "kvm"
  headless               = "false"
  http_directory         = "http"
  ssh_username           = "root"
  ssh_private_key_file   = "./packer_rsa"
  ssh_handshake_attempts = "20"
  ssh_timeout            = "20m"
  vm_name                = "docker-machine"
  net_device             = "virtio-net"
  disk_interface         = "virtio"
  boot_wait              = "3s"
  boot_command = ["<enter><enter><wait><f6><esc><wait> ",
    "autoinstall ds=nocloud-net;seedfrom=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu_preseed.cfg",
    "<enter><wait>"
  ]
}

build {
  sources = ["source.qemu.docker-machine"]
  provisioner "shell" {
    inline = ["ls -alh"]
  }
}
