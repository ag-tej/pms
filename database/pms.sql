SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `logtable`;
CREATE TABLE IF NOT EXISTS `logtable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `useruid` text NOT NULL,
  `lotname` text NOT NULL,
  `carno` text NOT NULL,
  `otp1` text NOT NULL,
  `fromtime` datetime NOT NULL,
  `otp2` text NOT NULL,
  `totime` datetime NOT NULL,
  `payment` text NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `lot`;
CREATE TABLE IF NOT EXISTS `lot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lotname` text NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO `lot` (`id`, `lotname`, `status`) VALUES
(1, 'P1', 'Free'),
(2, 'P2', 'Free'),
(3, 'P3', 'Free'),
(4, 'P4', 'Free'),
(5, 'P5', 'Free'),
(6, 'P6', 'Free'),
(7, 'P7', 'Free'),
(8, 'P8', 'Free'),
(9, 'P9', 'Free'),
(10, 'P10', 'Free');

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `password` text CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `useruid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

COMMIT;
