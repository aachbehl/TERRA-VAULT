provider "aws" {
    region = "us-east-1"
  
}
provider "vault" {
    address = "<ec2-instance>:8200"
    skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "<role-id>"
      secret_id = "<secret-id>"
    }
  }
  
}
data "vault_kv_secret_v2" "example" {
  mount = "kv" 
  name  = "test-secret" 
}
resource "aws_instance" "example" {
    ami = "ami-0de716d6197524dd9"
    instance_type = "t2.micro"
    tags = {
        Name = "test"
        Secret = data.vault_kv_secret_v2.example.data["username"]
    }
  
}