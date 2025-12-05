#update
terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "local" {}

locals {
  app_code = <<-EOT
    console.log("Terraform created this file!");
  EOT
}

resource "local_file" "webapp_app" {
  content  = local.app_code
  filename = "${path.module}/webapp/src/index.js"
}

output "webapp_file_path" {
  value       = resource.local_file.webapp_app.filename
  description = "The full path to the web application's index.js file."
}
