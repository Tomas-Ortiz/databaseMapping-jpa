-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2019 a las 05:18:15
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectofactura`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `ID` bigint(20) NOT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `DENOMINACION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_tipoarticulo`
--

CREATE TABLE `articulo_tipoarticulo` (
  `id_articulo` bigint(20) NOT NULL,
  `id_tipoArticulo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

CREATE TABLE `detallefactura` (
  `ID` bigint(20) NOT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `SUBTOTAL` int(11) DEFAULT NULL,
  `detalle_fk_articulo` bigint(20) DEFAULT NULL,
  `detalle_fk_factura` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE `domicilio` (
  `ID` bigint(20) NOT NULL,
  `NOMBRE_CALLE` varchar(255) DEFAULT NULL,
  `NUMERO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `ID` bigint(20) NOT NULL,
  `FECHA` varchar(255) DEFAULT NULL,
  `NUMERO` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `factura_fk_proveedor` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `ID` bigint(20) NOT NULL,
  `CUIT` int(11) DEFAULT NULL,
  `proveedor_fk_domicilio` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoarticulo`
--

CREATE TABLE `tipoarticulo` (
  `ID` bigint(20) NOT NULL,
  `DENOMINACION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `articulo_tipoarticulo`
--
ALTER TABLE `articulo_tipoarticulo`
  ADD PRIMARY KEY (`id_articulo`,`id_tipoArticulo`),
  ADD KEY `FK_articulo_tipoArticulo_id_tipoArticulo` (`id_tipoArticulo`);

--
-- Indices de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DETALLEFACTURA_detalle_fk_factura` (`detalle_fk_factura`),
  ADD KEY `FK_DETALLEFACTURA_detalle_fk_articulo` (`detalle_fk_articulo`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_FACTURA_factura_fk_proveedor` (`factura_fk_proveedor`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PROVEEDOR_proveedor_fk_domicilio` (`proveedor_fk_domicilio`);

--
-- Indices de la tabla `tipoarticulo`
--
ALTER TABLE `tipoarticulo`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipoarticulo`
--
ALTER TABLE `tipoarticulo`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo_tipoarticulo`
--
ALTER TABLE `articulo_tipoarticulo`
  ADD CONSTRAINT `FK_articulo_tipoArticulo_id_articulo` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`ID`),
  ADD CONSTRAINT `FK_articulo_tipoArticulo_id_tipoArticulo` FOREIGN KEY (`id_tipoArticulo`) REFERENCES `tipoarticulo` (`ID`);

--
-- Filtros para la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD CONSTRAINT `FK_DETALLEFACTURA_detalle_fk_articulo` FOREIGN KEY (`detalle_fk_articulo`) REFERENCES `articulo` (`ID`),
  ADD CONSTRAINT `FK_DETALLEFACTURA_detalle_fk_factura` FOREIGN KEY (`detalle_fk_factura`) REFERENCES `factura` (`ID`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `FK_FACTURA_factura_fk_proveedor` FOREIGN KEY (`factura_fk_proveedor`) REFERENCES `proveedor` (`ID`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `FK_PROVEEDOR_proveedor_fk_domicilio` FOREIGN KEY (`proveedor_fk_domicilio`) REFERENCES `domicilio` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
