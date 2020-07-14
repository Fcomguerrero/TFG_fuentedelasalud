-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 14-07-2020 a las 21:28:12
-- Versión del servidor: 5.7.21
-- Versión de PHP: 7.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `geriatric_fdelasalud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `access_control`
--

DROP TABLE IF EXISTS `access_control`;
CREATE TABLE IF NOT EXISTS `access_control` (
  `id_card` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `name_patient` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `last_access` datetime DEFAULT NULL,
  `type_access` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `access_control`
--

INSERT INTO `access_control` (`id_card`, `name_patient`, `last_access`, `type_access`) VALUES
('F19BEC73', 'Francisco Guerrero ', '2020-06-13 22:48:29', 'Autorizado'),
('C6A3B51F', 'Ruben Torres', '2020-06-13 22:48:45', 'Denegado'),
('CFCF45AB', 'Pedro Hermoso Santiago', '2020-06-13 22:49:28', 'Denegado'),
('AAABCDEE', 'No existe', '2020-06-13 22:51:38', 'No existe'),
('NULL', 'No existe', '2020-06-13 22:51:44', 'No existe'),
('20ABCD00', 'Sonia rodriguez lopez', '2020-06-13 22:51:50', 'Autorizado'),
('F19BEC73', 'Francisco Guerrero ', '2020-06-13 22:52:54', 'Autorizado'),
('C6A3B51F', 'Ruben Torres', '2020-06-13 22:53:05', 'Denegado'),
('F19BEC73', 'Francisco Guerrero ', '2020-06-14 12:27:56', 'Autorizado'),
('F19BEC73', 'Francisco Guerrero ', '2020-06-18 16:25:57', 'Autorizado'),
('CFCF45AB', 'Pedro Hermoso Santiago', '2020-06-18 16:26:29', 'Denegado'),
('C6A3B51F', 'Ruben Torres', '2020-06-18 16:26:44', 'Denegado'),
('ABABABAB', 'No existe', '2020-06-18 16:28:16', 'No existe'),
('NULL', 'No existe', '2020-06-18 16:31:14', 'No existe'),
('C6A3B51F', 'Ruben Torres', '2020-06-18 19:36:57', 'Denegado'),
('F19BEC73', 'Francisco Guerrero ', '2020-06-18 19:37:08', 'Autorizado'),
('C6A3B51F', 'Ruben Torres', '2020-06-18 21:21:37', 'Denegado'),
('F19BEC73', 'Francisco Guerrero ', '2020-06-18 21:24:09', 'Autorizado'),
('F19BEC73', 'Francisco Guerrero ', '2020-06-30 08:36:43', 'Autorizado'),
('F19BEC73', 'Francisco Guerrero ', '2020-07-08 08:28:07', 'Autorizado'),
('F19BEC73', 'Francisco Guerrero ', '2020-07-11 11:18:38', 'Autorizado'),
('F19BEC73', 'Francisco Guerrero ', '2020-07-11 11:23:15', 'Autorizado'),
('F19BEC73', 'Francisco Guerrero ', '2020-07-11 11:23:26', 'Autorizado'),
('F19BEC73', 'Francisco Guerrero ', '2020-07-11 11:24:00', 'Autorizado'),
('F19BEC73', 'Francisco Guerrero ', '2020-07-14 09:19:41', 'Autorizado'),
('F19BEC73', 'Francisco Guerrero ', '2020-07-14 09:29:30', 'Autorizado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alert_register`
--

DROP TABLE IF EXISTS `alert_register`;
CREATE TABLE IF NOT EXISTS `alert_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sensors_box` int(11) NOT NULL,
  `type_of_sensor` enum('tmp','hty','win','pwr','cam') COLLATE utf8_spanish_ci DEFAULT NULL,
  `data_of_alert` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_sensors_box` (`id_sensors_box`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alert_register`
--

