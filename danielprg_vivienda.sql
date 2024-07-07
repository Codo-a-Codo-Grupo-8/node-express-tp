-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-danielprg.alwaysdata.net
-- Generation Time: Jul 07, 2024 at 04:59 PM
-- Server version: 10.6.17-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `danielprg_vivienda`
--
CREATE DATABASE IF NOT EXISTS `danielprg_vivienda` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `danielprg_vivienda`;

-- --------------------------------------------------------

--
-- Table structure for table `compradores`
--

DROP TABLE IF EXISTS `compradores`;
CREATE TABLE `compradores` (
  `idcomprador` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `idvivienda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras` (
  `idcompra` int(11) NOT NULL,
  `idvivienda` int(11) DEFAULT NULL,
  `idcomprador` int(11) DEFAULT NULL,
  `metroscuadrados` int(11) NOT NULL,
  `valorcompra` decimal(10,2) NOT NULL,
  `fecha_compra` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `propietarios`
--

DROP TABLE IF EXISTS `propietarios`;
CREATE TABLE `propietarios` (
  `idpropietario` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `idvivienda` int(11) DEFAULT NULL,
  `imagen` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `propietarios`
--

INSERT INTO `propietarios` (`idpropietario`, `nombre`, `apellido`, `telefono`, `email`, `idvivienda`, `imagen`) VALUES
(1, 'Daniel', 'Spinella', '1155723046', 'danielspinella@hotmail.com', 1, NULL),
(2, 'Daniel', 'Spinella', '1155723046', 'danielspinella@hotmail.com', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resultados`
--

DROP TABLE IF EXISTS `resultados`;
CREATE TABLE `resultados` (
  `idresultado` int(11) NOT NULL,
  `idvivienda` int(11) DEFAULT NULL,
  `vendido_m2` int(11) NOT NULL,
  `restante_m2` int(11) NOT NULL,
  `valor_vendido` decimal(10,2) NOT NULL,
  `valor_restante` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `viviendas`
--

DROP TABLE IF EXISTS `viviendas`;
CREATE TABLE `viviendas` (
  `idvivienda` int(11) NOT NULL,
  `mcuadrados` int(11) DEFAULT NULL,
  `valorm2` decimal(10,2) DEFAULT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `provincia` varchar(255) DEFAULT NULL,
  `imagen` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `viviendas`
--

INSERT INTO `viviendas` (`idvivienda`, `mcuadrados`, `valorm2`, `calle`, `numero`, `ciudad`, `provincia`, `imagen`) VALUES
(1, 100, 111111.50, 'Avenida Urquiza', 2111, 'Quilmes', 'Bs As', NULL),
(2, 100, 150000.50, 'Avenida Urquiza', 2, 'Quilmes', 'Bs As', NULL),
(4, 100, 200011.50, 'Avenida Urquiza', 11, 'Berazategui', 'Bs As', NULL),
(7, 100, 150000.00, 'Avenida Calchaqui', 11, 'Quilmes', 'Bs As', NULL),
(8, 100, 150000.00, 'Avenida Calcaaqui', 10, 'quilmes', 'Buenos AIRES', NULL),
(9, 100, 150000.00, 'Avenida Calcaaqui', 10, 'quilmes', 'Buenos AIRES', NULL),
(10, 100, 150000.00, 'Avenida Calcaaqui', 10, 'quilmes', 'Buenos AIRES', NULL),
(11, 50, 75000.00, 'Urquiza', 457, 'Bernal', 'Buenos AIRES', '1719409976381.PNG'),
(12, 50, 75000.00, 'Urquiza', 457, 'Quilmes', 'Buenos AIRES', '1719352866404.jpg'),
(13, 50, 75000.00, 'Urquiza', 457, 'Bernal', 'Buenos AIRES', '1719410513135.jpg'),
(14, 120, 75000.00, 'Rivadavia', 457, 'Avellaneda', 'Buenos AIRES', '1719428057380.jpg'),
(15, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `compradores`
--
ALTER TABLE `compradores`
  ADD PRIMARY KEY (`idcomprador`),
  ADD KEY `idvivienda` (`idvivienda`);

--
-- Indexes for table `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idcompra`),
  ADD KEY `idvivienda` (`idvivienda`),
  ADD KEY `idcomprador` (`idcomprador`);

--
-- Indexes for table `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`idpropietario`),
  ADD KEY `idvivienda` (`idvivienda`);

--
-- Indexes for table `resultados`
--
ALTER TABLE `resultados`
  ADD PRIMARY KEY (`idresultado`),
  ADD KEY `idvivienda` (`idvivienda`);

--
-- Indexes for table `viviendas`
--
ALTER TABLE `viviendas`
  ADD PRIMARY KEY (`idvivienda`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `compradores`
--
ALTER TABLE `compradores`
  MODIFY `idcomprador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compras`
--
ALTER TABLE `compras`
  MODIFY `idcompra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `idpropietario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `resultados`
--
ALTER TABLE `resultados`
  MODIFY `idresultado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `viviendas`
--
ALTER TABLE `viviendas`
  MODIFY `idvivienda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `compradores`
--
ALTER TABLE `compradores`
  ADD CONSTRAINT `compradores_ibfk_1` FOREIGN KEY (`idvivienda`) REFERENCES `viviendas` (`idvivienda`);

--
-- Constraints for table `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idvivienda`) REFERENCES `viviendas` (`idvivienda`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`idcomprador`) REFERENCES `compradores` (`idcomprador`);

--
-- Constraints for table `propietarios`
--
ALTER TABLE `propietarios`
  ADD CONSTRAINT `propietarios_ibfk_1` FOREIGN KEY (`idvivienda`) REFERENCES `viviendas` (`idvivienda`);

--
-- Constraints for table `resultados`
--
ALTER TABLE `resultados`
  ADD CONSTRAINT `resultados_ibfk_1` FOREIGN KEY (`idvivienda`) REFERENCES `viviendas` (`idvivienda`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
