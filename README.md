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
