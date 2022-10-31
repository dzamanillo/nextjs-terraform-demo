terraform {
  required_providers {
    vercel = {
      source = "vercel/vercel"
      version = "~> 0.3"
    }
  }
}

resource "vercel_project" "example" {
  name      = "terraform-test-project"
  framework = "nextjs"
  git_repository = {
    type = "github"
    repo = "dzamanillo/nextjs-terraform-demo"
  }
}

# data "vercel_project_directory" "example" {
#   path = "../nextjs-terraform-demo"
# }

# resource "vercel_deployment" "example" {
#   project_id  = vercel_project.example.id
#   files       = data.vercel_project_directory.example.files
#   path_prefix = "../nextjs-terraform-demo"
#   production  = true
# }

resource "vercel_project_domain" "example" {
  project_id = vercel_project.example.id
  domain     = "test.dzamanillo.com"
}


