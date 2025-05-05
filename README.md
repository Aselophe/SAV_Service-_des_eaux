# SAV Maintenance - Service des Eaux

Application Flutter de gestion d'interventions pour les services des eaux, permettant de centraliser les données clients, ouvrages (installations), interventions et personnes responsables (fontainiers).

---

## 📊 Objectif du projet

Digitaliser et centraliser les informations liées à la maintenance des infrastructures d'eau potable d'une région. Faciliter le travail de terrain grâce à une interface intuitive, une base de données embarquée et des cartes interactives.

---

## ✅ Fonctionnalités déjà implémentées

### 👤 Clients

* [x] Création de nouveaux clients avec numéro de contrat
* [x] Modification et suppression de clients
* [x] Liste des clés disponibles et des clés à demander

### 🏗️ Ouvrages

* [x] Ajout d’un ou plusieurs ouvrages par client
* [x] Attributs gérés : nom, type, latitude, longitude, alarme (oui/non), date installation batterie, notes
* [x] Modification et suppression des ouvrages
* [x] Position sélectionnable manuellement sur carte ou par GPS
* [x] Visualisation d’un ouvrage sur carte Google Maps
* [x] Affichage de tous les ouvrages d’un client sur la carte, avec noms et marqueurs distincts

### 🧑‍🔧 Fontainiers

* [x] Ajout, édition, suppression de plusieurs fontainiers par client
* [x] Données gérées : nom, prénom, téléphone, email

### 🗺️ Carte et position

* [x] Affichage de la carte Google Maps avec marqueurs pour les ouvrages
* [x] Prise en compte de la position actuelle de l'utilisateur

### 💾 Données et structure

* [x] Base de données locale NoSQL avec Isar
* [x] Architecture Flutter bien structurée (modèles, écrans, services)
* [x] Navigation fluide entre écrans (clients, ouvrages, carte, interventions)
* [x] Synchronisation locale de la base client après modification
* [x] Dépôt GitHub initialisé et fonctionnel : [SAV\_Service-\_des\_eaux](https://github.com/Aselophe/SAV_Service-_des_eaux)

---

## 🔧 Fonctionnalités à développer

### 📅 Interventions

* [ ] Ajout d’une intervention à un ouvrage (date, type, remarques)
* [ ] Liste des interventions passées d’un ouvrage

### 🔐 Données

* [ ] Exportation de la base en PDF ou Excel
* [ ] Sauvegarde manuelle et restauration (ZIP ou fichier chiffré)
* [ ] Synchronisation inter-appareils (via Git, Nextcloud ou autre solution hors ligne)

### UX & Technique

* [ ] Meilleure gestion des permissions (GPS, stockage)
* [ ] Icônes personnalisées pour ouvrages et fontainiers
* [ ] Dark mode

---

## 🏗️ Technologies utilisées

| Technologie | Usage principal                      |
| ----------- | ------------------------------------ |
| Flutter     | Framework principal de l'application |
| Isar        | Base de données locale ultra-rapide  |
| Google Maps | Visualisation géographique           |
| Geolocator  | Récupération de la position GPS      |

---

## 📦 Installation (en local pour développeurs)

```bash
git clone https://github.com/Aselophe/SAV_Service-_des_eaux.git
cd SAV_Service-_des_eaux
flutter pub get
flutter run
```

---

## 👤 Auteur

Projet développé par **David Hinni (alias Aselophe)**

> Technicien en automatisme, passionné de Linux, électronique, Flutter, maintenance industrielle, et solutions terrain robustes. Ce projet est destiné à être utilisé **hors ligne** sur tablette ou smartphone en intervention.

---

📅 **Dernière mise à jour :** Toutes les fonctionnalités actuelles sont fonctionnelles. Le développement continue activement.
