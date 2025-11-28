# **Mon MCD.**

## 1. Entités

### ### **1.1 QUARTIER**

Représente les différents quartiers de la ville de Dijon.

| Attribut      | PK/FK | Type    | Description                    |
| ------------- | ----- | ------- | ------------------------------ |
| `id_quartier` | PK    | int     | Identifiant unique du quartier |
| `nom`         |       | string  | Nom officiel du quartier       |

---

### **1.2 BAR**

Représente les bars qui vendent des bières.

| Attribut      | PK/FK | Type    | Description                          |
| ------------- | ----- | ------- | ------------------------------------ |
| `id_bar`      | PK    | int     | Identifiant unique du bar            |
| `nom`         |       | string  | Nom du bar                           |
| `adresse`     |       | string  | Adresse complète                     |
| `id_quartier` | FK    | int     | Référence au quartier d’implantation |


---

### **1.3 BIERE**

Représente les bières disponibles dans les différents bars.

| Attribut    | PK/FK | Type    | Description                           |
| ----------- | ----- | ------- | ------------------------------------- |
| `id_biere`  | PK    | int     | Identifiant unique de la bière        |
| `nom`       |       | string  | Nom commercial                        |
| `type`      |       | string  | Style : IPA, Lager, Stout…            |
| `degres`    |       | float   | Taux d’alcool                         |
| `categorie` |       | string  | Catégorie : artisanale, industrielle… |

---

### **2.4 PRIX**

Entité reliant **BAR** et **BIERE**.

| Attribut   | PK/FK | Type    | Description               |
| ---------- | ----- | ------- | ------------------------- |
| `id_prix`  | PK    | int     | Identifiant du prix       |
| `id_bar`   | FK    | int     | Bar vendant la bière      |
| `id_biere` | FK    | int     | Référence de la bière     |
| `prix`     |       | numeric | Prix appliqué dans ce bar |

---

## 2. Relations

### **QUARTIER → BAR** (1,N)
### **BAR ↔ BIERE à travers l'entité PRIX** (N,N)
### **BAR → PRIX** (1,N)
### **BIERE → PRIX** (1,N)
---


## 3. Voici mon schéma et la 'Synthaxe Mermaid pour le générer'

![IMAGE DU SCHEMA.](../img/mon_mcd.png)

<br><br>

![LIEN DE CONCEPTION](https://mermaid.live/edit#pako:eNqVVF1v2jAU_SuWX_aSRlARoHmjpZUQ00TpKk1TpMnFl9SaY6eOPZVR_k_7E_acP7brQGgoWbfdt3t0zv0418maLjQHGlMwY8FSw7JEJYpgXN-O5p8nl3Py9HRyotfkfDQnMUmQr6wAZRO65Xl8R5nNJ18qTm50rgvYU7DM5REJCkt-gOIOCGeq8OQ3ndfb3IdQlgj-7cExg90NmU1JMxI6GROnxIMv5khNqwfwUVgjVEqUzg6FnxBokWzqafx-x4Pcsb_NgIz_aN_OZtxAUcAre7QDFjrLZflsoSl669HVdCu6rgHmcDZJWJ5XANIlNDu_7lwdrGVrrALv7g1EMnInymcD_7z9-xq7yuFAc2NXOHZMJrNRQD6yFExAbqx2NgzDpn4pNbNYPUXLmvoxIuVLQfgHJhday5aeC2Yh1UZArblgtnzZIjHx5hVMMQkBGsOdF4GU0Oi_d7J67cdG5kY8tvjI8SZiKRiS8E14Ust9_dO7mjZk5wjo8hdpfFCthh4ccV8B9RVzJ20KlMvAiEU1SHPOmc-bZ6s-4D89pkTRgKZGcBpb4yCgWDRjPqWVMQm195BhY_9T4Mx89xU2qMmZ-qp1VsuMduk9jZdMFpi5nOORdv-sPQVXAHOhnbI07vbOqho0XtNHn_bCYa8_6EfDTqcfdQdRQFcIn4ZnGMNO1B9E3X53cLoJ6M-qbSccDqLNbxmEgTY)


```mermaid
erDiagram

    QUARTIER ||--o{ BAR : "contient"
    BAR ||--o{ PRIX : "propose"
    BIERE ||--o{ PRIX : "est vendue dans"

    QUARTIER {
        int id_quartier PK             "ID unique du quartier"
        string nom            "Nom du quartier"
    }

    BAR {
        int id_bar PK             "ID unique du bar"
        string nom            "Nom du bar"
        string adresse        "Adresse complète"
        int id_quartier FK    "Quartier auquel appartient le bar"
    }

    BIERE {
        int id_biere PK             "ID unique de la bière"
        string nom            "Nom de la bière"
        string type           "Style : IPA, Lager, Stout..."
        float degres          "Degrés d'alcool"
        string categorie      "Catégorie : artisanale, industrielle..."
    }

    PRIX {
        int id_prix PK             "Identifiant du prix"
        int id_bar FK         "Bar où est vendue la bière"
        int id_biere FK       "Bière vendue"
        numeric prix          "Prix de la bière dans le bar"
    }
