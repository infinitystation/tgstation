--
-- Table structure for table `online_score`
--

DROP TABLE IF EXISTS `online_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online_score` (
  `ckey` varchar(32),
  `year` int(11) DEFAULT 0,
  `month` int(11) DEFAULT 0,
  `day` int(11) DEFAULT 0,
  `sum` int(11) DEFAULT 0,
  PRIMARY KEY (`ckey`, `year`, `month`, `day`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;