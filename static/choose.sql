-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 22, 2016 at 04:15 PM
-- Server version: 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `choose`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_type`
--

CREATE TABLE `account_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `amenity`
--

CREATE TABLE `amenity` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `name_en` varchar(1000) DEFAULT NULL,
  `photo` int(100) DEFAULT NULL,
  `caption` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `amenity_hotel`
--

CREATE TABLE `amenity_hotel` (
  `id` int(11) NOT NULL,
  `amenity` int(100) DEFAULT NULL,
  `hotel` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `type_user` int(100) DEFAULT NULL,
  `phone` int(100) DEFAULT NULL,
  `city` int(100) DEFAULT NULL,
  `photo` int(100) DEFAULT NULL,
  `seller` int(100) DEFAULT NULL,
  `pais` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `type_user`, `phone`, `city`, `photo`, `seller`, `pais`) VALUES
(1, 'pbkdf2_sha256$24000$7IbL5EfMyuLx$adI8Q4mc/ehR1Ecl6KZJy/pvQjORZXIMkP1P+rAliUw=', NULL, 1, 'admin', 'Admin', '', 'admin@choosebookit', 1, 1, '2016-11-21 17:06:43.928391', 2, 980729169, NULL, 3, 949494, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `choose_template`
--

CREATE TABLE `choose_template` (
  `id` int(100) NOT NULL,
  `hotel` int(100) DEFAULT NULL,
  `template` int(100) DEFAULT NULL,
  `precio` int(100) DEFAULT NULL,
  `extrasingle` tinyint(1) DEFAULT NULL,
  `doublesingle` tinyint(1) DEFAULT NULL,
  `max_occupancy` int(100) DEFAULT NULL,
  `adults` int(100) DEFAULT NULL,
  `childrens` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `region` int(100) DEFAULT NULL,
  `photo` int(100) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `region`, `photo`, `caption`, `name_en`) VALUES
(1, 'Huarmey', NULL, NULL, 'dist/img/cities/huarmey.jpg', 'Huarmey'),
(4, 'Iquitos', NULL, NULL, 'dist/img/cities/iquitos.jpg', 'Iquitos'),
(5, 'Bagua Grande', NULL, NULL, 'dist/img/cities/bagua.jpg', 'Bagua Grande'),
(6, 'Chachapoyas', NULL, NULL, 'dist/img/cities/chachapoyas.jpg', 'Chachapoyas'),
(7, 'Bagua', NULL, NULL, 'dist/img/cities/bagua.jpg', 'Bagua'),
(8, 'Chimbote', NULL, NULL, 'dist/img/cities/chimbote.jpg', 'Chimbote'),
(9, 'Huaraz', NULL, NULL, 'dist/img/cities/huaraz.jpg', 'Huaraz'),
(10, 'Casma', NULL, NULL, 'dist/img/cities/casma.jpg', 'Casma'),
(11, 'Abancay', NULL, NULL, 'dist/img/cities/abancay.jpg', 'Abancay'),
(12, 'Andahuaylas', NULL, NULL, 'dist/img/cities/andahuaylas.jpg', 'Andahuaylas'),
(13, 'Lima', NULL, NULL, 'dist/img/cities/lima.jpg', 'Lima'),
(14, 'Huacho', NULL, NULL, 'dist/img/cities/huacho.jpg', 'Huacho'),
(15, 'Huaral', NULL, NULL, 'dist/img/cities/huaral.jpg', 'Huaral'),
(16, 'Cañete', NULL, NULL, 'dist/img/cities/canete.jpg', 'Cañete'),
(17, 'Barranca', NULL, NULL, 'dist/img/cities/barranca.jpg', 'Barranca'),
(18, 'Chancay', NULL, NULL, 'dist/img/cities/chancay.jpg', 'Chancay'),
(19, 'Paramonga', NULL, NULL, 'dist/img/cities/paramonga.jpg', 'Paramonga'),
(20, 'Arequipa', NULL, NULL, 'dist/img/cities/arequipa.jpg', 'Arequipa'),
(21, 'Mollendo', NULL, NULL, 'dist/img/cities/mollendo.jpg', 'Mollendo'),
(22, 'Camana', NULL, NULL, 'dist/img/cities/camana.jpg', 'Camana'),
(24, 'Yurimaguas', NULL, NULL, 'dist/img/cities/yurimaguas.jpg', 'Yurimaguas'),
(25, 'Requena', NULL, NULL, 'dist/img/cities/requena.jpg', 'Requena'),
(26, 'Ayacucho', NULL, NULL, 'dist/img/cities/ayacucho.jpg', 'Ayacucho'),
(27, 'Huanta', NULL, NULL, 'dist/img/cities/huanta.jpg', 'Huanta'),
(28, 'Puerto Maldonado', NULL, NULL, 'dist/img/cities/maldonado.jpg', 'Puerto Maldonado'),
(30, 'Jaen', NULL, NULL, 'dist/img/cities/jaen.jpg', 'Jaen'),
(31, 'Chota', NULL, NULL, 'dist/img/cities/chota.jpg', 'Chota'),
(32, 'Celendin', NULL, NULL, 'dist/img/cities/celendin.jpg', 'Celendin'),
(33, 'Moquegua', NULL, NULL, 'dist/img/cities/moquegua.jpg', 'Moquegua'),
(34, 'Ilo', NULL, NULL, 'dist/img/cities/ilo.jpg', 'Ilo'),
(35, 'Callao', NULL, NULL, 'dist/img/cities/callao.jpg', 'Callao'),
(36, 'Cerro de Pasco', NULL, NULL, 'dist/img/cities/cerrodepasco.jpg', 'Cerro de Pasco'),
(37, 'Cuzco', NULL, NULL, 'dist/img/cities/cuzco.jpg', 'Cuzco'),
(38, 'Sicuani', NULL, NULL, 'dist/img/cities/sicuani.jpg', 'Sicuani'),
(39, 'Quillabamba', NULL, NULL, 'dist/img/cities/quillabamba.jpg', 'Quillabamba'),
(40, 'Espinar', NULL, NULL, 'dist/img/cities/espinar.jpg', 'Espinar'),
(41, 'Piura', NULL, NULL, 'dist/img/cities/piura.jpg', 'Piura'),
(42, 'Sullana', NULL, NULL, 'dist/img/cities/sullana.jpg', 'Sullana'),
(43, 'Paita', NULL, NULL, 'dist/img/cities/paita.jpg', 'Paita'),
(44, 'Talara', NULL, NULL, 'dist/img/cities/talara.jpg', 'Talara'),
(45, 'Catacaos', NULL, NULL, 'dist/img/cities/catacaos.jpg', 'Catacaos'),
(46, 'Chulucanas', NULL, NULL, 'dist/img/cities/chulucanas.jpg', 'Chulucanas'),
(47, 'Sechura', NULL, NULL, 'dist/img/cities/sechura.jpg', 'Sechura'),
(48, 'Huancavelica', NULL, NULL, 'dist/img/cities/huancavelica.jpg', 'Huancavelica'),
(49, 'Juliaca', NULL, NULL, 'dist/img/cities/juliaca.jpg', 'Juliaca'),
(50, 'Puno', NULL, NULL, 'dist/img/cities/puno.jpg', 'Puno'),
(51, 'Azangaro', NULL, NULL, 'dist/img/cities/azangaro.jpg', 'Azangaro'),
(52, 'Huanuco', NULL, NULL, 'dist/img/cities/huanuco.jpg', 'Huanuco'),
(53, 'Tingo Maria', NULL, NULL, 'dist/img/cities/tingomaria.jpg', 'Tingo Maria'),
(54, 'Tarapoto', NULL, NULL, 'dist/img/cities/tarapoto.jpg', 'Tarapoto'),
(55, 'Moyobamba', NULL, NULL, 'dist/img/cities/moyobamba.jpg', 'Moyobamba'),
(56, 'Juanjui', NULL, NULL, 'dist/img/cities/juanjui.jpg', 'Juanjui'),
(57, 'Rioja', NULL, NULL, 'dist/img/cities/rioja.jpg', 'Rioja'),
(58, 'Ica', NULL, NULL, 'dist/img/cities/ica.jpg', 'Ica'),
(59, 'Chincha Alta', NULL, NULL, 'dist/img/cities/chincha.jpg', 'Chincha Alta'),
(60, 'Pisco', NULL, NULL, 'dist/img/cities/pisco.jpg', 'Pisco'),
(61, 'Nazca', NULL, NULL, 'dist/img/cities/nazca.jpg', 'Nazca'),
(62, 'Tacna', NULL, NULL, 'dist/img/cities/tacna.jpg', 'Tacna'),
(63, 'Huancayo', NULL, NULL, 'dist/img/cities/huancayo.jpg', 'Huancayo'),
(64, 'Tarma', NULL, NULL, 'dist/img/cities/tarma.jpg', 'Tarma'),
(65, 'Jauja', NULL, NULL, 'dist/img/cities/jauja.jpg', 'Jauja'),
(66, 'La Oroya', NULL, NULL, 'dist/img/cities/oroya.jpg', 'La Oroya'),
(67, 'Tumbes', NULL, NULL, 'dist/img/cities/tumbes.jpg', 'Tumbes'),
(68, 'Zarumilla', NULL, NULL, 'dist/img/cities/zarumilla.jpg', 'Zarumilla'),
(69, 'Trujillo', NULL, NULL, 'dist/img/cities/trujillo.jpg', 'Trujillo'),
(70, 'Chepen', NULL, NULL, 'dist/img/cities/chepen.jpg', 'Chepen'),
(71, 'Pacasmayo', NULL, NULL, 'dist/img/cities/pacasmayo.jpg', 'Pacasmayo'),
(72, 'Guadalupe', NULL, NULL, 'dist/img/cities/guadalupe.jpg', 'Guadalupe'),
(73, 'Casa Grande', NULL, NULL, 'dist/img/cities/casagrande.jpg', 'Casa Grande'),
(74, 'Pucallpa', NULL, NULL, 'dist/img/cities/iquitos.jpg', 'Pucallpa'),
(75, 'Cajamarca', NULL, NULL, 'dist/img/cities/cajamarca.jpg', 'Cajamarca');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `extrabed_roomtemplate`
--

CREATE TABLE `extrabed_roomtemplate` (
  `id` int(11) NOT NULL,
  `room` int(100) DEFAULT NULL,
  `extra_bed` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `extra_bed`
--

CREATE TABLE `extra_bed` (
  `id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `child_occupancy` varchar(100) DEFAULT NULL,
  `adult_occupancy` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `star` int(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `description_es` varchar(1000) DEFAULT NULL,
  `tripadvisor` int(100) DEFAULT NULL,
  `photo` int(100) DEFAULT NULL,
  `city` int(100) DEFAULT NULL,
  `account_type` int(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `account_number` int(100) DEFAULT NULL,
  `user` int(100) DEFAULT NULL,
  `hold_limit` int(100) DEFAULT NULL,
  `price` int(100) DEFAULT NULL,
  `featured` int(100) DEFAULT NULL,
  `later` int(100) DEFAULT NULL,
  `status` int(100) DEFAULT NULL,
  `politics` varchar(2000) DEFAULT NULL,
  `politics_es` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_roomtemplate`
--

CREATE TABLE `hotel_roomtemplate` (
  `id` int(100) NOT NULL,
  `hotel` int(100) DEFAULT NULL,
  `roomtemplate` int(100) DEFAULT NULL,
  `precio` int(100) DEFAULT NULL,
  `extrasingle` int(1) DEFAULT '0',
  `extradouble` tinyint(1) DEFAULT NULL,
  `max_occupancy` int(100) DEFAULT NULL,
  `childrens` int(100) DEFAULT NULL,
  `adults` int(100) DEFAULT NULL,
  `privatebathrom` int(100) DEFAULT NULL,
  `photo` int(100) DEFAULT '17',
  `activate` int(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interest`
--

CREATE TABLE `interest` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `name_en` varchar(100) NOT NULL,
  `name_fr` varchar(100) NOT NULL,
  `searchable` varchar(100) DEFAULT NULL,
  `photo` int(100) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interest`
--

INSERT INTO `interest` (`id`, `name`, `name_en`, `name_fr`, `searchable`, `photo`, `caption`) VALUES
(1, 'Gastronomia', 'Gastronomy', '', NULL, NULL, 'dist/img/SVG/dish.svg'),
(2, 'Equitacion', 'Horse', '', NULL, NULL, 'dist/img/SVG/black-head-horse-side-view-with-horsehair.svg'),
(3, 'Ciclismo', 'Biking', '', NULL, NULL, 'dist/img/SVG/bycicle.svg'),
(4, 'Playa', 'Beach', '', NULL, NULL, 'dist/img/SVG/beach-umbrella.svg'),
(5, 'Canoe', 'Canoes', '', NULL, NULL, 'dist/img/SVG/kayak.svg'),
(6, 'Caminata', 'Hiking', '', NULL, NULL, 'dist/img/SVG/one-man-walking.svg'),
(7, 'Sandboard', 'Sandboard', '', NULL, NULL, 'dist/img/SVG/skier.svg'),
(8, 'Natacion', 'Swimming', '', NULL, NULL, 'dist/img/SVG/swimming-figure.svg'),
(9, 'Naturaleza', 'Naturality', '', NULL, NULL, 'dist/img/SVG/leaf.svg'),
(10, 'Relajacion', 'Relaxation', '', NULL, NULL, 'dist/img/SVG/leaf.svg'),
(11, 'Paisajes', 'Landscapes', '', NULL, NULL, 'dist/img/SVG/mountain.svg'),
(12, 'Gente Amable', 'Friendly People', '', NULL, NULL, 'dist/img/SVG/usuarios-multiples-en-silueta.svg'),
(13, 'Pasear', 'Walking', '', NULL, NULL, 'dist/img/SVG/icon.svg'),
(14, 'Paseo por la naturaleza', 'Nature Walks', '', NULL, NULL, 'dist/img/SVG/tree-silhouette.svg'),
(15, 'Senderismo', 'Trekking', '', NULL, NULL, 'dist/img/SVG/hiking.svg'),
(16, 'Rutas Turisticas', 'Routes Touristic', '', NULL, NULL, 'dist/img/SVG/pointer-on-map.svg'),
(49, 'Distraccion', 'Distraction', '', NULL, NULL, NULL),
(50, 'Bolos', 'Bolos', '', NULL, NULL, NULL),
(51, 'Pesca', 'Fish', '', NULL, NULL, 'dist/img/SVG/fishes-silhouette.svg'),
(52, '232', '3232', '', NULL, NULL, NULL),
(53, 'Music', 'Music', '', NULL, NULL, 'dist/img/SVG/music-player.svg'),
(54, 'Circo', 'Circo', '', NULL, NULL, NULL),
(55, 'Cata de vinos', 'Cata de vinos', '', NULL, NULL, NULL),
(58, 'Compras', 'Shopping', '', '', NULL, 'dist/img/SVG/shopping-cart.svg'),
(61, 'Viajes en coche', 'Road Trips', '', '', NULL, 'dist/img/SVG/car-garage.svg'),
(62, 'Romántico', 'Romantic', '', '', NULL, 'dist/img/SVG/corazon-forma-negra-para-san-valentin.svg'),
(65, 'Historia', 'Downhill Skiing', '', '', NULL, 'dist/img/SVG/pyramids.svg'),
(68, 'Tranquilidad', 'Tranquility', '', '', NULL, 'dist/img/SVG/leaf.svg'),
(71, 'Comida', 'Food', '', '', NULL, 'dist/img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),
(76, 'Rural', 'Countryside', '', '', NULL, 'dist/img/SVG/leaf.svg'),
(77, 'Restaurantes', 'Restaurants', '', '', NULL, 'dist/img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),
(78, 'Ambiente familiar', 'Family Friendly', '', '', NULL, 'dist/img/SVG/familia-en-silueta.svg'),
(79, 'Buen ambiente', 'Ambiance', '', '', NULL, 'dist/img/SVG/familia-en-silueta.svg'),
(80, 'Cocina gourmet', 'Gourmet Food', '', '', NULL, 'dist/img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),
(82, 'Actividades al aire libre', 'Outdoor Activities', '', '', NULL, 'dist/img/SVG/leaf.svg'),
(83, 'Museos', 'Museums', '', '', NULL, 'dist/img/SVG/banco.svg'),
(84, 'Comida local', 'Local Food', '', '', NULL, 'dist/img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),
(85, 'Buen ambiente', 'Atmosphere', '', '', NULL, 'dist/img/SVG/familia-en-silueta.svg'),
(86, 'Aire puro', 'Clean Air', '', '', NULL, 'dist/img/SVG/leaf.svg'),
(87, 'Montaña', 'Mountains', '', '', NULL, 'dist/img/SVG/snowed-mountains.svg'),
(88, 'Observar estrellas', 'Stargazing', '', '', NULL, 'dist/img/SVG/night.svg'),
(90, 'Limpieza', 'Cleanliness', '', '', NULL, 'dist/img/SVG/lavadora.svg'),
(91, 'Cenas de lujo', 'Fine Dining', '', '', NULL, 'dist/img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),
(92, 'Centro histórico', 'Old Town', '', '', NULL, 'dist/img/SVG/pyramids.svg'),
(94, 'Paseos por la montaña', 'Mountain Walks', '', '', NULL, 'dist/img/SVG/snowed-mountains.svg'),
(96, 'Económico', 'Budget Friendly', '', '', NULL, 'dist/img/SVG/economic-investment.svg'),
(97, 'Arquitectura', 'Architecture', '', '', NULL, 'dist/img/SVG/pyramids.svg'),
(98, 'Paseos por la playa', 'Beach Walks', '', '', NULL, 'dist/img/SVG/beach-umbrella.svg'),
(99, 'Monumentos', 'Monuments', '', '', NULL, 'dist/img/SVG/pyramids.svg'),
(100, 'Piscinas', 'Swimming Pools', '', '', NULL, 'dist/img/SVG/swimming-figure.svg'),
(101, 'Excursiones', 'Excursions', '', '', NULL, 'dist/img/SVG/BEACH/All-terrain-vehicle.svg'),
(102, 'Cocina tradicional', 'Traditional Food', '', '', NULL, 'dist/img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),
(103, 'Paseos por la ciudad', 'City Walks', '', '', NULL, 'dist/img/SVG/apartamentos.svg'),
(104, 'Escapada urbana', 'City Trip', '', '', NULL, 'dist/img/SVG/coche-con-equipaje.svg'),
(105, 'Costa', 'Seaside', '', '', NULL, 'dist/img/SVG/beach-umbrella.svg'),
(106, 'Bañarse en ríos y lagos', 'Wild Swimming', '', '', NULL, 'dist/img/SVG/swimming-figure.svg'),
(108, 'Playas de arena', 'Sand Beaches', '', '', NULL, 'dist/img/SVG/beach-umbrella.svg'),
(109, 'Castillos', 'Castles', '', '', NULL, 'dist/img/SVG/tower.svg'),
(110, 'Comer pescado y marisco', 'Seafood', '', '', NULL, 'dist/img/SVG/fish-with-four-bubbles.svg'),
(111, 'Hacer turismo', 'Tourism', '', '', NULL, 'dist/img/SVG/coche-con-equipaje.svg'),
(112, 'Bosques bonitos', 'Beautiful Forests', '', '', NULL, 'dist/img/SVG/forest.svg'),
(113, 'Flora y fauna', 'Wildlife', '', '', NULL, 'dist/img/SVG/huella-de-un-perro.svg'),
(114, 'Pesca', 'Fishing', '', '', NULL, 'dist/img/SVG/senal-de-pesca.svg'),
(115, 'Lugares antiguos', 'Ancient Landmarks', '', '', NULL, 'dist/img/SVG/piramides.svg'),
(117, 'Lagos', 'Lakes', '', '', NULL, 'dist/img/SVG/paisaje.svg'),
(118, 'Parques', 'Parks', '', '', NULL, 'dist/img/SVG/bosque.svg'),
(119, 'Aventura', 'Adventure', '', '', NULL, 'dist/img/SVG/cuerda.svg'),
(120, 'Paseos por la costa', 'Coastal Walks', '', '', NULL, 'dist/img/SVG/beach-umbrella.svg'),
(121, 'Días soleados', 'Sunny', '', '', NULL, 'dist/img/SVG/sol.svg'),
(122, 'Ocio nocturno', 'Nightlife', '', '', NULL, 'dist/img/SVG/night.svg'),
(123, 'Atardeceres', 'Sunsets', '', '', NULL, 'dist/img/SVG/sunset-fuji-mountain.svg'),
(124, 'Comida internacional', 'Culturally Diverse Food', '', '', NULL, 'dist/img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),
(125, 'Hacer negocios', 'Business', '', '', NULL, 'dist/img/SVG/money-bag-with-dollar-symbol.svg'),
(126, 'Golf', 'Golf', '', '', NULL, 'dist/img/SVG/golf-flag-and-field.svg'),
(127, 'Cafeterías', 'Cafés', '', '', NULL, 'dist/img/SVG/hot-coffee-rounded-cup-on-a-plate-from-side-view.svg'),
(128, 'Salir de bares', 'Bars', '', '', NULL, 'dist/img/SVG/beer.svg'),
(129, 'Vistas de la ciudad', 'Skyline', '', '', NULL, 'dist/img/SVG/city-buildings-silhouette.svg'),
(130, 'Tours', 'Tours', '', '', NULL, 'dist/img/SVG/coche-con-equipaje.svg'),
(131, 'Mercados', 'Markets', '', '', NULL, 'dist/img/SVG/megaphone.svg'),
(132, 'Ciclismo de montaña', 'Mountain Biking', '', '', NULL, 'dist/img/SVG/snowed-mountains.svg'),
(133, 'Buen acceso en transporte público', 'Convenient Public Transportation', '', '', NULL, 'dist/img/SVG/coche-con-equipaje.svg'),
(134, 'Playas familiares', 'Beaches for Kids', '', '', NULL, 'dist/img/SVG/beach-umbrella.svg'),
(135, 'Navegar en barco', 'Boating', '', '', NULL, 'dist/img/SVG/sea-ship.svg'),
(136, 'Comprar ropa', 'Clothes Shopping', '', '', NULL, 'dist/img/SVG/shopping-cart.svg'),
(137, 'Deportes acuáticos', 'Water Sports', '', '', NULL, 'dist/img/SVG/swimming-figure.svg'),
(138, 'Música en directo', 'Live Music', '', '', NULL, 'dist/img/SVG/music-player.svg'),
(139, 'Bosque', 'Forest', '', '', NULL, 'dist/img/SVG/forest.svg'),
(140, 'Bienestar', 'Wellness', '', '', NULL, 'dist/img/SVG/plant-on-a-hand.svg'),
(141, 'Pasear con niños', 'Walking with Kids', '', '', NULL, 'dist/img/SVG/icon.svg'),
(142, 'Cocina vegetariana', 'Vegetarian cuisine', '', '', NULL, 'dist/img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),
(143, 'Ocio', 'Entertainment', '', '', NULL, 'dist/img/SVG/resting.svg'),
(144, 'Tomar el sol', 'Sunbathing', '', '', NULL, 'dist/img/SVG/tomar-el-sol.svg'),
(145, 'Comprar accesorios', 'Accessories Shopping', '', '', NULL, 'dist/img/SVG/shopping-cart.svg'),
(146, 'Salir de pubs', 'Pubs', '', '', NULL, 'dist/img/SVG/beer.svg'),
(147, 'Deporte', 'Sports', '', '', NULL, 'dist/img/SVG/futbol.svg'),
(148, 'Iglesias', 'Churches', '', '', NULL, 'dist/img/SVG/iglesia.svg'),
(149, 'Puerto', 'Harbor', '', '', NULL, 'dist/img/SVG/muelle-de-la-ciudad.svg'),
(150, 'Fotografía', 'Photography', '', '', NULL, 'dist/img/SVG/camara-de-fotos.svg'),
(151, 'Arte', 'Art', '', '', NULL, 'dist/img/SVG/paleta-de-pintor.svg'),
(152, 'Comprar comida', 'Food Shopping', '', '', NULL, 'dist/img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg'),
(153, 'Buceo', 'Diving', '', '', NULL, 'dist/img/SVG/diving-goggles.svg'),
(154, 'Cerveza', 'Beer', '', '', NULL, 'dist/img/SVG/beer.svg'),
(155, 'Viñedos', 'Vineyards', '', '', NULL, 'dist/img/SVG/racimo-de-uvas.svg'),
(156, 'Clima caluroso', 'Hot Weather', '', '', NULL, 'dist/img/SVG/sol.svg'),
(157, 'Observar aves', 'Bird Watching', '', '', NULL, 'dist/img/SVG/paloma.svg'),
(158, 'Snorkel', 'Snorkeling', '', '', NULL, 'dist/img/SVG/bucear.svg'),
(159, 'Destinos para casarse', 'Destination Weddings', '', '', NULL, 'dist/img/SVG/regalo.svg'),
(160, 'Montañismo', 'Mountaineering', '', '', NULL, 'dist/img/SVG/snowed-mountains.svg'),
(161, 'Aguas termales', 'Hot Springs', '', '', NULL, 'dist/img/SVG/arbol.svg'),
(162, 'Cultura alternativa', 'Alternative Culture', '', '', NULL, 'dist/img/SVG/pyramids.svg'),
(163, 'Museos de Arte', 'Fine Art Museums', '', '', NULL, 'dist/img/SVG/banco.svg'),
(164, 'Cascadas', 'Waterfalls', '', '', NULL, 'dist/img/SVG/cascada.svg'),
(165, 'Pasear con mascotas', 'Walking with Pets', '', '', NULL, 'dist/img/SVG/perro.svg'),
(166, 'Excursiones en kayak', 'Kayaking', '', '', NULL, 'dist/img/SVG/canoeing.svg'),
(167, 'Montar a caballo', 'Horseback Riding', '', '', NULL, 'dist/img/SVG/black-head-horse-side-view-with-horsehair.svg'),
(168, 'Jardin botanico', 'Botanical Garden', '', '', NULL, 'dist/img/SVG/planta.svg'),
(169, 'Comprar vino', 'Wine Shopping', '', '', NULL, 'dist/img/SVG/copa.svg'),
(170, 'Motociclismo', 'Motorcycling', '', '', NULL, 'dist/img/SVG/casco-de-motociclista-en-vista-lateral.svg'),
(171, 'Navegar', 'Sailing', '', '', NULL, 'dist/img/SVG/transportacion-maritima.svg'),
(172, 'Surf', 'Surfing', '', '', NULL, 'dist/img/SVG/navegar.svg'),
(173, 'Zoo', 'Zoo', '', '', NULL, 'dist/img/SVG/oso-mirando-a-la-derecha.svg'),
(174, 'Comprar antiguedades', 'Antiquing', '', '', NULL, 'dist/img/SVG/carro.svg'),
(175, 'Playas de guijarros', 'Riverside Walks', '', '', NULL, 'dist/img/SVG/beach-umbrella.svg'),
(176, 'Conocer gente', 'Meeting New People', '', '', NULL, 'dist/img/SVG/usuarios-multiples-en-silueta.svg'),
(177, 'Escalada', 'Climbing', '', '', NULL, 'dist/img/SVG/escalando-con-una-cuerda.svg'),
(178, 'Arqueologia', 'Archaeology', '', '', NULL, 'dist/img/SVG/piramide-del-sol.svg'),
(179, 'Catedral', 'Cathedral', '', '', NULL, 'dist/img/SVG/catedral-de-milan.svg'),
(180, 'Teatro', 'Theater', '', '', NULL, 'dist/img/SVG/mascaras-de-teatro.svg'),
(181, 'Deporte Invierno', 'Winter Sports', '', '', NULL, 'dist/img/SVG/zapatilla-de-correr.svg'),
(182, 'Cafe', 'Coffee', '', '', NULL, 'dist/img/SVG/cafe-caliente-en-taza-redondeada-en-un-plato-de-la-vista-lateral.svg'),
(183, 'Comida Saludable', 'Healthy Food', '', '', NULL, 'dist/img/SVG/covered-food-tray-on-a-hand-of-hotel-room-service.svg');

-- --------------------------------------------------------

--
-- Table structure for table `interest_hotel`
--

CREATE TABLE `interest_hotel` (
  `id` int(11) NOT NULL,
  `hotel` int(100) DEFAULT NULL,
  `interest` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(100) NOT NULL,
  `user` int(100) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(10000) DEFAULT NULL,
  `reservation` int(100) DEFAULT NULL,
  `hotel` int(100) DEFAULT NULL,
  `status` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `status` int(100) DEFAULT NULL,
  `type` int(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `amount` varchar(10) DEFAULT NULL,
  `transaction` varchar(10000) DEFAULT NULL,
  `reservation` int(100) DEFAULT NULL,
  `response` varchar(10000) DEFAULT NULL,
  `responseCode` varchar(100) DEFAULT NULL,
  `datepayment` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `api_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `caption` varchar(100) DEFAULT NULL,
  `hotels` int(100) DEFAULT NULL,
  `visible` int(10) DEFAULT NULL,
  `principal` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`id`, `name`, `url`, `date`, `caption`, `hotels`, `visible`, `principal`) VALUES
(1, NULL, NULL, NULL, 'static/descarga_3zAgUGI.jpg', NULL, NULL, NULL),
(2, NULL, NULL, NULL, 'static/02_chb_search_hotels.jpg', NULL, NULL, NULL),
(3, NULL, NULL, NULL, 'static/04_chb_choose_hotel_room.jpg', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reference`
--

CREATE TABLE `reference` (
  `id` int(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `city` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reference_hotel`
--

CREATE TABLE `reference_hotel` (
  `id` int(11) NOT NULL,
  `reference` int(100) DEFAULT NULL,
  `hotel` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `user` int(100) DEFAULT NULL,
  `traveler_name` varchar(255) DEFAULT NULL,
  `traveler_email` varchar(255) DEFAULT NULL,
  `traveler_mobile` int(11) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `checkindate` datetime DEFAULT NULL,
  `checkoutdate` datetime DEFAULT NULL,
  `status` int(100) DEFAULT NULL,
  `hotel` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_status`
--

CREATE TABLE `reservation_status` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `photo` int(100) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `roomstatus` int(100) DEFAULT NULL,
  `hotelroomtemplate` int(100) DEFAULT NULL,
  `hotel` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roomtemplate`
--

CREATE TABLE `roomtemplate` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_es` varchar(100) DEFAULT NULL,
  `default_bed` int(100) DEFAULT NULL,
  `total_occupancy_limit` int(100) DEFAULT NULL,
  `adult_occupancy_limit` int(100) DEFAULT NULL,
  `child_occupancy_limit` int(100) DEFAULT NULL,
  `bath` int(100) DEFAULT NULL,
  `status` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roomtemplate`
--

INSERT INTO `roomtemplate` (`id`, `name`, `name_es`, `default_bed`, `total_occupancy_limit`, `adult_occupancy_limit`, `child_occupancy_limit`, `bath`, `status`) VALUES
(1, 'Bed', 'Cama', 1, 20, 20, 0, 0, 1),
(2, 'Private Bed', 'Cama Privada', 1, 2, 2, 1, 0, 1),
(3, 'Single', 'Individual', 1, 2, 1, 1, 1, 1),
(4, 'Single Superior', 'Individual Superior', 1, 2, 1, 1, 1, 1),
(5, 'Double', 'Doble', 2, 4, 2, 2, 1, 1),
(6, 'Double Superior', 'Doble Superior', 2, 4, 2, 2, 1, 1),
(7, 'Triple', 'Triple', 3, 4, 3, 1, 1, 1),
(8, 'Triple Superior', 'Triple Superior', 3, 4, 3, 2, 1, 0),
(9, 'Suite', 'Suite', 2, 3, 2, 2, 1, 0),
(10, 'Suite Superior', 'Suite Superior', 2, 3, 2, 2, 1, 0),
(13, 'Template 1', NULL, 2, 2, 2, 2, 2, 0),
(14, 'Template 2', NULL, 2, 2, 2, 2, 2, 0),
(15, 'Template 3', NULL, 2, 1, 2, 1, 1, 0),
(16, 'Template 4', NULL, 2, 2, 2, 2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `room_reservation`
--

CREATE TABLE `room_reservation` (
  `id` int(11) NOT NULL,
  `reservation` int(100) DEFAULT NULL,
  `room` int(100) DEFAULT NULL,
  `child_occupants` int(100) DEFAULT NULL,
  `adult_occupants` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room_status`
--

CREATE TABLE `room_status` (
  `id` int(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tipo`
--

CREATE TABLE `tipo` (
  `id` int(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipo`
--

INSERT INTO `tipo` (`id`, `name`) VALUES
(1, 'User'),
(2, 'Admin'),
(3, 'Owner');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_type`
--
ALTER TABLE `account_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amenity`
--
ALTER TABLE `amenity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photo` (`photo`);

--
-- Indexes for table `amenity_hotel`
--
ALTER TABLE `amenity_hotel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amenity` (`amenity`),
  ADD KEY `hotel` (`hotel`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `tipo` (`type_user`) USING BTREE,
  ADD KEY `country` (`city`),
  ADD KEY `photo` (`photo`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `choose_template`
--
ALTER TABLE `choose_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region` (`region`),
  ADD KEY `photo` (`photo`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- Indexes for table `extrabed_roomtemplate`
--
ALTER TABLE `extrabed_roomtemplate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room` (`room`),
  ADD KEY `extra_bed` (`extra_bed`);

--
-- Indexes for table `extra_bed`
--
ALTER TABLE `extra_bed`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_type` (`account_type`),
  ADD KEY `city` (`city`),
  ADD KEY `user` (`user`),
  ADD KEY `photo` (`photo`);

--
-- Indexes for table `hotel_roomtemplate`
--
ALTER TABLE `hotel_roomtemplate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel` (`hotel`),
  ADD KEY `roomtemplate` (`roomtemplate`),
  ADD KEY `photo` (`photo`);

--
-- Indexes for table `interest`
--
ALTER TABLE `interest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photo` (`photo`);

--
-- Indexes for table `interest_hotel`
--
ALTER TABLE `interest_hotel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel` (`hotel`),
  ADD KEY `interests` (`interest`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservation` (`reservation`);

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel` (`hotels`);

--
-- Indexes for table `reference`
--
ALTER TABLE `reference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city` (`city`);

--
-- Indexes for table `reference_hotel`
--
ALTER TABLE `reference_hotel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference` (`reference`),
  ADD KEY `hotel` (`hotel`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `payment` (`payment`),
  ADD KEY `status` (`status`),
  ADD KEY `hotel` (`hotel`) USING BTREE;

--
-- Indexes for table `reservation_status`
--
ALTER TABLE `reservation_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`roomstatus`),
  ADD KEY `hotel` (`hotel`),
  ADD KEY `photo` (`photo`),
  ADD KEY `hotelroomtemplate` (`hotelroomtemplate`),
  ADD KEY `roomstatus` (`roomstatus`) USING BTREE;

--
-- Indexes for table `roomtemplate`
--
ALTER TABLE `roomtemplate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_reservation`
--
ALTER TABLE `room_reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room` (`room`),
  ADD KEY `reservation` (`reservation`);

--
-- Indexes for table `room_status`
--
ALTER TABLE `room_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_type`
--
ALTER TABLE `account_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `amenity`
--
ALTER TABLE `amenity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `amenity_hotel`
--
ALTER TABLE `amenity_hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `choose_template`
--
ALTER TABLE `choose_template`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `extrabed_roomtemplate`
--
ALTER TABLE `extrabed_roomtemplate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `extra_bed`
--
ALTER TABLE `extra_bed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hotel_roomtemplate`
--
ALTER TABLE `hotel_roomtemplate`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `interest`
--
ALTER TABLE `interest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;
--
-- AUTO_INCREMENT for table `interest_hotel`
--
ALTER TABLE `interest_hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `reference`
--
ALTER TABLE `reference`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reference_hotel`
--
ALTER TABLE `reference_hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reservation_status`
--
ALTER TABLE `reservation_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roomtemplate`
--
ALTER TABLE `roomtemplate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `room_reservation`
--
ALTER TABLE `room_reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `room_status`
--
ALTER TABLE `room_status`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `amenity`
--
ALTER TABLE `amenity`
  ADD CONSTRAINT `amenity_ibfk_1` FOREIGN KEY (`photo`) REFERENCES `photo` (`id`);

--
-- Constraints for table `amenity_hotel`
--
ALTER TABLE `amenity_hotel`
  ADD CONSTRAINT `amenity_hotel_ibfk_1` FOREIGN KEY (`amenity`) REFERENCES `amenity` (`id`),
  ADD CONSTRAINT `amenity_hotel_ibfk_2` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD CONSTRAINT `auth_user_ibfk_1` FOREIGN KEY (`type_user`) REFERENCES `tipo` (`id`),
  ADD CONSTRAINT `auth_user_ibfk_2` FOREIGN KEY (`city`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `auth_user_ibfk_3` FOREIGN KEY (`photo`) REFERENCES `photo` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`region`) REFERENCES `region` (`id`),
  ADD CONSTRAINT `city_ibfk_2` FOREIGN KEY (`photo`) REFERENCES `photo` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `extrabed_roomtemplate`
--
ALTER TABLE `extrabed_roomtemplate`
  ADD CONSTRAINT `extrabed_roomtemplate_ibfk_1` FOREIGN KEY (`room`) REFERENCES `room` (`id`),
  ADD CONSTRAINT `extrabed_roomtemplate_ibfk_2` FOREIGN KEY (`extra_bed`) REFERENCES `extra_bed` (`id`);

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_4` FOREIGN KEY (`city`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `hotel_ibfk_5` FOREIGN KEY (`photo`) REFERENCES `photo` (`id`),
  ADD CONSTRAINT `hotel_ibfk_6` FOREIGN KEY (`user`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `hotel_roomtemplate`
--
ALTER TABLE `hotel_roomtemplate`
  ADD CONSTRAINT `hotel_roomtemplate_ibfk_1` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`id`),
  ADD CONSTRAINT `hotel_roomtemplate_ibfk_2` FOREIGN KEY (`roomtemplate`) REFERENCES `roomtemplate` (`id`),
  ADD CONSTRAINT `hotel_roomtemplate_ibfk_3` FOREIGN KEY (`photo`) REFERENCES `photo` (`id`);

--
-- Constraints for table `interest`
--
ALTER TABLE `interest`
  ADD CONSTRAINT `interest_ibfk_1` FOREIGN KEY (`photo`) REFERENCES `photo` (`id`);

--
-- Constraints for table `interest_hotel`
--
ALTER TABLE `interest_hotel`
  ADD CONSTRAINT `interest_hotel_ibfk_1` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`id`),
  ADD CONSTRAINT `interest_hotel_ibfk_2` FOREIGN KEY (`interest`) REFERENCES `interest` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`reservation`) REFERENCES `reservation` (`id`);

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`hotels`) REFERENCES `hotel` (`id`);

--
-- Constraints for table `reference_hotel`
--
ALTER TABLE `reference_hotel`
  ADD CONSTRAINT `reference_hotel_ibfk_2` FOREIGN KEY (`reference`) REFERENCES `reference` (`id`),
  ADD CONSTRAINT `reference_hotel_ibfk_3` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`payment`) REFERENCES `payment` (`id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`status`) REFERENCES `reservation_status` (`id`),
  ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_3` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`id`),
  ADD CONSTRAINT `room_ibfk_4` FOREIGN KEY (`photo`) REFERENCES `photo` (`id`),
  ADD CONSTRAINT `room_ibfk_5` FOREIGN KEY (`hotelroomtemplate`) REFERENCES `hotel_roomtemplate` (`id`),
  ADD CONSTRAINT `room_ibfk_6` FOREIGN KEY (`roomstatus`) REFERENCES `room_status` (`id`);

--
-- Constraints for table `room_reservation`
--
ALTER TABLE `room_reservation`
  ADD CONSTRAINT `room_reservation_ibfk_1` FOREIGN KEY (`room`) REFERENCES `room` (`id`),
  ADD CONSTRAINT `room_reservation_ibfk_2` FOREIGN KEY (`reservation`) REFERENCES `reservation` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
