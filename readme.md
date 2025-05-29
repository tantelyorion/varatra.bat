# VARATRA.bat - Verrouillage USB Instantané

**Auteur :** Tantely Orion  
**Version :** 1.0  
**Dernière mise à jour :** Mai 2025  

---

## 🛠️ Présentation

`VARATRA.bat` est un script batch Windows permettant de **verrouiller ou déverrouiller l'écriture sur des lecteurs USB** en un clic. Il est conçu pour renforcer la sécurité des postes de travail en restreignant l'accès en écriture aux clés USB, tout en offrant une interface simple en ligne de commande.

---

## ⚙️ Fonctionnalités

- 🔒 **Verrouiller un lecteur USB en écriture**  
  Empêche toute écriture sur les périphériques USB (clé, disque dur externe, etc.).

- 🔓 **Déverrouiller un lecteur USB**  
  Réactive l’accès complet aux lecteurs USB, permettant lecture et écriture.

- 📋 **Détection automatique des lecteurs USB**  
  Affiche les périphériques connectés pour un choix rapide.

- 🧑‍💻 **Élévation automatique des droits administrateur**  
  Le script demande automatiquement les privilèges requis pour fonctionner.

---

## 🖥️ Utilisation

### ✅ Exécution
Double-clique sur `VARATRA.bat` ou lance-le via un terminal `cmd.exe`.

### 📋 Menu principal

```text
[1] Verrouiller un lecteur USB en écriture
[2] Déverrouiller un lecteur USB
[3] Quitter


## 💻 Compatibilité

Le script est compatible avec les systèmes suivants :

- ✅ **Windows 7 / 8 / 10 / 11** : Fonctionnement complet (recommandé)
- ⚠️ **Windows XP** : Fonctionne partiellement, nécessite des ajustements (voir ci-dessous)
- ❌ **Windows 2000 / NT / 95 / 98 / Me** : Non compatible (technologies non supportées)

### ⚠️ Remarques pour Windows XP :
- La clé de registre `StorageDevicePolicies` doit être créée manuellement.
- L’élévation des droits administrateur (`UAC`) n’est pas disponible ; exécuter le script en tant qu’administrateur manuellement.
- `wmic` peut être absent sur certaines éditions de Windows XP Home.

