# Enterprise DevSecOps Infrastructure as Code (AWS & EKS)

Production-hardened, modular Infrastructure as Code (IaC) designed to meet **CIS Benchmark** and **NIST SP 800-53** cloud security standards.

## 🛡️ DevSecOps Security Architecture

- **Automated Security Scanning:** Every pull request runs **Checkov** and **Aqua Trivy** to identify misconfigurations before deployment.
- **Least-Privilege Networking:** Multi-tier VPC with strictly isolated private database subnets and internal Kubernetes worker pools.
- **Zero-Trust IAM Roles:** EKS IRSA (IAM Roles for Service Accounts) enforcing granular pod-level permissions.
- **Encrypted State Storage:** S3 remote backend with AES-256 encryption, TLS enforcement, and DynamoDB distributed state locking.

## 📁 Repository Structure

```text
├── environments/
│   ├── dev/                  # Development environment module
│   └── prod/                 # Hardened production environment
├── modules/
│   ├── vpc/                  # Multi-AZ hardened VPC networking
│   ├── eks/                  # Private Kubernetes control plane & nodes
│   └── rds/                  # Encrypted relational database storage
├── .github/workflows/
│   └── terraform-ci.yml      # Automated DevSecOps pipeline (Checkov + Trivy)
├── .checkov.yaml             # Baseline IaC security policy configuration
└── .tflint.hcl               # Linting and AWS security best practices
```

## 🚀 Execution & Verification

### Local Security Audit
```bash
# Run Checkov locally
checkov -d .

# Run Trivy IaC audit
trivy config .
```

### Deployment
```bash
cd environments/dev
terraform init
terraform plan
terraform apply
```
