
---

## 📦 terraform-aws-eks-addons`

### 📄 `terraform-aws-eks-addons/README.md`

```markdown
# terraform-aws-eks-addons

Terraform module to install Kubernetes add-ons on an existing Amazon EKS cluster. This includes:

- Cluster Autoscaler with IAM role and service account (IRSA)
- AWS Load Balancer Controller via Helm
- RBAC manifests for autoscaler

---

## 📌 Requirements

| Name      | Version   |
|-----------|-----------|
| Terraform | >= 1.0    |
| AWS CLI   | >= 2.0    |

---

## 📦 Providers

| Name     | Source              |
|----------|---------------------|
| aws      | hashicorp/aws       |
| helm     | hashicorp/helm      |
| kubectl  | gavinbunney/kubectl |

---

## 📥 Inputs

| Name                          | Description                                  | Type     | Required |
|-------------------------------|----------------------------------------------|----------|----------|
| cluster_name                 | Name of the EKS cluster                      | string   | ✅        |
| region                       | AWS region                                   | string   | ✅        |
| vpc_id                       | VPC ID (for ALB controller)                  | string   | ✅        |
| oidc_provider_arn            | OIDC provider ARN from EKS                   | string   | ✅        |
| autoscaler_role_name         | IAM role name for cluster autoscaler         | string   | ✅        |
| autoscaler_service_account   | Service account for cluster autoscaler       | string   | ✅        |
| lb_controller_role_name      | IAM role name for ALB controller             | string   | ✅        |
| lb_controller_service_account| Service account for ALB controller           | string   | ✅        |
| namespace                    | Namespace for resources (default: kube-system) | string | ❌        |

---

## 🔧 Outputs

_None_

---

## 🚀 Example

```hcl
module "eks_addons" {
  source = "git::https://github.com/Nvision-x/terraform-aws-eks-addons.git?ref=v1.0.0"

  cluster_name                 = module.nx.eks_cluster_name
  region                       = var.region
  vpc_id                       = var.vpc_id
  oidc_provider_arn            = module.nx.eks_oidc_provider_arn

  autoscaler_role_name         = "cluster-autoscaler"
  autoscaler_service_account   = "cluster-autoscaler"
  lb_controller_role_name      = "aws-lb-controller"
  lb_controller_service_account = "aws-load-balancer-controller"

  providers = {
    helm    = helm.eks
    kubectl = kubectl.eks
  }
}
