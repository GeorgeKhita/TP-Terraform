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

# 2. Vérifier la configuration
terraform plan

# 3. Déployer l'infrastructure
terraform apply

# 4. Tester l'accès via le Load Balancer
curl http://<lb_public_ip>

# 5. Nettoyer les ressources
terraform destroy


```

---

## 📊 Résultats


### terraform init

<img width="1263" height="444" alt="terraform_init" src="https://github.com/user-attachments/assets/90ebb21a-7f9c-42dc-b8b0-ec188bc14838" />


### terraform plan

<img width="1306" height="691" alt="terraform_plan" src="https://github.com/user-attachments/assets/d54b1c5c-4a4d-4eeb-bbcf-52a65785f417" />
...
<img width="1281" height="589" alt="terraform_plan2" src="https://github.com/user-attachments/assets/074f027d-83dc-4fc2-bc71-19bedebdd9c3" />


### terraform apply

<img width="1280" height="695" alt="terraform_apply1" src="https://github.com/user-attachments/assets/f2ba2922-0e5d-4688-b69c-77b6d8827525" />
...
<img width="1252" height="305" alt="terraform_apply2" src="https://github.com/user-attachments/assets/cf7ff9c4-e7c0-416f-8379-40e62110dbe7" />


### Accès web via le Load Balancer — VM-1 et VM-2

<img width="852" height="510" alt="terraform_loadBalancer" src="https://github.com/user-attachments/assets/c6c6c60a-0b35-480e-947c-765b26d2b32b" />



### terraform destroy

<img width="1519" height="483" alt="terraform_destroy1" src="https://github.com/user-attachments/assets/461ee145-6f77-4925-a54d-3d923c7d9280" />
...
<img width="1521" height="408" alt="terraform_destroy2" src="https://github.com/user-attachments/assets/1c5e49ad-b3ae-43ad-a8cd-14eaecdfe83e" />

---

## ⚠️ Difficultés rencontrées

- **Région West Europe restreinte** : Erreur 403 lors du premier déploiement. Résolu en changeant pour **France Central**.
- **Load Balancer Standard** : Le LB Standard Azure nécessite une configuration réseau particulière. Des IPs publiques temporaires ont été ajoutées sur les NICs pour le débogage puis supprimées.

---

## 🔗 Livrables

- ✅ Fichiers Terraform dans ce repo
- ✅ Captures d'écran dans ce README
- ✅ Compte rendu PDF
