terraform {
  required_providers {
    iosxe = {
      source = "CiscoDevNet/iosxe"
      version = "0.3.1"
    }
  }
}


provider "iosxe" {
  username = "admin"
  password = "password"
  url      = "https://10.1.1.1"
}