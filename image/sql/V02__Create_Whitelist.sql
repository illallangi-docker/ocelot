CREATE TABLE `xbt_client_whitelist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `peer_id` varchar(20) DEFAULT NULL,
  `vstring` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `peer_id` (`peer_id`)
) ENGINE=InnoDB CHARSET utf8;