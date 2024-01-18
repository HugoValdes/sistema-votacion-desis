-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-01-2024 a las 19:58:25
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemavotaciones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatos`
--

CREATE TABLE `candidatos` (
  `id_candidato` int(11) NOT NULL,
  `candidato` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `candidatos`
--

INSERT INTO `candidatos` (`id_candidato`, `candidato`) VALUES
(1, 'Hugo Valdés'),
(2, 'Raúl Silva Enríquez'),
(3, 'Víctor Sepúlveda Aros'),
(4, 'Ricardo Cid Díaz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunas`
--

CREATE TABLE `comunas` (
  `id_comuna` int(11) NOT NULL,
  `id_region` int(11) NOT NULL,
  `comuna` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `comunas`
--

INSERT INTO `comunas` (`id_comuna`, `id_region`, `comuna`) VALUES
(1, 1, 'Arica'),
(2, 1, 'Camarones'),
(3, 1, 'General Lagos'),
(4, 1, 'Putre'),
(5, 2, 'Alto Hospicio'),
(6, 2, 'Iquique'),
(7, 2, 'Camiña'),
(8, 2, 'Colchane'),
(9, 2, 'Huara'),
(10, 2, 'Pica'),
(11, 2, 'Pozo Almonte'),
(12, 3, 'Antofagasta'),
(13, 3, 'Mejillones'),
(14, 3, 'Sierra Gorda'),
(15, 3, 'Taltal'),
(16, 3, 'Calama'),
(17, 3, 'Ollagüe'),
(18, 3, 'San Pedro de Atacama'),
(19, 3, 'María Elena'),
(20, 3, 'Tocopilla'),
(21, 4, 'Chañaral'),
(22, 4, 'Diego de Almagro'),
(23, 4, 'Caldera'),
(24, 4, 'Copiapó'),
(25, 4, 'Tierra Amarilla'),
(26, 4, 'Alto del Carmen'),
(27, 4, 'Freirina'),
(28, 4, 'Huasco'),
(29, 4, 'Vallenar'),
(30, 5, 'Canela'),
(31, 5, 'Illapel'),
(32, 5, 'Los Vilos'),
(33, 5, 'Salamanca'),
(34, 5, 'Andacollo'),
(35, 5, 'Coquimbo'),
(36, 5, 'La Higuera'),
(37, 5, 'La Serena'),
(38, 5, 'Paihuano'),
(39, 5, 'Vicuña'),
(40, 5, 'Combarbalá'),
(41, 5, 'Monte Patria'),
(42, 5, 'Ovalle'),
(43, 5, 'Punitaqui'),
(44, 5, 'Río Hurtado'),
(45, 6, 'Isla de Pascua'),
(46, 6, 'Calle Larga'),
(47, 6, 'Los Andes'),
(48, 6, 'Rinconada de Los Andes'),
(49, 6, 'San Esteban'),
(50, 6, 'Limache'),
(51, 6, 'Olmué'),
(52, 6, 'Quilpué'),
(53, 6, 'Villa Alemana'),
(54, 6, 'Cabildo'),
(55, 6, 'La Ligua'),
(56, 6, 'Papudo'),
(57, 6, 'Petorca'),
(58, 6, 'Zapallar'),
(59, 6, 'Hijuelas'),
(60, 6, 'La Calera'),
(61, 6, 'La Cruz'),
(62, 6, 'Nogales'),
(63, 6, 'Quillota'),
(64, 6, 'Algarrobo'),
(65, 6, 'Cartagena'),
(66, 6, 'El Quisco'),
(67, 6, 'El Tabo'),
(68, 6, 'San Antonio'),
(69, 6, 'Santo Domingo'),
(70, 6, 'Catemu'),
(71, 6, 'Llaillay'),
(72, 6, 'Panquehue'),
(73, 6, 'Putaendo'),
(74, 6, 'San Felipe'),
(75, 6, 'Santa María'),
(76, 6, 'Casablanca'),
(77, 6, 'Concón'),
(78, 6, 'Juan Fernández'),
(79, 6, 'Puchuncaví'),
(80, 6, 'Quintero'),
(81, 6, 'Valparaíso'),
(82, 6, 'Viña del Mar'),
(83, 7, 'Codegua'),
(84, 7, 'Coínco'),
(85, 7, 'Coltauco'),
(86, 7, 'Doñihue'),
(87, 7, 'Graneros'),
(88, 7, 'Las Cabras'),
(89, 7, 'Machalí'),
(90, 7, 'Malloa'),
(91, 7, 'Olivar'),
(92, 7, 'Peumo'),
(93, 7, 'Pichidegua'),
(94, 7, 'Quinta de Tilcoco'),
(95, 7, 'Rancagua'),
(96, 7, 'Requínoa'),
(97, 7, 'Rengo'),
(98, 7, 'San Francisco de Mostazal'),
(99, 7, 'San Vicente de Tagua Tagua'),
(100, 7, 'La Estrella'),
(101, 7, 'Litueche'),
(102, 7, 'Marchigüe'),
(103, 7, 'Navidad'),
(104, 7, 'Paredones'),
(105, 7, 'Pichilemu'),
(106, 7, 'Chépica'),
(107, 7, 'Chimbarongo'),
(108, 7, 'Lolol'),
(109, 7, 'Nancagua'),
(110, 7, 'Palmilla'),
(111, 7, 'Peralillo'),
(112, 7, 'Placilla'),
(113, 7, 'Pumanque'),
(114, 7, 'San Fernando'),
(115, 7, 'Santa Cruz'),
(116, 8, 'Cauquenes'),
(117, 8, 'Chanco'),
(118, 8, 'Pelluhue'),
(119, 8, 'Curicó'),
(120, 8, 'Hualañé'),
(121, 8, 'Licantén'),
(122, 8, 'Molina'),
(123, 8, 'Rauco'),
(124, 8, 'Romeral'),
(125, 8, 'Sagrada Familia'),
(126, 8, 'Teno'),
(127, 8, 'Vichuquén'),
(128, 8, 'Colbún'),
(129, 8, 'Linares'),
(130, 8, 'Longaví'),
(131, 8, 'Parral'),
(132, 8, 'Retiro'),
(133, 8, 'San Javier de Loncomilla'),
(134, 8, 'Villa Alegre'),
(135, 8, 'Yerbas Buenas'),
(136, 8, 'Constitución'),
(137, 8, 'Curepto'),
(138, 8, 'Empedrado'),
(139, 8, 'Maule'),
(140, 8, 'Pelarco'),
(141, 8, 'Pencahue'),
(142, 8, 'Río Claro'),
(143, 8, 'San Clemente'),
(144, 8, 'San Rafael'),
(145, 8, 'Talca'),
(146, 9, 'Bulnes'),
(147, 9, 'Chillán'),
(148, 9, 'Chillán Viejo'),
(149, 9, 'El Carmen'),
(150, 9, 'Pemuco'),
(151, 9, 'Pinto'),
(152, 9, 'Quillón'),
(153, 9, 'San Ignacio'),
(154, 9, 'Yungay'),
(155, 9, 'Cobquecura'),
(156, 9, 'Coelemu'),
(157, 9, 'Ninhue'),
(158, 9, 'Portezuelo'),
(159, 9, 'Quirihue'),
(160, 9, 'Ránquil'),
(161, 9, 'Treguaco'),
(162, 9, 'Coihueco'),
(163, 9, 'Ñiquén'),
(164, 9, 'San Carlos'),
(165, 9, 'San Fabián'),
(166, 9, 'San Nicolás'),
(167, 10, 'Arauco'),
(168, 10, 'Cañete'),
(169, 10, 'Contulmo'),
(170, 10, 'Curanilahue'),
(171, 10, 'Lebu'),
(172, 10, 'Los Álamos'),
(173, 10, 'Tirúa'),
(174, 10, 'Alto Biobío'),
(175, 10, 'Antuco'),
(176, 10, 'Cabrero'),
(177, 10, 'Laja'),
(178, 10, 'Los Ángeles'),
(179, 10, 'Mulchén'),
(180, 10, 'Nacimiento'),
(181, 10, 'Negrete'),
(182, 10, 'Quilaco'),
(183, 10, 'Quilleco'),
(184, 10, 'San Rosendo'),
(185, 10, 'Santa Bárbara'),
(186, 10, 'Tucapel'),
(187, 10, 'Yumbel'),
(188, 10, 'Chiguayante'),
(189, 10, 'Concepción'),
(190, 10, 'Coronel'),
(191, 10, 'Florida'),
(192, 10, 'Hualpén'),
(193, 10, 'Hualqui'),
(194, 10, 'Lota'),
(195, 10, 'Penco'),
(196, 10, 'San Pedro de la Paz'),
(197, 10, 'Santa Juana'),
(198, 10, 'Talcahuano'),
(199, 10, 'Tomé'),
(200, 11, 'Carahue'),
(201, 11, 'Cholchol'),
(202, 11, 'Cunco'),
(203, 11, 'Curarrehue'),
(204, 11, 'Freire'),
(205, 11, 'Galvarino'),
(206, 11, 'Gorbea'),
(207, 11, 'Lautaro'),
(208, 11, 'Loncoche'),
(209, 11, 'Melipeuco'),
(210, 11, 'Nueva Imperial'),
(211, 11, 'Padre Las Casas'),
(212, 11, 'Perquenco'),
(213, 11, 'Pitrufquén'),
(214, 11, 'Pucón'),
(215, 11, 'Saavedra'),
(216, 11, 'Temuco'),
(217, 11, 'Teodoro Schmidt'),
(218, 11, 'Toltén'),
(219, 11, 'Vilcún'),
(220, 11, 'Villarrica'),
(221, 11, 'Angol'),
(222, 11, 'Collipulli'),
(223, 11, 'Curacautín'),
(224, 11, 'Ercilla'),
(225, 11, 'Lonquimay'),
(226, 11, 'Los Sauces'),
(227, 11, 'Lumaco'),
(228, 11, 'Purén'),
(229, 11, 'Renaico'),
(230, 11, 'Traiguén'),
(231, 11, 'Victoria'),
(232, 12, 'Futrono'),
(233, 12, 'La Unión'),
(234, 12, 'Lago Ranco'),
(235, 12, 'Río Bueno'),
(236, 12, 'Corral'),
(237, 12, 'Lanco'),
(238, 12, 'Los Lagos'),
(239, 12, 'Máfil'),
(240, 12, 'Mariquina'),
(241, 12, 'Paillaco'),
(242, 12, 'Panguipulli'),
(243, 12, 'Valdivia'),
(244, 13, 'Ancud'),
(245, 13, 'Castro'),
(246, 13, 'Chonchi'),
(247, 13, 'Curaco de Vélez'),
(248, 13, 'Dalcahue'),
(249, 13, 'Puqueldón'),
(250, 13, 'Queilén'),
(251, 13, 'Quellón'),
(252, 13, 'Quemchi'),
(253, 13, 'Quinchao'),
(254, 13, 'Calbuco'),
(255, 13, 'Cochamó'),
(256, 13, 'Fresia'),
(257, 13, 'Frutillar'),
(258, 13, 'Llanquihue'),
(259, 13, 'Los Muermos'),
(260, 13, 'Maullín'),
(261, 13, 'Puerto Montt'),
(262, 13, 'Puerto Varas'),
(263, 13, 'Osorno'),
(264, 13, 'Puerto Octay'),
(265, 13, 'Purranque'),
(266, 13, 'Puyehue'),
(267, 13, 'Río Negro'),
(268, 13, 'San Pablo'),
(269, 13, 'San Juan de la Costa'),
(270, 13, 'Chaitén'),
(271, 13, 'Futaleufú'),
(272, 13, 'Hualaihué'),
(273, 13, 'Palena'),
(274, 14, 'Aysén'),
(275, 14, 'Cisnes'),
(276, 14, 'Guaitecas'),
(277, 14, 'Cochrane'),
(278, 14, 'OHiggins'),
(279, 14, 'Tortel'),
(280, 14, 'Coyhaique'),
(281, 14, 'Lago Verde'),
(282, 14, 'Chile Chico'),
(283, 14, 'Río Ibáñez'),
(284, 15, 'Antártica'),
(285, 15, 'Cabo de Hornos'),
(286, 15, 'Laguna Blanca'),
(287, 15, 'Punta Arenas'),
(288, 15, 'Río Verde'),
(289, 15, 'San Gregorio'),
(290, 15, 'Porvenir'),
(291, 15, 'Primavera'),
(292, 15, 'Timaukel'),
(293, 15, 'Natales'),
(294, 15, 'Torres del Paine'),
(295, 16, 'Colina'),
(296, 16, 'Lampa'),
(297, 16, 'Tiltil'),
(298, 16, 'Pirque'),
(299, 16, 'Puente Alto'),
(300, 16, 'San José de Maipo'),
(301, 16, 'Buin'),
(302, 16, 'Calera de Tango'),
(303, 16, 'Paine'),
(304, 16, 'San Bernardo'),
(305, 16, 'Alhué'),
(306, 16, 'Curacaví'),
(307, 16, 'María Pinto'),
(308, 16, 'Melipilla'),
(309, 16, 'San Pedro'),
(310, 16, 'Cerrillos'),
(311, 16, 'Cerro Navia'),
(312, 16, 'Conchalí'),
(313, 16, 'El Bosque'),
(314, 16, 'Estación Central'),
(315, 16, 'Huechuraba'),
(316, 16, 'Independencia'),
(317, 16, 'La Cisterna'),
(318, 16, 'La Granja'),
(319, 16, 'La Florida'),
(320, 16, 'La Pintana'),
(321, 16, 'La Reina'),
(322, 16, 'Las Condes'),
(323, 16, 'Lo Barnechea'),
(324, 16, 'Lo Espejo'),
(325, 16, 'Lo Prado'),
(326, 16, 'Macul'),
(327, 16, 'Maipú'),
(328, 16, 'Ñuñoa'),
(329, 16, 'Pedro Aguirre Cerda'),
(330, 16, 'Peñalolén'),
(331, 16, 'Providencia'),
(332, 16, 'Pudahuel'),
(333, 16, 'Quilicura'),
(334, 16, 'Quinta Normal'),
(335, 16, 'Recoleta'),
(336, 16, 'Renca'),
(337, 16, 'San Miguel'),
(338, 16, 'San Joaquín'),
(339, 16, 'San Ramón'),
(340, 16, 'Santiago'),
(341, 16, 'Vitacura'),
(342, 16, 'El Monte'),
(343, 16, 'Isla de Maipo'),
(344, 16, 'Padre Hurtado'),
(345, 16, 'Peñaflor'),
(346, 16, 'Talagante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

CREATE TABLE `regiones` (
  `id_region` int(11) NOT NULL,
  `region` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`id_region`, `region`) VALUES
(1, 'Arica y Parinacota'),
(2, 'Tarapacá'),
(3, 'Antofagasta'),
(4, 'Atacama'),
(5, 'Coquimbo'),
(6, 'Valparaíso'),
(7, 'Libertador General Bernardo OHiggins'),
(8, 'Maule'),
(9, 'Ñuble'),
(10, 'Biobío'),
(11, 'Araucanía'),
(12, 'Los Ríos'),
(13, 'Los Lagos'),
(14, 'Aysén del General Carlos Ibáñez del Campo'),
(15, 'Magallanes y de la Antártica Chilena'),
(16, 'Metropolitana de Santiago');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votaciones`
--

CREATE TABLE `votaciones` (
  `id_votacion` int(11) NOT NULL,
  `nombre_apellido` varchar(250) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `rut` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_comuna` int(11) NOT NULL,
  `id_candidato` int(11) NOT NULL,
  `entero_web` tinyint(1) NOT NULL,
  `entero_tv` tinyint(1) NOT NULL,
  `entero_redes_sociales` tinyint(1) NOT NULL,
  `entero_amigo` tinyint(1) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  ADD PRIMARY KEY (`id_candidato`);

--
-- Indices de la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD PRIMARY KEY (`id_comuna`),
  ADD KEY `id_region` (`id_region`);

--
-- Indices de la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD PRIMARY KEY (`id_region`);

--
-- Indices de la tabla `votaciones`
--
ALTER TABLE `votaciones`
  ADD PRIMARY KEY (`id_votacion`),
  ADD UNIQUE KEY `rut` (`rut`),
  ADD KEY `id_comuna` (`id_comuna`),
  ADD KEY `id_candidato` (`id_candidato`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  MODIFY `id_candidato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `comunas`
--
ALTER TABLE `comunas`
  MODIFY `id_comuna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;

--
-- AUTO_INCREMENT de la tabla `regiones`
--
ALTER TABLE `regiones`
  MODIFY `id_region` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `votaciones`
--
ALTER TABLE `votaciones`
  MODIFY `id_votacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD CONSTRAINT `comunas_regiones_fk` FOREIGN KEY (`id_region`) REFERENCES `regiones` (`id_region`);

--
-- Filtros para la tabla `votaciones`
--
ALTER TABLE `votaciones`
  ADD CONSTRAINT `votaciones_candidato_fk` FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id_candidato`),
  ADD CONSTRAINT `votaciones_comuna_fk` FOREIGN KEY (`id_comuna`) REFERENCES `comunas` (`id_comuna`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
