# azure-terraform-project

# Folder structure
I have choosen the second folder structure as this is most like the ones we have used this semester
azure-terraform-project/
│
├── modules/
│   ├── networking/
│   ├── app_service/
│   ├── database/
│   ├── storage/
│   └── nn/
│
├── deployments/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   │
│   ├── terraform.tfvars.dev
│   ├── terraform.tfvars.staging
│   └── terraform.tfvars.prod
│
├── global/
│   └── main.tf
│
└── README.md

# Usage
The CI/CD pipeline for testing will run when an environment is pushing to its branch. The CI/CD for deployment will also run, but sadly doesnt work. The deployment pipeline can also be run manually with apply or destroy as sendt-with parameters. This makes it possible to both deploy and take down the infrastructure.

For CLI deployment the global resource has to first be run:
cd ./azure-terraform-project/global
terraform init
terraform plan -out="main.tfplan" 
terraform apply ".\main.tfplan" 

After global is deployed navigate to deployments and initialise:
cd ./azure-terraform-project/deployments
terraform init

Now for the deployment of the different environment they first need to be created then apply:
terraform workspace new dev
terraform apply -var-file="terraform.tfvars.dev"  

The workspace and terraform.tfvars. has to be manually set based on which environment you want, the example shows with the dev environment
