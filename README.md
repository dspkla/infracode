# Cloud Infrastructure as Code (Terraform)

Production-ready, modular Infrastructure as Code (IaC) provisioning AWS networking and Kubernetes (EKS) infrastructure.

## Architecture

- **VPC Module:** Multi-AZ public and private subnets, NAT Gateway, Route Tables, Internet Gateway.
- **EKS Module:** Managed Kubernetes control plane, IAM roles for service accounts, autoscaling worker node groups.
- **Environments:** Decoupled `dev` and `prod` configurations maintaining environment parity.
- **CI/CD Automation:** GitHub Actions pipeline running `terraform fmt`, validation, and Trivy security scanning on pull requests.

## Directory Layout

```text
├── environments/
│   ├── dev/            # Development environment configuration
│   └── prod/           # Production environment configuration
├── modules/
│   ├── vpc/            # Reusable VPC networking module
│   ├── eks/            # Managed Kubernetes cluster module
│   └── rds/            # Database storage module
└── .github/workflows/
    └── terraform-ci.yml # Automated CI pipeline
```

## Quickstart

### Prerequisites
- AWS CLI configured with appropriate credentials
- Terraform >= 1.5.0

### Local Execution

```bash
cd environments/dev
terraform init
terraform plan
terraform apply
```
