CREATE TABLE `torrents` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `GroupID` int(10) NOT NULL,
  `UserID` int(10) DEFAULT NULL,
  `Media` varchar(20) DEFAULT NULL,
  `Format` varchar(10) DEFAULT NULL,
  `Encoding` varchar(15) DEFAULT NULL,
  `Remastered` enum('0','1') NOT NULL DEFAULT '0',
  `RemasterYear` int(4) DEFAULT NULL,
  `RemasterTitle` varchar(80) NOT NULL DEFAULT '',
  `RemasterCatalogueNumber` varchar(80) NOT NULL DEFAULT '',
  `RemasterRecordLabel` varchar(80) NOT NULL DEFAULT '',
  `Scene` enum('0','1') NOT NULL DEFAULT '0',
  `HasLog` enum('0','1') NOT NULL DEFAULT '0',
  `HasCue` enum('0','1') NOT NULL DEFAULT '0',
  `LogScore` int(6) NOT NULL DEFAULT '0',
  `info_hash` blob NOT NULL,
  `FileCount` int(6) NOT NULL,
  `FileList` mediumtext NOT NULL,
  `FilePath` varchar(255) NOT NULL DEFAULT '',
  `Size` bigint(12) NOT NULL,
  `Leechers` int(6) NOT NULL DEFAULT '0',
  `Seeders` int(6) NOT NULL DEFAULT '0',
  `last_action` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `FreeTorrent` enum('0','1','2') NOT NULL DEFAULT '0',
  `FreeLeechType` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Description` text,
  `Snatched` int(10) unsigned NOT NULL DEFAULT '0',
  `balance` bigint(20) NOT NULL DEFAULT '0',
  `LastReseedRequest` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TranscodedFrom` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `InfoHash` (`info_hash`(40)),
  KEY `GroupID` (`GroupID`),
  KEY `UserID` (`UserID`),
  KEY `Media` (`Media`),
  KEY `Format` (`Format`),
  KEY `Encoding` (`Encoding`),
  KEY `Year` (`RemasterYear`),
  KEY `FileCount` (`FileCount`),
  KEY `Size` (`Size`),
  KEY `Seeders` (`Seeders`),
  KEY `Leechers` (`Leechers`),
  KEY `Snatched` (`Snatched`),
  KEY `last_action` (`last_action`),
  KEY `Time` (`Time`),
  KEY `FreeTorrent` (`FreeTorrent`)
) ENGINE=InnoDB CHARSET utf8;