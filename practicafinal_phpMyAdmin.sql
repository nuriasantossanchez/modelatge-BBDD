-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2020 a las 12:38:38
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `practicafinal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adreçaproveidor`
--

CREATE TABLE `adreçaproveidor` (
  `proveidor_id` int(11) NOT NULL,
  `carrer` varchar(45) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `pis` int(11) DEFAULT NULL,
  `porta` varchar(45) DEFAULT '',
  `ciutat` varchar(45) DEFAULT NULL,
  `codi_postal` int(11) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `adreçaproveidor`
--

INSERT INTO `adreçaproveidor` (`proveidor_id`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `pais`) VALUES
(1, 'carrer1', 3, 2, '', 'Barcelona', 9050, 'España'),
(2, 'carrer2', 10, 10, 'a', 'Madrid', 9003, 'España'),
(3, 'carrer3', 12, 2, '2b', 'Barcelona', 8074, 'España'),
(4, 'carrer4', 3, 2, '', 'Barcelona', 9058, 'España');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `adreça` varchar(45) NOT NULL,
  `telefon` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `data_registre` date NOT NULL,
  `client_recomanat` varchar(45) DEFAULT NULL,
  `empleat_venta` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id_client`, `nom`, `adreça`, `telefon`, `email`, `data_registre`, `client_recomanat`, `empleat_venta`) VALUES
(1, 'clien1', 'Passatge Sant Joan,20', 620303235, 'client1@gmail.com', '2020-06-20', NULL, 'emple1'),
(2, 'clien2', 'Bailen,10', 620382563, 'client2@gmail.com', '2020-06-22', NULL, 'emple1'),
(3, 'clien3', 'Bailen,15', 650263698, 'client3@gmail.com', '2020-06-25', 'client2', 'emple2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muntura`
--

CREATE TABLE `muntura` (
  `id_muntura` int(11) NOT NULL,
  `tipu` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `muntura`
--

INSERT INTO `muntura` (`id_muntura`, `tipu`) VALUES
(1, 'flotant'),
(2, 'pasta'),
(3, 'metalica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidor`
--

CREATE TABLE `proveidor` (
  `id_proveidor` int(11) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `telefon` int(11) NOT NULL,
  `fax` int(11) NOT NULL,
  `nif` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveidor`
--

INSERT INTO `proveidor` (`id_proveidor`, `marca`, `nom`, `telefon`, `fax`, `nif`) VALUES
(1, 'vogue', 'Prove1', 666123456, 92345678, '12345678A'),
(2, 'armani', 'Prove1', 666123456, 92345678, '12345678A'),
(3, 'dolce gabbana', 'Prove2', 620896321, 98945611, '12345678B'),
(4, 'carolina herrera', 'Prove3', 650569874, 92345644, '14234567C'),
(5, 'etnia', 'Prove4', 690569632, 93145678, '12345678D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ulleres` int(11) NOT NULL,
  `proveidor_ulleres_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `muntura_id` int(11) NOT NULL,
  `graduacio_vidre_dercho` float DEFAULT NULL,
  `graduacio_vidre_izqdo` float DEFAULT NULL,
  `muntura_color` varchar(45) NOT NULL,
  `vidre_color` varchar(45) NOT NULL,
  `preu` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`id_ulleres`, `proveidor_ulleres_id`, `client_id`, `muntura_id`, `graduacio_vidre_dercho`, `graduacio_vidre_izqdo`, `muntura_color`, `vidre_color`, `preu`) VALUES
(1, 4, 1, 1, 0.25, 0.5, 'azul', 'negro', '350'),
(2, 2, 1, 3, 0.25, 0.5, 'negro', 'cristal', '300'),
(3, 3, 2, 2, 1.5, 0.5, 'marron', 'negro', '450'),
(4, 3, 3, 2, 0.5, 1.25, 'rojo', 'cristal', '400');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adreçaproveidor`
--
ALTER TABLE `adreçaproveidor`
  ADD PRIMARY KEY (`proveidor_id`),
  ADD KEY `proveidor_id_idx` (`proveidor_id`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `muntura`
--
ALTER TABLE `muntura`
  ADD PRIMARY KEY (`id_muntura`);

--
-- Indices de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`id_proveidor`),
  ADD UNIQUE KEY `marca_UNIQUE` (`marca`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ulleres`),
  ADD KEY `client_id_idx` (`client_id`),
  ADD KEY `muntura_id_idx` (`muntura_id`),
  ADD KEY `proveidor_ulleres_id_idx` (`proveidor_ulleres_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `muntura`
--
ALTER TABLE `muntura`
  MODIFY `id_muntura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  MODIFY `id_proveidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id_ulleres` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adreçaproveidor`
--
ALTER TABLE `adreçaproveidor`
  ADD CONSTRAINT `proveidor_id` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidor` (`id_proveidor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `muntura_id` FOREIGN KEY (`muntura_id`) REFERENCES `muntura` (`id_muntura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveidor_ulleres_id` FOREIGN KEY (`proveidor_ulleres_id`) REFERENCES `proveidor` (`id_proveidor`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
