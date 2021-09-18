CREATE TABLE `member` (
  `id` varchar(20) NOT NULL,
  `passwd` varchar(80) NOT NULL,
  `name` varchar(10) NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `phonenumber` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `birth` varchar(20) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE TABLE `products` (
  `pid` varchar(20) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `sell_price` int DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `seller_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `id_idx` (`seller_id`),
  CONSTRAINT `id_fk` FOREIGN KEY (`seller_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cart` (
  `cartNum` int DEFAULT NULL,
  `productCount` int DEFAULT NULL,
  `dateAndTime` datetime DEFAULT NULL,
  `total_price` int DEFAULT NULL,
  `cmid` varchar(20) DEFAULT NULL,
  `cpid` varchar(20) DEFAULT NULL,
  KEY `cmid_idx` (`cmid`),
  KEY `cppid_idx` (`cpid`),
  CONSTRAINT `cmid` FOREIGN KEY (`cmid`) REFERENCES `member` (`id`),
  CONSTRAINT `cppid` FOREIGN KEY (`cpid`) REFERENCES `products` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;