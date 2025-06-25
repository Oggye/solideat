-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 24 avr. 2025 à 10:30
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `solideat`
--

-- --------------------------------------------------------

--
-- Structure de la table `app_avis`
--

DROP TABLE IF EXISTS `app_avis`;
CREATE TABLE IF NOT EXISTS `app_avis` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `note` int NOT NULL,
  `commentaire` varchar(255) NOT NULL,
  `date_avis` datetime(6) NOT NULL,
  `visbile` tinyint(1) NOT NULL,
  `restaurant_id` bigint NOT NULL,
  `utilisateur_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_avis_restaurant_id_42b80601` (`restaurant_id`),
  KEY `app_avis_utilisateur_id_5f004eee` (`utilisateur_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `app_contient`
--

DROP TABLE IF EXISTS `app_contient`;
CREATE TABLE IF NOT EXISTS `app_contient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `panier_id` bigint NOT NULL,
  `produit_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_contient_panier_id_dc51e49e` (`panier_id`),
  KEY `app_contient_produit_id_6a1dbdd4` (`produit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `app_historiques`
--

DROP TABLE IF EXISTS `app_historiques`;
CREATE TABLE IF NOT EXISTS `app_historiques` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `statut` varchar(100) NOT NULL,
  `type_operation` varchar(255) NOT NULL,
  `date_historique` datetime(6) NOT NULL,
  `produit_id` bigint NOT NULL,
  `utilisateur_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_historiques_produit_id_f67807c3` (`produit_id`),
  KEY `app_historiques_utilisateur_id_7eafc8b1` (`utilisateur_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `app_panier`
--

DROP TABLE IF EXISTS `app_panier`;
CREATE TABLE IF NOT EXISTS `app_panier` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `montant_total` decimal(8,2) NOT NULL,
  `type_operation` varchar(100) NOT NULL,
  `date_ajout` datetime(6) NOT NULL,
  `utilisateur_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_panier_utilisateur_id_8ed16671` (`utilisateur_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `app_produits`
--

DROP TABLE IF EXISTS `app_produits`;
CREATE TABLE IF NOT EXISTS `app_produits` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom_produit` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `prix` decimal(6,2) NOT NULL,
  `stock` int NOT NULL,
  `restaurant_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_produits_restaurant_id_471acd27` (`restaurant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `app_restaurants`
--

DROP TABLE IF EXISTS `app_restaurants`;
CREATE TABLE IF NOT EXISTS `app_restaurants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom_restaurant` varchar(100) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `code` varchar(5) NOT NULL,
  `description` longtext,
  `actif` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `app_restaurants`
--

INSERT INTO `app_restaurants` (`id`, `nom_restaurant`, `adresse`, `ville`, `code`, `description`, `actif`) VALUES
(1, 'VERDUN', '14, AVENUE DE VERDUN', 'PARIS', '75010', '48.876266, 2.361942', 1),
(2, 'AVE MARIA', '4, RUE DE L\'AVE MARIA', 'PARIS', '75004', '48.852746, 2.360534', 1),
(3, 'ARBUSTES', '9, RUE DES ARBUSTES', 'PARIS', '75014', '48.828431, 2.309284', 1),
(4, 'CAULAINCOURT', '102, RUE DE CAULAINCOURT', 'PARIS', '75018', '48.889552, 2.339419', 1),
(5, 'JARDIN DES PLANTES', '18-22, RUE POLIVEAU', 'PARIS', '75005', '48.840346, 2.359412', 1),
(6, '', '', '', '75013', '', 1),
(7, 'CHARCOT', '15, RUE CHARCOT', 'PARIS', '75013', '48.830738, 2.371272', 1),
(8, 'CHANZY', '6, RUE DE CHANZY', 'PARIS', '75011', '48.852411, 2.3825250000000002', 1),
(9, 'BEAUNIER', '43, RUE BEAUNIER', 'PARIS', '75014', '48.824459, 2.327765', 1),
(10, 'MOUFFETARD', '20, RUE ORTOLAN', 'PARIS', '75005', '48.843234, 2.349667', 1),
(11, 'NAVARIN', '12, RUE DE NAVARIN', 'PARIS', '75009', '48.879688, 2.338996', 1),
(12, 'ARAGO', '49, BOULEVARD ARAGO', 'PARIS', '75013', '48.834785, 2.345384', 1),
(13, 'SAINT-ELOI', '10, RUE EUGENIE EBOUE', 'PARIS', '75012', '48.845593, 2.38601', 1),
(14, 'JOUVENET', '23, RUE JOUVENET', 'PARIS', '75016', '48.842528, 2.265355', 1),
(15, 'TOURELLES', '22, RUE DU CHAFFAULT', 'PARIS', '75012', '48.845159, 2.415046', 1),
(16, 'AU PETIT REMOULEUR', '1, RUE DE FOURCY', 'PARIS', '75004', '48.854622, 2.358803', 1),
(17, 'BRECHE AUX LOUPS', '32, RUE DE LA BRECHE AUX LOUPS', 'PARIS', '75012', '48.837994, 2.394822', 1),
(18, 'MADELEINE BEJART', '4, RUE DE LA PERLE', 'PARIS', '75003', '48.859373, 2.3619310000000002', 1),
(19, 'LES ARTISTES', '55-57, RUE DU MONTPARNASSE', 'PARIS', '75014', '48.841966, 2.325587', 1),
(20, 'CLIGNANCOURT', '14-16, SQUARE CLIGNANCOURT', 'PARIS', '75018', '48.893493, 2.347233', 1),
(21, 'ANDRE MALRAUX', '112, RUE DE RENNES', 'PARIS', '75006', '48.847869, 2.327529', 1),
(22, 'SAINTS-SIMONIENS', '18, RUE DE LA DUEE', 'PARIS', '75020', '48.871268, 2.396821', 1),
(23, 'TERNES', '28, RUE BAYEN', 'PARIS', '75017', '48.880881, 2.293319', 1),
(24, 'MARCHE DE L\'EUROPE', '11, RUE MALLEVILLE', 'PARIS', '75008', '48.877284, 2.313452', 1),
(25, 'LA QUINTINIE', '18, RUE BARGUE', 'PARIS', '75015', '48.839301, 2.30718', 1),
(26, 'AU MAIRE', '2, RUE AU MAIRE', 'PARIS', '75003', '48.864445, 2.357714', 1),
(27, 'JOSEPH DE MAISTRE', '88, RUE JOSEPH DE MAISTRE', 'PARIS', '75018', '48.89289, 2.330458', 1),
(28, 'BOUTEBRIE', '15, RUE DE LA PARCHEMINERIE', 'PARIS', '75005', '48.851629, 2.344985', 1),
(29, 'TANGER', '32, RUE DE TANGER', 'PARIS', '75019', '48.888726, 2.371022', 1),
(30, 'SAINT-BLAISE', '2, RUE DU CLOS', 'PARIS', '75020', '48.85636, 2.4061019999999997', 1),
(31, 'MAINE', '203, AVENUE DU MAINE', 'PARIS', '75014', '48.829248, 2.326551', 1),
(32, 'TOUR DES DAMES', '8, RUE DE LA TOUR DES DAMES', 'paris', '75009', '48.877809, 2.33344', 1),
(33, 'LEPRINCE', '109, RUE SAINT-DOMINIQUE', 'PARIS', '75007', '48.859301, 2.305783', 1),
(34, 'OSCAR ROTY', '107, RUE DE LOURMEL', 'PARIS', '75015', '48.842921, 2.286317', 1),
(35, 'OMER TALON', '33-37, RUE MERLIN', 'PARIS', '75011', '48.861868, 2.38454', 1),
(36, 'L\'OASIS', '15, RUE DE LAGHOUAT', 'PARIS', '75018', '48.887842, 2.354807', 1),
(37, 'PORT ROYAL', '88, BOULEVARD DE PORT ROYAL', 'PARIS', '75005', '48.839183, 2.339248', 1),
(38, 'VAUGELAS', '4, RUE VAUGELAS', 'PARIS', '75015', '48.834439, 2.294917', 1),
(39, 'CLAUDE VELLEFAUX', '66, AVENUE CLAUDE VELLEFAUX', 'PARIS', '75010', '48.876954, 2.370357', 1),
(40, 'SAINT-SAUVEUR', '8, RUE SAINT-SAUVEUR', 'PARIS', '75002', '48.865929, 2.349476', 1),
(41, 'GRAMONT', '28, RUE GRAMONT', 'PARIS', '75002', '48.870961, 2.33703', 1),
(42, 'TOLBIAC', '166, RUE DE TOLBIAC', 'PARIS', '75013', '48.826031, 2.352555', 1),
(43, 'EPINETTES', '51, RUE DES EPINETTES', 'PARIS', '75017', '48.896416, 2.323344', 1);

-- --------------------------------------------------------

--
-- Structure de la table `app_utilisateurs`
--

DROP TABLE IF EXISTS `app_utilisateurs`;
CREATE TABLE IF NOT EXISTS `app_utilisateurs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `actif` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add panier', 7, 'add_panier'),
(26, 'Can change panier', 7, 'change_panier'),
(27, 'Can delete panier', 7, 'delete_panier'),
(28, 'Can view panier', 7, 'view_panier'),
(29, 'Can add produits', 8, 'add_produits'),
(30, 'Can change produits', 8, 'change_produits'),
(31, 'Can delete produits', 8, 'delete_produits'),
(32, 'Can view produits', 8, 'view_produits'),
(33, 'Can add restaurants', 9, 'add_restaurants'),
(34, 'Can change restaurants', 9, 'change_restaurants'),
(35, 'Can delete restaurants', 9, 'delete_restaurants'),
(36, 'Can view restaurants', 9, 'view_restaurants'),
(37, 'Can add utilisateurs', 10, 'add_utilisateurs'),
(38, 'Can change utilisateurs', 10, 'change_utilisateurs'),
(39, 'Can delete utilisateurs', 10, 'delete_utilisateurs'),
(40, 'Can view utilisateurs', 10, 'view_utilisateurs'),
(41, 'Can add contient', 11, 'add_contient'),
(42, 'Can change contient', 11, 'change_contient'),
(43, 'Can delete contient', 11, 'delete_contient'),
(44, 'Can view contient', 11, 'view_contient'),
(45, 'Can add historiques', 12, 'add_historiques'),
(46, 'Can change historiques', 12, 'change_historiques'),
(47, 'Can delete historiques', 12, 'delete_historiques'),
(48, 'Can view historiques', 12, 'view_historiques'),
(49, 'Can add avis', 13, 'add_avis'),
(50, 'Can change avis', 13, 'change_avis'),
(51, 'Can delete avis', 13, 'delete_avis'),
(52, 'Can view avis', 13, 'view_avis');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'app', 'panier'),
(8, 'app', 'produits'),
(9, 'app', 'restaurants'),
(10, 'app', 'utilisateurs'),
(11, 'app', 'contient'),
(12, 'app', 'historiques'),
(13, 'app', 'avis');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-04-24 10:09:51.489605'),
(2, 'auth', '0001_initial', '2025-04-24 10:09:51.790445'),
(3, 'admin', '0001_initial', '2025-04-24 10:09:51.899163'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-04-24 10:09:51.914841'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-04-24 10:09:51.926596'),
(6, 'app', '0001_initial', '2025-04-24 10:09:52.335665'),
(7, 'contenttypes', '0002_remove_content_type_name', '2025-04-24 10:09:52.403635'),
(8, 'auth', '0002_alter_permission_name_max_length', '2025-04-24 10:09:52.424128'),
(9, 'auth', '0003_alter_user_email_max_length', '2025-04-24 10:09:52.474890'),
(10, 'auth', '0004_alter_user_username_opts', '2025-04-24 10:09:52.474890'),
(11, 'auth', '0005_alter_user_last_login_null', '2025-04-24 10:09:52.501458'),
(12, 'auth', '0006_require_contenttypes_0002', '2025-04-24 10:09:52.502718'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2025-04-24 10:09:52.506229'),
(14, 'auth', '0008_alter_user_username_max_length', '2025-04-24 10:09:52.524130'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2025-04-24 10:09:52.540268'),
(16, 'auth', '0010_alter_group_name_max_length', '2025-04-24 10:09:52.572141'),
(17, 'auth', '0011_update_proxy_permissions', '2025-04-24 10:09:52.583986'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2025-04-24 10:09:52.600630'),
(19, 'sessions', '0001_initial', '2025-04-24 10:09:52.620087');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
