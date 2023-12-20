-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.3.0-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para polo_digital
DROP DATABASE IF EXISTS `polo_digital`;
CREATE DATABASE IF NOT EXISTS `polo_digital` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `polo_digital`;

-- Volcando estructura para tabla polo_digital.clientes
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(50) DEFAULT NULL,
  `cif` varchar(50) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `numero_empleados` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla polo_digital.clientes: ~6 rows (aproximadamente)
REPLACE INTO `clientes` (`id`, `razon_social`, `cif`, `sector`, `telefono`, `numero_empleados`) VALUES
	(1, 'Relevant', '39856702S', 'Educacion', '678098765', 12),
	(2, 'Zara', '43897653G', 'Moda', '609876543', 20),
	(3, 'Samsung', '34712334K', 'Tecnologia', '629834112', 15),
	(4, 'Apple', '39845009L', 'Tecnologia', '678900665', 18),
	(5, 'Loreal', '87900665R', 'Maquillaje', '678112245', 18),
	(6, 'Xiaomi', '12398765T', 'Tecnologia', '600654783', 14);

-- Volcando estructura para tabla polo_digital.empleados
DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salario` int(11) DEFAULT NULL,
  `puesto` varchar(20) DEFAULT NULL,
  `usuarioId` int(11) DEFAULT NULL,
  `nombre` varchar(15) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `dni` varchar(30) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla polo_digital.empleados: ~10 rows (aproximadamente)
REPLACE INTO `empleados` (`id`, `salario`, `puesto`, `usuarioId`, `nombre`, `apellidos`, `dni`, `telefono`) VALUES
	(1, 2300, 'Maestro', 1, 'Rafa', 'Perez', '76543906T', '678905432'),
	(2, 1900, 'Estilista', 2, 'Mariana', 'Molina', '90087654R', '665432187'),
	(3, 1800, 'Educadora', 3, 'Marina', 'Yepes', '45678324P', '609800098'),
	(4, 2100, 'Informatico', 4, 'Jesus', 'Garcia', '45098761L', '645678032'),
	(5, 3100, 'Fisico', 5, 'Alex', 'Sanchez', '98600445Y', '644556632'),
	(6, 2200, 'Arquitecto', 6, 'Laura', 'Gomez', '22234567G', '6123456720'),
	(7, 2400, 'Profesor', 7, 'Martin', 'Ruiz', '33377765K', '609876535'),
	(8, 2100, 'Cocinero', 8, 'Lorenzo', 'Rodriguez', '09876543L', '690009987'),
	(9, 2000, 'Camarero', 9, 'Julian', 'Lopez', '55556567K', '644443339'),
	(10, 2500, 'Informatico', 10, 'Pepa', 'Sanz', '11112345K', '690987654');

-- Volcando estructura para tabla polo_digital.empleados_clientes
DROP TABLE IF EXISTS `empleados_clientes`;
CREATE TABLE IF NOT EXISTS `empleados_clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuarioId` int(11) DEFAULT NULL,
  `clienteId` int(11) DEFAULT NULL,
  `nombre` varchar(15) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `dni` varchar(15) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla polo_digital.empleados_clientes: ~8 rows (aproximadamente)
REPLACE INTO `empleados_clientes` (`id`, `usuarioId`, `clienteId`, `nombre`, `apellidos`, `dni`, `telefono`) VALUES
	(1, 1, 1, 'Rafa', 'Perez', '76543906T', '678905432'),
	(2, 2, 2, 'Mariana', 'Molina', '90087654R', '665432187'),
	(3, 3, 3, 'Marina', 'Yepes', '45678324P', '609800098'),
	(4, 4, 4, 'Jesus', 'Garcia', '45098761L', '645678032'),
	(5, 5, 5, 'Alex', 'Sanchez', '98600445Y', '644556632'),
	(6, 6, 6, 'Laura', 'Gomez', '22234567G', '6123456720'),
	(7, 7, 7, 'Martin', 'Ruiz', '33377765K', '609876535'),
	(8, 8, 8, 'Lorenzo', 'Rodriguez', '09876543L', '690009987'),
	(9, 9, 9, 'Julian', 'Lopez', '55556567K', '644443339'),
	(10, 10, 10, 'Pepa', 'Sanz', '11112345K', '690987654');

-- Volcando estructura para tabla polo_digital.eventos
DROP TABLE IF EXISTS `eventos`;
CREATE TABLE IF NOT EXISTS `eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) DEFAULT NULL,
  `tipo` varchar(70) DEFAULT NULL,
  `salaId` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `clienteId` int(11) DEFAULT NULL,
  `aforo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla polo_digital.eventos: ~4 rows (aproximadamente)
REPLACE INTO `eventos` (`id`, `nombre`, `tipo`, `salaId`, `fecha_inicio`, `fecha_final`, `clienteId`, `aforo`) VALUES
	(1, 'Navidad', 'Cultural y religioso', 1, '2023-12-20', '2024-01-08', 1, 200),
	(2, 'Semana santa', 'Cultural y religioso', 2, '2024-04-01', '2024-04-08', 2, 150),
	(3, 'Feria', 'Semana de la feria', 4, '2024-08-12', '2024-08-18', 4, 250),
	(4, 'Halloween', 'Cultural y religioso', 5, '2024-10-31', '2024-11-01', 5, 50);

-- Volcando estructura para tabla polo_digital.inventario
DROP TABLE IF EXISTS `inventario`;
CREATE TABLE IF NOT EXISTS `inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `referencia` varchar(30) DEFAULT NULL,
  `tipo` tinyint(4) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `marca` varchar(10) DEFAULT NULL,
  `asignado` varchar(10) DEFAULT NULL,
  `clienteId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla polo_digital.inventario: ~3 rows (aproximadamente)
REPLACE INTO `inventario` (`id`, `nombre`, `referencia`, `tipo`, `estado`, `marca`, `asignado`, `clienteId`) VALUES
	(1, 'Ordenador', 'p-3242', 2, 1, 'LG', 'marcha', 1),
	(2, 'Pizarra', 'p-3942', 1, 1, 'Ikea', 'marcha', 2),
	(3, 'Portatil', 'p13942', 1, 3, 'LG', 'marcha', 3);

-- Volcando estructura para tabla polo_digital.mobiliario
DROP TABLE IF EXISTS `mobiliario`;
CREATE TABLE IF NOT EXISTS `mobiliario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `referencia` varchar(30) DEFAULT NULL,
  `tipo` tinyint(4) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `marca` varchar(10) DEFAULT NULL,
  `asignado` varchar(10) DEFAULT NULL,
  `salaId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla polo_digital.mobiliario: ~3 rows (aproximadamente)
REPLACE INTO `mobiliario` (`id`, `nombre`, `referencia`, `tipo`, `estado`, `marca`, `asignado`, `salaId`) VALUES
	(1, 'Mesa', 'aula 1', 3, 1, 'ikea', 'relevant', 1),
	(2, 'Silla', 'aula 2', 2, 0, 'ikea', 'relevant', 2),
	(3, 'Pantalla', 'aula 3', 1, 2, 'LG', 'relevant', 3),
	(4, 'Pizarra', 'aula 4', 6, 1, 'ikea', 'relevant', 4);

-- Volcando estructura para tabla polo_digital.salas
DROP TABLE IF EXISTS `salas`;
CREATE TABLE IF NOT EXISTS `salas` (
  `nombre` varchar(70) DEFAULT NULL,
  `superficie` varchar(70) DEFAULT NULL,
  `planta` varchar(70) DEFAULT NULL,
  `clienteId` varchar(70) DEFAULT NULL,
  `precio` tinyint(4) DEFAULT NULL,
  `tipo` varchar(70) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla polo_digital.salas: ~7 rows (aproximadamente)
REPLACE INTO `salas` (`nombre`, `superficie`, `planta`, `clienteId`, `precio`, `tipo`, `id`) VALUES
	('Sala 1', '200m cuadrados', 'planta baja', '1', 15, 'sala para eventos', 1),
	('Sala 2', '200m cuadrados', 'planta baja', '2', 13, 'sala para eventos', 2),
	('Sala 5', '200m cuadrados', 'planta baja', '3', 16, 'sala para eventos', 3),
	('Sala 2', '200m cuadrados', 'planta baja', '4', 18, 'sala para eventos', 4),
	('Sala 1', '200m cuadrados', 'planta baja', '5', 19, 'sala para eventos', 5),
	('Sala 4', '200m cuadrados', 'planta baja', '6', 20, 'sala para eventos', 6);

-- Volcando estructura para tabla polo_digital.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(20) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla polo_digital.usuarios: ~10 rows (aproximadamente)
REPLACE INTO `usuarios` (`id`, `email`, `password`) VALUES
	(1, 'rafa@gmail.com', '9809'),
	(2, 'mariana@gmail.com', '6789'),
	(3, 'marina@gmail.com', '2344'),
	(4, 'jesus@gmail.com', '1093'),
	(5, 'alex@gmail.com', '6677'),
	(6, 'laura@gmail.com', '1122'),
	(7, 'martin@gmail.com', '6090'),
	(8, 'lorenzo@gmail.com', '6777'),
	(9, 'julian@gmail.com', '6754'),
	(10, 'pepa@gmail.com', '6543');

-- Volcando estructura para tabla polo_digital.usuarioseventos
DROP TABLE IF EXISTS `usuarioseventos`;
CREATE TABLE IF NOT EXISTS `usuarioseventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuarioId` tinyint(4) DEFAULT NULL,
  `eventosId` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla polo_digital.usuarioseventos: ~10 rows (aproximadamente)
REPLACE INTO `usuarioseventos` (`id`, `usuarioId`, `eventosId`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 4, 4),
	(5, 5, 5),
	(6, 6, 6),
	(7, 7, 7),
	(8, 8, 8),
	(9, 9, 9),
	(10, 10, 10);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
