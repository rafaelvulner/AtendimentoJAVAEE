# Host: localhost  (Version: 5.6.17)
# Date: 2016-04-13 14:28:53
# Generator: MySQL-Front 5.3  (Build 5.16)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "atual"
#

DROP TABLE IF EXISTS `atual`;
CREATE TABLE `atual` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `atual` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

#
# Data for table "atual"
#

INSERT INTO `atual` VALUES (50,21);

#
# Structure for table "precadastro"
#

DROP TABLE IF EXISTS `precadastro`;
CREATE TABLE `precadastro` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

#
# Data for table "precadastro"
#

INSERT INTO `precadastro` VALUES (1,'rafael elias monteiro lima'),(2,'julio batista'),(3,'maria aparecida monteiro '),(4,'aryel'),(5,'everson'),(6,'Claudia'),(7,'regina duearte'),(8,'carla moreira'),(9,'rony alemao'),(10,'cicera cunha pinto almeida'),(11,'carlos romeu'),(12,'ligia do carmo'),(13,'joÃ£o carlos abreu'),(14,'TelÃ£o'),(15,'roger rangel'),(16,'luca almeida'),(17,'katarina'),(18,'juliana'),(19,'yhy5hyhyh'),(20,'teste'),(21,'ramelao'),(22,'aryel'),(23,'romilda'),(24,'rafael'),(25,'dededed'),(26,'julio batista'),(27,'teste locao'),(28,'eai cavalo manco'),(29,'teste sinistro'),(30,'ralf cintra'),(31,'ramela da favela'),(32,'ramela cabuloso'),(33,'Ã³leo do peixoto'),(34,'julia'),(35,'rafael elias monteiro lima');

#
# Structure for table "senhanormal"
#

DROP TABLE IF EXISTS `senhanormal`;
CREATE TABLE `senhanormal` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `normal` varchar(2) NOT NULL DEFAULT '0',
  `id_precadastro` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

#
# Data for table "senhanormal"
#

INSERT INTO `senhanormal` VALUES (1,'0',0),(2,'1',1),(3,'2',2),(4,'3',4),(5,'4',5),(6,'5',6),(7,'6',9),(8,'7',11),(9,'8',13),(10,'9',14),(11,'10',15),(12,'11',16),(13,'12',20),(14,'13',21),(15,'14',22),(16,'15',24),(17,'16',25),(18,'17',27),(22,'N2',33),(23,'19',33),(24,'20',34),(25,'21',35),(26,'22',0);

#
# Structure for table "senhapref"
#

DROP TABLE IF EXISTS `senhapref`;
CREATE TABLE `senhapref` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `preferencial` varchar(255) NOT NULL DEFAULT '',
  `id_precadastro` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Data for table "senhapref"
#

INSERT INTO `senhapref` VALUES (1,'0',3),(2,'1',7),(3,'2',8),(4,'3',10),(5,'4',12),(6,'5',17),(7,'6',18),(8,'7',19),(9,'8',23),(10,'9',26),(11,'10',28),(12,'11',29),(13,'12',0);
