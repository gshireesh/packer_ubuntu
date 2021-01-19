# Base Packer QEMU Ubuntu 20.04 Builder

This is a base Ubuntu 20.04 build in packer using the QEMU builder. From here add whatever provisioners you please to fully customize your image build. This is using the new

## Prerequisites 
To use this builder you will need the following:

- Packer 1.6.6 or higher
- qemu
- qemu-kvm
- libvirt-daemon
- libvirt-clients
- bridge-utils
- virt-manager

## Setup
Only 2 small things are required to get this running. First either put your public key in `http/user-data` or generate new ones. Second is to specify the key in `ubuntu2004.pkr.hcl`

### Examples

http/user-data:
```yaml
    authorized-keys:
      # Place public key here
      # - ssh-rsa AAAA...
```

ubuntu2004.pkr.hcl:
```
  ssh_private_key_file   = "./packer_rsa"
```
