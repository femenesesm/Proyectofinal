-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-06-2017 a las 04:19:27
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `solostocks`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrodecompra`
--

CREATE TABLE `carrodecompra` (
  `cantidad` int(11) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  `Compra_id` int(11) NOT NULL,
  `Producto_id` int(11) NOT NULL,
  `articulos_total` int(3) NOT NULL,
  `precio_total` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombreCategoria` varchar(45) NOT NULL,
  `ropa` int(11) NOT NULL,
  `tecnologico` int(11) NOT NULL,
  `hogar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nombreCategoria`, `ropa`, `tecnologico`, `hogar`) VALUES
(1, 'Ropa', 0, 0, 0),
(2, 'Electronica', 0, 0, 0),
(3, 'Hogar', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `Usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `Categoria_idCategoria` int(11) NOT NULL,
  `nombreImagen` varchar(45) DEFAULT NULL,
  `ubicacionImagen` varchar(45) DEFAULT NULL,
  `precio` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `Categoria_idCategoria`, `nombreImagen`, `ubicacionImagen`, `precio`) VALUES
(11, 'Polera', 1, 'polera.jpg', NULL, 10000),
(12, 'Zapatillas', 1, 'zapatillas.jpg', NULL, 40000),
(13, 'Pantalones', 1, 'pantalones.jpg', NULL, 20000),
(14, 'Vestido', 1, 'vestido.jpg', NULL, 15000),
(15, 'Camara', 2, 'camara.jpg', NULL, 120000),
(16, 'Television ', 2, 'television.jpg', NULL, 600000),
(17, 'notebook', 2, 'notebook.jpg', NULL, 500000),
(18, 'lampara', 3, 'lampara.jpg', NULL, 17000),
(19, 'mesa', 3, 'mesa.jpg', '', 200000),
(20, 'sofa', 3, 'sofa.jpg', NULL, 140000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombreUsuario` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombreUsuario`, `nombre`, `password`) VALUES
(1, 'fmeneses', 'Felipe', '12345');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrodecompra`
--
ALTER TABLE `carrodecompra`
  ADD PRIMARY KEY (`Compra_id`,`Producto_id`),
  ADD KEY `fk_CarroDeCompra_Producto1_idx` (`Producto_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`,`Usuario_id`),
  ADD KEY `fk_Compra_Usuario1_idx` (`Usuario_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`,`Categoria_idCategoria`),
  ADD KEY `fk_Producto_Categoria1_idx` (`Categoria_idCategoria`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrodecompra`
--
ALTER TABLE `carrodecompra`
  ADD CONSTRAINT `fk_CarroDeCompra_Compra1` FOREIGN KEY (`Compra_id`) REFERENCES `compra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_CarroDeCompra_Producto1` FOREIGN KEY (`Producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fk_Compra_Usuario1` FOREIGN KEY (`Usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_Producto_Categoria1` FOREIGN KEY (`Categoria_idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