INSERT INTO `alert_register` (`id`, `id_sensors_box`, `type_of_sensor`, `data_of_alert`) VALUES
(1, 9104, 'cam', '2020-06-09 21:00:00'),
(2, 9103, 'cam', '2020-06-08 15:31:00'),
(3, 9103, 'cam', '2020-06-14 07:20:00'),
(4, 9102, 'tmp', '2020-06-13 13:00:00'),
(5, 9102, 'cam', '2020-06-08 02:00:00'),
(7, 9102, 'win', '2020-06-10 07:09:00'),
(8, 9102, 'pwr', '2020-06-09 14:21:29'),
(9, 9101, 'cam', '2020-06-18 18:40:12'),
(10, 9101, 'cam', '2020-06-18 18:40:23'),
(11, 9101, 'cam', '2020-06-18 18:40:31'),
(12, 9101, 'cam', '2020-06-18 18:41:12'),
(13, 9101, 'cam', '2020-06-18 18:42:17'),
(14, 9101, 'cam', '2020-06-18 18:43:27'),
(15, 9101, 'cam', '2020-06-18 18:45:27'),
(16, 9101, 'cam', '2020-06-18 18:49:12'),
(17, 9101, 'cam', '2020-06-18 18:49:40'),
(18, 9101, 'cam', '2020-06-18 18:50:40'),
(19, 9101, 'cam', '2020-06-18 18:51:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE IF NOT EXISTS `patients` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `disease` enum('respiratory','osseous','cardiovascular','chronic','circulatory') COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_room` int(11) NOT NULL,
  `id_card` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `type_access` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_room` (`id_room`),
  UNIQUE KEY `id_card` (`id_card`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `patients`
--

INSERT INTO `patients` (`id`, `fullname`, `age`, `gender`, `disease`, `id_room`, `id_card`, `type_access`) VALUES
(1, 'Pedro Hermoso Santiago', 74, 'Hombre', 'circulatory', 101, 'CFCF45AB', 'Denegado'),
(2, 'Sonia rodriguez lopez', 69, 'Mujer', 'cardiovascular', 102, '20ABCD00', 'Autorizado'),
(3, 'Ruben Torres', 80, 'Hombre', 'respiratory', 103, 'C6A3B51F', 'Denegado'),
(4, 'Francisco Guerrero ', 85, 'Hombre', 'chronic', 104, 'F19BEC73', 'Autorizado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(11) NOT NULL,
  `floor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `rooms`
--

INSERT INTO `rooms` (`id`, `floor`) VALUES
(101, 1),
(102, 1),
(103, 1),
(104, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sensors_box`
--

DROP TABLE IF EXISTS `sensors_box`;
CREATE TABLE IF NOT EXISTS `sensors_box` (
  `id` int(11) NOT NULL,
  `id_room` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_room` (`id_room`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sensors_box`
--

INSERT INTO `sensors_box` (`id`, `id_room`) VALUES
(9101, 101),
(9102, 102),
(9103, 103),
(9104, 104);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sensors_values`
--

DROP TABLE IF EXISTS `sensors_values`;
CREATE TABLE IF NOT EXISTS `sensors_values` (
  `n_register` int(11) NOT NULL AUTO_INCREMENT,
  `id_sensors_box` int(11) NOT NULL,
  `tmp_value` float DEFAULT NULL,
  `hty_value` int(11) DEFAULT NULL,
  `win_value` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pwr_value` float DEFAULT NULL,
  `data_reg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_register`),
  KEY `id_sensors_box` (`id_sensors_box`)
) ENGINE=InnoDB AUTO_INCREMENT=2004 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sensors_values`
--

INSERT INTO `sensors_values` (`n_register`, `id_sensors_box`, `tmp_value`, `hty_value`, `win_value`, `pwr_value`, `data_reg`) VALUES
(1896, 9101, 24.18, 41, 'OPEN', -0.18, '2020-06-10 17:06:31'),
(1897, 9102, 24.28, 38, 'OPEN', -0.06, '2020-06-10 17:06:32'),
(1898, 9103, 27.11, 39, 'CLOSED', 0.25, '2020-06-10 17:06:32'),
(1899, 9104, 22.54, 62, 'OPEN', 0.1, '2020-06-10 17:06:32'),
(1900, 9101, 24.58, 30, 'OPEN', 0.04, '2020-06-10 17:07:02'),
(1901, 9102, 24.31, 48, 'OPEN', 0.01, '2020-06-10 17:07:03'),
(1902, 9103, 26.31, 42, 'CLOSED', 0.3, '2020-06-10 17:07:03'),
(1903, 9104, 22.12, 51, 'OPEN', 0.5, '2020-06-10 17:07:03'),
(1904, 9101, 23.76, 42, 'OPEN', 0.12, '2020-06-10 17:07:34'),
(1905, 9102, 23.99, 38, 'OPEN', 0.18, '2020-06-10 17:07:34'),
(1906, 9103, 27.4, 56, 'CLOSED', 0.24, '2020-06-10 17:07:34'),
(1907, 9104, 22.57, 50, 'OPEN', 0.64, '2020-06-10 17:07:35'),
(1908, 9101, 23.69, 36, 'OPEN', 0.22, '2020-06-10 17:08:05'),
(1909, 9102, 23.84, 43, 'OPEN', 0.28, '2020-06-10 17:08:05'),
(1910, 9103, 27.78, 38, 'CLOSED', 0.01, '2020-06-10 17:08:06'),
(1911, 9104, 21.36, 61, 'OPEN', 0.44, '2020-06-10 17:08:06'),
(1912, 9101, 24.24, 41, 'OPEN', -0.25, '2020-06-10 17:08:36'),
(1913, 9102, 24.13, 41, 'OPEN', 0.45, '2020-06-10 17:08:37'),
(1914, 9103, 27.89, 47, 'CLOSED', -0.15, '2020-06-10 17:08:37'),
(1915, 9104, 21.97, 61, 'OPEN', 0.39, '2020-06-10 17:08:37'),
(1916, 9101, 23.24, 27, 'OPEN', -0.11, '2020-06-10 17:09:08'),
(1917, 9102, 24.4, 54, 'OPEN', 0.01, '2020-06-10 17:09:08'),
(1918, 9103, 26.63, 54, 'CLOSED', 0.05, '2020-06-10 17:09:09'),
(1919, 9104, 21.89, 62, 'OPEN', 0.5, '2020-06-10 17:09:09'),
(1920, 9101, 23.82, 43, 'OPEN', -0.08, '2020-06-10 17:09:39'),
(1921, 9102, 23.82, 55, 'OPEN', 0.29, '2020-06-10 17:09:39'),
(1922, 9103, 26.89, 41, 'CLOSED', -0.05, '2020-06-10 17:09:40'),
(1923, 9104, 22.2, 61, 'OPEN', 0.64, '2020-06-10 17:09:40'),
(1924, 9101, 24.54, 43, 'OPEN', 0.04, '2020-06-10 17:10:10'),
(1925, 9102, 24.15, 41, 'OPEN', 0.27, '2020-06-10 17:10:11'),
(1926, 9103, 27.59, 42, 'CLOSED', -0.13, '2020-06-10 17:10:11'),
(1927, 9104, 21.66, 54, 'OPEN', 0.22, '2020-06-10 17:10:11'),
(1928, 9101, 23.48, 35, 'OPEN', 0.17, '2020-06-10 17:10:42'),
(1929, 9102, 24.64, 44, 'OPEN', -0.09, '2020-06-10 17:10:42'),
(1930, 9103, 26.16, 43, 'CLOSED', -0.06, '2020-06-10 17:10:42'),
(1931, 9104, 21.91, 58, 'OPEN', 0.32, '2020-06-10 17:10:43'),
(1932, 9101, 23.88, 32, 'OPEN', 0.07, '2020-06-10 17:11:13'),
(1933, 9102, 24.13, 53, 'OPEN', -0.01, '2020-06-10 17:11:13'),
(1934, 9103, 26.7, 50, 'CLOSED', 0.36, '2020-06-10 17:11:13'),
(1935, 9104, 21.23, 55, 'OPEN', 0.54, '2020-06-10 17:11:14'),
(1936, 9101, 23.4, 41, 'OPEN', 0.26, '2020-06-10 17:11:44'),
(1937, 9102, 23.32, 54, 'OPEN', 0.49, '2020-06-10 17:11:45'),
(1938, 9103, 27.05, 55, 'CLOSED', 0.36, '2020-06-10 17:11:45'),
(1939, 9104, 21.67, 53, 'OPEN', 0.3, '2020-06-10 17:11:45'),
(1940, 9101, 23.76, 34, 'OPEN', 0.25, '2020-06-10 18:42:59'),
(1941, 9102, 23.9, 56, 'OPEN', 0.37, '2020-06-10 18:42:59'),
(1942, 9103, 27.79, 54, 'CLOSED', -0.08, '2020-06-10 18:43:00'),
(1943, 9104, 21.13, 53, 'OPEN', 0.53, '2020-06-10 18:43:00'),
(1944, 9101, 24.21, 42, 'OPEN', 0.29, '2020-06-10 18:43:30'),
(1945, 9102, 24.07, 50, 'OPEN', -0.08, '2020-06-10 18:43:31'),
(1946, 9103, 26.27, 54, 'CLOSED', -0.03, '2020-06-10 18:43:31'),
(1947, 9104, 21.46, 53, 'OPEN', 0.35, '2020-06-10 18:43:31'),
(1948, 9101, 24.82, 31, 'OPEN', -0.2, '2020-06-10 18:53:51'),
(1949, 9102, 23.42, 46, 'OPEN', 0.45, '2020-06-10 18:53:51'),
(1950, 9103, 26.73, 52, 'CLOSED', -0.12, '2020-06-10 18:53:51'),
(1951, 9104, 21.26, 64, 'OPEN', 0.62, '2020-06-10 18:53:51'),
(1952, 9101, 24.5, 31, 'OPEN', -0.1, '2020-06-10 19:02:00'),
(1953, 9102, 23.99, 50, 'OPEN', 0.45, '2020-06-10 19:02:31'),
(1954, 9103, 26.96, 57, 'CLOSED', 0.16, '2020-06-10 19:02:31'),
(1955, 9104, 21.66, 53, 'OPEN', 0.17, '2020-06-10 19:02:32'),
(1956, 9101, 24.12, 28, 'OPEN', 0.05, '2020-06-10 19:03:44'),
(1957, 9102, 24.48, 49, 'OPEN', 0.15, '2020-06-10 19:03:45'),
(1958, 9103, 26.19, 58, 'CLOSED', 0.14, '2020-06-10 19:03:45'),
(1959, 9104, 21.13, 55, 'OPEN', 0.28, '2020-06-10 19:03:45'),
(1960, 9101, 24.07, 33, 'OPEN', -0.19, '2020-06-10 19:04:17'),
(1961, 9102, 24.67, 39, 'OPEN', 0.31, '2020-06-10 19:04:18'),
(1962, 9103, 26.58, 52, 'CLOSED', 0.4, '2020-06-10 19:04:18'),
(1963, 9104, 22.6, 56, 'OPEN', 0.18, '2020-06-10 19:04:19'),
(1964, 9101, 23.52, 32, 'OPEN', 0.23, '2020-06-10 19:04:50'),
(1965, 9102, 23.59, 51, 'OPEN', 0.31, '2020-06-10 19:04:50'),
(1966, 9103, 26.31, 57, 'CLOSED', -0.13, '2020-06-10 19:04:51'),
(1967, 9104, 21.79, 55, 'OPEN', 0.49, '2020-06-10 19:04:51'),
(1968, 9101, 23.13, 43, 'OPEN', 0.28, '2020-06-10 19:05:22'),
(1969, 9102, 24.09, 45, 'OPEN', -0.02, '2020-06-10 19:05:22'),
(1970, 9103, 27.42, 40, 'CLOSED', 0.21, '2020-06-10 19:05:23'),
(1971, 9104, 22.19, 62, 'OPEN', 0.48, '2020-06-10 19:05:23'),
(1972, 9101, 24.6, 44, 'OPEN', -0.1, '2020-06-10 19:05:53'),
(1973, 9102, 24.4, 50, 'OPEN', -0.07, '2020-06-10 19:05:54'),
(1974, 9103, 27.56, 43, 'CLOSED', 0.07, '2020-06-10 19:05:54'),
(1975, 9104, 21.87, 53, 'OPEN', 0.22, '2020-06-10 19:05:54'),
(1976, 9101, 23.33, 48, 'CLOSED', 0.29, '2020-06-11 15:21:10'),
(1977, 9102, 23.42, 49, 'OPEN', 0.39, '2020-06-11 15:21:10'),
(1978, 9103, 22.7, 48, 'CLOSED', 0.32, '2020-06-11 15:21:11'),
(1979, 9104, 24.51, 60, 'OPEN', 0.55, '2020-06-11 15:21:11'),
(1980, 9101, 23.87, 44, 'CLOSED', -0.24, '2020-06-11 15:21:42'),
(1981, 9102, 23.32, 45, 'OPEN', 0.04, '2020-06-11 15:21:42'),
(1982, 9103, 24.21, 56, 'CLOSED', -0.09, '2020-06-11 15:21:42'),
(1983, 9104, 22.9, 52, 'OPEN', 0.25, '2020-06-11 15:21:43'),
(1984, 9101, 22.88, 60, 'CLOSED', 0.28, '2020-06-11 18:05:34'),
(1985, 9102, 22.95, 51, 'OPEN', 0.47, '2020-06-11 18:05:34'),
(1986, 9103, 24.39, 57, 'CLOSED', -0.07, '2020-06-11 18:05:34'),
(1987, 9104, 22.9, 55, 'OPEN', 0.44, '2020-06-11 18:05:35'),
(1988, 9101, 23.52, 47, 'CLOSED', 0.2, '2020-06-11 18:06:15'),
(1989, 9102, 24.56, 48, 'OPEN', 0.18, '2020-06-11 18:06:15'),
(1990, 9103, 23.36, 57, 'CLOSED', -0.08, '2020-06-11 18:06:16'),
(1991, 9104, 23.98, 64, 'OPEN', 0.41, '2020-06-11 18:06:16'),
(1992, 9101, 22.66, 45, 'CLOSED', -0.21, '2020-06-11 18:06:56'),
(1993, 9102, 23.96, 53, 'OPEN', 0.36, '2020-06-11 18:06:57'),
(1994, 9103, 23.79, 52, 'CLOSED', 0.29, '2020-06-11 18:06:57'),
(1995, 9104, 24.12, 54, 'OPEN', 0.35, '2020-06-11 18:06:57'),
(1996, 9101, 23.44, 61, 'CLOSED', 0.13, '2020-06-11 18:07:38'),
(1997, 9102, 22.96, 49, 'OPEN', 0.36, '2020-06-11 18:07:38'),
(1998, 9103, 23.62, 54, 'CLOSED', -0.1, '2020-06-11 18:07:38'),
(1999, 9104, 23.25, 49, 'OPEN', 0.11, '2020-06-11 18:07:39'),
(2000, 9101, 23.52, 60, 'CLOSED', -0.11, '2020-06-11 18:08:19'),
(2001, 9102, 23.07, 42, 'OPEN', 0.27, '2020-06-11 18:08:19'),
(2002, 9103, 23.02, 41, 'CLOSED', 0.39, '2020-06-11 18:08:20'),
(2003, 9104, 22.82, 57, 'OPEN', 0.6, '2020-06-11 18:08:20');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alert_register`
--
ALTER TABLE `alert_register`
  ADD CONSTRAINT `alert_register_ibfk_1` FOREIGN KEY (`id_sensors_box`) REFERENCES `sensors_values` (`id_sensors_box`);

--
-- Filtros para la tabla `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`id`) REFERENCES `patients` (`id_room`);

--
-- Filtros para la tabla `sensors_box`
--
ALTER TABLE `sensors_box`
  ADD CONSTRAINT `sensors_box_ibfk_1` FOREIGN KEY (`id_room`) REFERENCES `rooms` (`id`);

--
-- Filtros para la tabla `sensors_values`
--
ALTER TABLE `sensors_values`
  ADD CONSTRAINT `sensors_values_ibfk_1` FOREIGN KEY (`id_sensors_box`) REFERENCES `sensors_box` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
