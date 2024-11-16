-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2024 a las 17:40:39
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tutorial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autorizaciones_menu`
--

CREATE TABLE `autorizaciones_menu` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `opcion_menu_id` int(11) NOT NULL,
  `tipo_permiso` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `opcion` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `est` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `social_media`
--

CREATE TABLE `social_media` (
  `socmed_id` int(11) NOT NULL,
  `socmed_icono` varchar(80) DEFAULT NULL,
  `socmed_url` text DEFAULT NULL,
  `est` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_rol`
--

CREATE TABLE `tipos_rol` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usu_id` int(11) NOT NULL,
  `usu_nom` text NOT NULL,
  `usu_apep` text DEFAULT NULL,
  `usu_apem` text DEFAULT NULL,
  `usu_correo` text DEFAULT NULL,
  `usu_pass` text DEFAULT NULL,
  `usu_telf` text DEFAULT NULL,
  `est` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usu_id`, `usu_nom`, `usu_apep`, `usu_apem`, `usu_correo`, `usu_pass`, `usu_telf`, `est`) VALUES
(1, 'Juan', 'Pérez', 'Gómez', 'juan.perez@example.com', 'c7f626ad40317f4dc7b295c6f04c850d', '3001234567', 1),
(2, 'María', 'López', 'Hernández', 'maria.lopez@example.com', '2e0cdff21faa0569c8344fccc0d61fd5', '3009876543', 1),
(3, 'Prueba', 'Usuario', 'Test', 'prueba@example.com', '123456', '3000000000', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_redes`
--

CREATE TABLE `usuario_redes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `red_social_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autorizaciones_menu`
--
ALTER TABLE `autorizaciones_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `opcion_menu_id` (`opcion_menu_id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`socmed_id`);

--
-- Indices de la tabla `tipos_rol`
--
ALTER TABLE `tipos_rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usu_id`),
  ADD UNIQUE KEY `usu_correo` (`usu_correo`) USING HASH;

--
-- Indices de la tabla `usuario_redes`
--
ALTER TABLE `usuario_redes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `red_social_id` (`red_social_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autorizaciones_menu`
--
ALTER TABLE `autorizaciones_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `social_media`
--
ALTER TABLE `social_media`
  MODIFY `socmed_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_rol`
--
ALTER TABLE `tipos_rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario_redes`
--
ALTER TABLE `usuario_redes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autorizaciones_menu`
--
ALTER TABLE `autorizaciones_menu`
  ADD CONSTRAINT `autorizaciones_menu_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `autorizaciones_menu_ibfk_2` FOREIGN KEY (`opcion_menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuario_redes`
--
ALTER TABLE `usuario_redes`
  ADD CONSTRAINT `usuario_redes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usuario_redes_ibfk_2` FOREIGN KEY (`red_social_id`) REFERENCES `social_media` (`socmed_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
