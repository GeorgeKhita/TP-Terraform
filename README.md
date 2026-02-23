# TP Noté — Terraform sur Azure
### Déploiement de 2 VMs avec Load Balancer

> **Formation** : Infrastructure as Code — Institut Limayrac  
> **Date** : 23/02/2026  
> **Auteur** : GeorgeKhita

---

## 📁 Structure du projet

```
tp-terraform-azure/
├── versions.tf   → Contraintes de version Terraform et provider azurerm
├── provider.tf   → Configuration du provider Azure
├── variables.tf  → Variables (location, prefix, subscription_id)
├── main.tf       → Toutes les ressources Azure
└── outputs.tf    → Outputs (IPs, IDs, noms)
```

---

## ⚙️ Prérequis

- Terraform >= 1.5.0
- Azure CLI installé et authentifié (`az login`)
- Compte Azure for Students actif
- Une paire de clés SSH (`~/.ssh/id_rsa.pub`)

---

## 🏗️ Infrastructure déployée

L'infrastructure est déployée en région **France Central** et comprend :

- **1 Resource Group** : `tp-azure-rg`
- **1 Virtual Network** : `tp-azure-vnet` (10.0.0.0/16)
- **1 Subnet** : `tp-azure-subnet` (10.0.1.0/24)
- **1 Network Security Group** avec 3 règles :
  - `allow-ssh` (port 22)
  - `allow-http` (port 80)
  - `deny-all-inbound` (priorité 4096)
- **1 Load Balancer Standard** avec IP publique statique
- **2 VMs Ubuntu 22.04 LTS** (`Standard_B1s`) avec Nginx installé automatiquement

---

## 🚀 Déploiement

```bash
# 1. Initialiser Terraform
terraform init

<img width="1263" height="444" alt="terraform_init" src="https://github.com/user-attachments/assets/a5367e09-759f-4036-9a81-afb3c456044c" />

# 2. Vérifier la configuration
terraform plan

<img width="1306" height="691" alt="terraform_plan" src="https://github.com/user-attachments/assets/0ee08958-a968-4b3d-8498-8ded1fe0d5f5" />

<img width="1281" height="589" alt="terraform_plan2" src="https://github.com/user-attachments/assets/f8085b92-96c6-47df-a41d-e99a6f7310ae" />


# 3. Déployer l'infrastructure
terraform apply

<img width="1280" height="695" alt="terraform_apply1" src="https://github.com/user-attachments/assets/ef4ee636-2a66-41bd-9f3c-79a70f726f89" />

<img width="1252" height="305" alt="terraform_apply2" src="https://github.com/user-attachments/assets/885f74e7-5a34-40bb-8b27-00b890d9a251" />



# 4. Tester l'accès via le Load Balancer
curl http://<lb_public_ip>

<img width="852" height="510" alt="terraform_loadBalancer" src="https://github.com/user-attachments/assets/77cabca8-49f1-4608-b662-77aee6bbf4be" />

# 5. Nettoyer les ressources
terraform destroy

<img width="1519" height="483" alt="terraform_destroy1" src="https://github.com/user-attachments/assets/a3b2a2e5-61d3-427b-ae4d-bdb6113c1fe0" />

<img width="1521" height="408" alt="terraform_destroy2" src="https://github.com/user-attachments/assets/43d4c856-12f9-4733-b91f-2004e41e78e4" />

```

---

## 📊 Résultats

### terraform plan
<!-- Insérer capture d'écran terraform plan -->

### terraform apply
<!-- Insérer capture d'écran terraform apply -->

### Accès web via le Load Balancer — VM-1
<!-- Insérer capture d'écran Hello from tp-azure-vm-1 -->

### Accès web via le Load Balancer — VM-2
<!-- Insérer capture d'écran Hello from tp-azure-vm-2 -->

### terraform destroy
<!-- Insérer capture d'écran terraform destroy -->

---

## ⚠️ Difficultés rencontrées

- **Région West Europe restreinte** : Erreur 403 lors du premier déploiement. Résolu en changeant pour **France Central**.
- **Load Balancer Standard** : Le LB Standard Azure nécessite une configuration réseau particulière. Des IPs publiques temporaires ont été ajoutées sur les NICs pour le débogage puis supprimées.

---

## 🔗 Livrables

- ✅ Fichiers Terraform dans ce repo
- ✅ Captures d'écran dans ce README
- ✅ Compte rendu PDF
