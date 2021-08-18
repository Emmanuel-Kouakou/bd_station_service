CREATE DATABASE IF NOT EXISTS `PRODUITS` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `PRODUITS`;

CREATE TABLE `REMBOURSEMENT_DIRECTION` (
  `id_rb_direction` VARCHAR(42),
  `montant_rembourse` VARCHAR(42),
  `date` VARCHAR(42),
  `id_cred_dir` VARCHAR(42),
  PRIMARY KEY (`id_rb_direction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CLIENT` (
  `id_client` VARCHAR(42),
  `nom_client` VARCHAR(42),
  `prenom_client` VARCHAR(42),
  `adresse_client` VARCHAR(42),
  `telephone_client` VARCHAR(42),
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `REMBOURSEMENT_GERANT` (
  `id_rb_gerant` VARCHAR(42),
  `montant_verse` VARCHAR(42),
  `date` VARCHAR(42),
  `id_cred_ger` VARCHAR(42),
  PRIMARY KEY (`id_rb_gerant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CREDIT_DIRECTION` (
  `id_cred_dir` VARCHAR(42),
  `montant_credit` VARCHAR(42),
  `date_credit` VARCHAR(42),
  `echeance` VARCHAR(42),
  `statut` VARCHAR(42),
  `id_client` VARCHAR(42),
  `id_produit` VARCHAR(42),
  `id_direction` VARCHAR(42),
  PRIMARY KEY (`id_cred_dir`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CREDIT_GERANT` (
  `id_cred_ger` VARCHAR(42),
  `montant_credit` VARCHAR(42),
  `date_credit` VARCHAR(42),
  `echeance` VARCHAR(42),
  `statut` VARCHAR(42),
  `id_produit` VARCHAR(42),
  `id_client` VARCHAR(42),
  `id_gerant` VARCHAR(42),
  PRIMARY KEY (`id_cred_ger`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `VERSEMENT` (
  `id_versement` VARCHAR(42),
  `date` VARCHAR(42),
  `montant_verse` VARCHAR(42),
  `id_gerant` VARCHAR(42),
  `id_banque` VARCHAR(42),
  PRIMARY KEY (`id_versement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `DIRECTION` (
  `id_direction` VARCHAR(42),
  `libelle_direction` VARCHAR(42),
  `adresse_direction` VARCHAR(42),
  `telephone_direction` VARCHAR(42),
  `login` VARCHAR(42),
  `mot_de_passe` VARCHAR(42),
  PRIMARY KEY (`id_direction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `PRODUIT` (
  `id_produit` VARCHAR(42),
  `nom` VARCHAR(42),
  `reference` VARCHAR(42),
  `prix` VARCHAR(42),
  PRIMARY KEY (`id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `GERANT` (
  `id_gerant` VARCHAR(42),
  `prenom_gerant` VARCHAR(42),
  `adresse_gerant` VARCHAR(42),
  `telephone_gerant` VARCHAR(42),
  `mail_gerant` VARCHAR(42),
  `login` VARCHAR(42),
  `mot_de_passe` VARCHAR(42),
  PRIMARY KEY (`id_gerant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `COMMANDE` (
  `id_cmd` VARCHAR(42),
  `numero_cmd` VARCHAR(42),
  `quantite_cmd` VARCHAR(42),
  `date` VARCHAR(42),
  `id_gerant` VARCHAR(42),
  `id_produit` VARCHAR(42),
  PRIMARY KEY (`id_cmd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `BANQUE` (
  `id_banque` VARCHAR(42),
  `libelle` VARCHAR(42),
  PRIMARY KEY (`id_banque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `POMPE` (
  `id_pompe` VARCHAR(42),
  `libelle` VARCHAR(42),
  `status` VARCHAR(42),
  `id_cuve` VARCHAR(42),
  PRIMARY KEY (`id_pompe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CUVE` (
  `id_cuve` VARCHAR(42),
  `capacite` VARCHAR(42),
  `statut` VARCHAR(42),
  `id_produit` VARCHAR(42),
  `id_station` VARCHAR(42),
  PRIMARY KEY (`id_cuve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `STATION` (
  `id_station` VARCHAR(42),
  `nom_station` VARCHAR(42),
  `adresse_station` VARCHAR(42),
  `telephone_station` VARCHAR(42),
  `type_payement` VARCHAR(42),
  `statusbis_station` VARCHAR(42),
  `objectif` VARCHAR(42),
  `besoin` VARCHAR(42),
  `status` VARCHAR(42),
  `id_gerant` VARCHAR(42),
  PRIMARY KEY (`id_station`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `POMPISTE` (
  `id_pompiste` VARCHAR(42),
  `prenom_pompiste` VARCHAR(42),
  `nom_pompiste` VARCHAR(42),
  `adresse_pompiste` VARCHAR(42),
  `telephone_pompiste` VARCHAR(42),
  `login` VARCHAR(42),
  `statut` VARCHAR(42),
  `id_station` VARCHAR(42),
  PRIMARY KEY (`id_pompiste`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `LIVRAISON` (
  `id_livr` VARCHAR(42),
  `numero_livr` VARCHAR(42),
  `quantite_livre` VARCHAR(42),
  `date_livr` VARCHAR(42),
  `id_chauffeur` VARCHAR(42),
  `id_produit` VARCHAR(42),
  `id_direction` VARCHAR(42),
  `id_camion` VARCHAR(42),
  PRIMARY KEY (`id_livr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CAMION` (
  `id_camion` VARCHAR(42),
  `libelle` VARCHAR(42),
  PRIMARY KEY (`id_camion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CHAUFFEUR` (
  `id_chauffeur` VARCHAR(42),
  `nom` VARCHAR(42),
  `adresse` VARCHAR(42),
  PRIMARY KEY (`id_chauffeur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `VENTE` (
  `id_vente` VARCHAR(42),
  `tpe` VARCHAR(42),
  `espece` VARCHAR(42),
  `id_gerant` VARCHAR(42),
  PRIMARY KEY (`id_vente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `REMBOURSEMENT_DIRECTION` ADD FOREIGN KEY (`id_cred_dir`) REFERENCES `CREDIT_DIRECTION` (`id_cred_dir`);
ALTER TABLE `REMBOURSEMENT_GERANT` ADD FOREIGN KEY (`id_cred_ger`) REFERENCES `CREDIT_GERANT` (`id_cred_ger`);
ALTER TABLE `CREDIT_DIRECTION` ADD FOREIGN KEY (`id_direction`) REFERENCES `DIRECTION` (`id_direction`);
ALTER TABLE `CREDIT_DIRECTION` ADD FOREIGN KEY (`id_produit`) REFERENCES `PRODUIT` (`id_produit`);
ALTER TABLE `CREDIT_DIRECTION` ADD FOREIGN KEY (`id_client`) REFERENCES `CLIENT` (`id_client`);
ALTER TABLE `CREDIT_GERANT` ADD FOREIGN KEY (`id_gerant`) REFERENCES `GERANT` (`id_gerant`);
ALTER TABLE `CREDIT_GERANT` ADD FOREIGN KEY (`id_client`) REFERENCES `CLIENT` (`id_client`);
ALTER TABLE `CREDIT_GERANT` ADD FOREIGN KEY (`id_produit`) REFERENCES `PRODUIT` (`id_produit`);
ALTER TABLE `VERSEMENT` ADD FOREIGN KEY (`id_banque`) REFERENCES `BANQUE` (`id_banque`);
ALTER TABLE `VERSEMENT` ADD FOREIGN KEY (`id_gerant`) REFERENCES `GERANT` (`id_gerant`);
ALTER TABLE `COMMANDE` ADD FOREIGN KEY (`id_produit`) REFERENCES `PRODUIT` (`id_produit`);
ALTER TABLE `COMMANDE` ADD FOREIGN KEY (`id_gerant`) REFERENCES `GERANT` (`id_gerant`);
ALTER TABLE `POMPE` ADD FOREIGN KEY (`id_cuve`) REFERENCES `CUVE` (`id_cuve`);
ALTER TABLE `CUVE` ADD FOREIGN KEY (`id_station`) REFERENCES `STATION` (`id_station`);
ALTER TABLE `CUVE` ADD FOREIGN KEY (`id_produit`) REFERENCES `PRODUIT` (`id_produit`);
ALTER TABLE `STATION` ADD FOREIGN KEY (`id_gerant`) REFERENCES `GERANT` (`id_gerant`);
ALTER TABLE `POMPISTE` ADD FOREIGN KEY (`id_station`) REFERENCES `STATION` (`id_station`);
ALTER TABLE `LIVRAISON` ADD FOREIGN KEY (`id_camion`) REFERENCES `CAMION` (`id_camion`);
ALTER TABLE `LIVRAISON` ADD FOREIGN KEY (`id_direction`) REFERENCES `DIRECTION` (`id_direction`);
ALTER TABLE `LIVRAISON` ADD FOREIGN KEY (`id_produit`) REFERENCES `PRODUIT` (`id_produit`);
ALTER TABLE `LIVRAISON` ADD FOREIGN KEY (`id_chauffeur`) REFERENCES `CHAUFFEUR` (`id_chauffeur`);
ALTER TABLE `VENTE` ADD FOREIGN KEY (`id_gerant`) REFERENCES `GERANT` (`id_gerant`);