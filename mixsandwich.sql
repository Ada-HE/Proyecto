/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - mixsandwich
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mixsandwich` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `mixsandwich`;

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `Folio` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) DEFAULT NULL,
  `APaterno` varchar(30) DEFAULT NULL,
  `AMaterno` varchar(30) DEFAULT NULL,
  `IdTelefono` int(11) DEFAULT NULL,
  `IdDireccion` int(11) DEFAULT NULL,
  PRIMARY KEY (`Folio`),
  KEY `IdDireccion` (`IdDireccion`),
  KEY `IdTelefono` (`IdTelefono`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`IdDireccion`) REFERENCES `tbldireccion` (`IdDireccion`),
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`IdTelefono`) REFERENCES `tbltelefono` (`IdTelefono`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cliente` */

insert  into `cliente`(`Folio`,`Nombre`,`APaterno`,`AMaterno`,`IdTelefono`,`IdDireccion`) values 
(2,'dennis','Hurto','Nuñez',1,1),
(3,'Neftali','Nano','Gutierrez',1,1),
(4,'Natalio','Nino','Guti',1,1);

/*Table structure for table `ingredientes` */

DROP TABLE IF EXISTS `ingredientes`;

CREATE TABLE `ingredientes` (
  `Tipo` int(11) NOT NULL AUTO_INCREMENT,
  `Verduras` int(11) DEFAULT NULL,
  `Quesos` int(11) DEFAULT NULL,
  `Pan` int(11) DEFAULT NULL,
  `Carnes_Frias` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tipo`),
  KEY `Pan` (`Pan`),
  KEY `Verduras` (`Verduras`),
  KEY `Quesos` (`Quesos`),
  KEY `Carnes_Frias` (`Carnes_Frias`),
  CONSTRAINT `ingredientes_ibfk_1` FOREIGN KEY (`Pan`) REFERENCES `tblpanes` (`TipoPan`),
  CONSTRAINT `ingredientes_ibfk_2` FOREIGN KEY (`Verduras`) REFERENCES `tblverduras` (`TipoVerdura`),
  CONSTRAINT `ingredientes_ibfk_3` FOREIGN KEY (`Quesos`) REFERENCES `tblquesos` (`TipoQueso`),
  CONSTRAINT `ingredientes_ibfk_4` FOREIGN KEY (`Carnes_Frias`) REFERENCES `tblcarnesfrias` (`TipoCarneF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ingredientes` */

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `Nombre` varchar(50) NOT NULL,
  `Precio` varchar(50) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Ingredientes` int(11) DEFAULT NULL,
  `Folio` int(11) DEFAULT NULL,
  PRIMARY KEY (`Nombre`),
  KEY `Ingredientes` (`Ingredientes`),
  KEY `Folio` (`Folio`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`Ingredientes`) REFERENCES `ingredientes` (`Tipo`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`Folio`) REFERENCES `cliente` (`Folio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `productos` */

/*Table structure for table `tblcarnesfrias` */

DROP TABLE IF EXISTS `tblcarnesfrias`;

CREATE TABLE `tblcarnesfrias` (
  `TipoCarneF` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TipoCarneF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tblcarnesfrias` */

/*Table structure for table `tbldireccion` */

DROP TABLE IF EXISTS `tbldireccion`;

CREATE TABLE `tbldireccion` (
  `IdDireccion` int(11) NOT NULL AUTO_INCREMENT,
  `Domicilio` varchar(100) DEFAULT NULL,
  `Colonia` varchar(100) DEFAULT NULL,
  `Calle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdDireccion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbldireccion` */

insert  into `tbldireccion`(`IdDireccion`,`Domicilio`,`Colonia`,`Calle`) values 
(1,'Huejutla','Cantores','5'),
(2,'Jaltocan','La capilla','La revolucion');

/*Table structure for table `tblpanes` */

DROP TABLE IF EXISTS `tblpanes`;

CREATE TABLE `tblpanes` (
  `TipoPan` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TipoPan`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tblpanes` */

insert  into `tblpanes`(`TipoPan`,`Descripcion`) values 
(1,'Blanco'),
(2,'Integral'),
(3,'Linaza');

/*Table structure for table `tblproveedores` */

DROP TABLE IF EXISTS `tblproveedores`;

CREATE TABLE `tblproveedores` (
  `Folio` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apaterno` varchar(50) DEFAULT NULL,
  `Amaterno` varchar(50) DEFAULT NULL,
  `IdPDireccion` int(11) DEFAULT NULL,
  `IdPTelefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`Folio`),
  KEY `IdPDireccion` (`IdPDireccion`),
  CONSTRAINT `tblproveedores_ibfk_1` FOREIGN KEY (`IdPDireccion`) REFERENCES `tbldireccion` (`IdDireccion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tblproveedores` */

insert  into `tblproveedores`(`Folio`,`Nombre`,`Apaterno`,`Amaterno`,`IdPDireccion`,`IdPTelefono`) values 
(1,'David','Huya','Alvarez',1,1);

/*Table structure for table `tblquesos` */

DROP TABLE IF EXISTS `tblquesos`;

CREATE TABLE `tblquesos` (
  `TipoQueso` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TipoQueso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tblquesos` */

/*Table structure for table `tbltelefono` */

DROP TABLE IF EXISTS `tbltelefono`;

CREATE TABLE `tbltelefono` (
  `IdTelefono` int(11) NOT NULL AUTO_INCREMENT,
  `Telefono` varchar(10) DEFAULT NULL,
  `Folio` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdTelefono`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbltelefono` */

insert  into `tbltelefono`(`IdTelefono`,`Telefono`,`Folio`) values 
(1,'7712345666',1),
(2,'7711223456',2);

/*Table structure for table `tblventacompra` */

DROP TABLE IF EXISTS `tblventacompra`;

CREATE TABLE `tblventacompra` (
  `IdDetalles` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `NombreProducto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdDetalles`),
  KEY `NombreProducto` (`NombreProducto`),
  CONSTRAINT `tblventacompra_ibfk_1` FOREIGN KEY (`NombreProducto`) REFERENCES `productos` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tblventacompra` */

/*Table structure for table `tblverduras` */

DROP TABLE IF EXISTS `tblverduras`;

CREATE TABLE `tblverduras` (
  `TipoVerdura` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` int(11) DEFAULT NULL,
  PRIMARY KEY (`TipoVerdura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tblverduras` */

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(50) DEFAULT NULL,
  `pssw` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idUsuario`,`Usuario`,`pssw`) values 
(1,'Dennis','920ff050b9732b960e40c2beed5f2caf'),
(2,NULL,NULL);

/* Procedure structure for procedure `sp_Icliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_Icliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Icliente`(in n varchar (50), in ap varchar (50), in am varchar (50), in IT int, in IDi int)
BEGIN
		INSERT INTO cliente (Nombre,Apaterno,Amaterno,IdTelefono,IdDireccion)
		VALUES (n,ap,am,IT,IDi);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_Idireccion` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_Idireccion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Idireccion`(in domi varchar(100), in coli varchar(100), in cayie varchar(100))
BEGIN
		insert into tbldireccion(Domicilio,Colonia,Calle)
		values(domi,coli,cayie);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_Iprovedor` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_Iprovedor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Iprovedor`(IN n VARCHAR (50), IN ap VARCHAR (50), IN am VARCHAR (50), IN IT INT, IN IDi INT)
BEGIN
		INSERT INTO tblproveedores (Nombre,Apaterno,Amaterno,IdPDireccion,IdPTelefono)
		VALUES (n,ap,am,IDi,IT);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_telefono` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_telefono` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_telefono`(in t varchar (10), in f int)
BEGIN
		insert into tbltelefono(Telefono, Folio)
		values (t,f);
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
