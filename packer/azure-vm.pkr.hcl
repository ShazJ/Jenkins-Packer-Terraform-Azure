#build with packer build debian.pkr.hcl

source "azure-arm" "image-build" {
  azure_tags = {
    dept  = "Engineering"
    task = "Image deployment"
  }
  
  client_id                         = "d1a040b6-65a4-4916-a85c-bc4e06f14c8f"
  client_secret                     = "5pe8Q~b9FjTVq4hEHMtYqWTiz6AOUPwQFWd3ham_"
  subscription_id                   = "2ec254d2-83e6-416b-969c-7da8030dc771"
  tenant_id                         = "20e2bf23-d13a-42ba-99a4-5bb9fffb68f2"

  managed_image_name                = "DebianHost"
  managed_image_resource_group_name = "packerRG"  

  image_offer                       = "debian-10"
  image_publisher                   = "Debian"
  image_sku                         = "10"
  location                          = "uksouth"
  os_type                           = "Linux"  
  vm_size                           = "Standard_DS2_v2"
}

build {
  sources = ["source.azure-arm.image-build"]

  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E bash '{{ .Path }}'"
    scripts = [
      "scripts/basic.sh",
      "scripts/kubectl.sh",
      "scripts/python.sh",
      "scripts/istio.sh",
      "scripts/helm.sh",
      "scripts/k9s.sh",
      "scripts/docker.sh",
      "scripts/cleanup.sh" 
    ]
  }
}