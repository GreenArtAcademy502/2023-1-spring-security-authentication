-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.11.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- sec_todo 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `sec_todo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `sec_todo`;

-- 테이블 sec_todo.t_todo 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_todo` (
                                        `itodo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                                        `ctnt` varchar(100) NOT NULL,
                                        `created_at` datetime NOT NULL DEFAULT current_timestamp(),
                                        `del_yn` tinyint(4) DEFAULT 0 CHECK (`del_yn` in (0,1)),
                                        `pic` varchar(100) DEFAULT NULL,
                                        `finish_yn` tinyint(4) DEFAULT 0 CHECK (`finish_yn` in (0,1)),
                                        `finished_at` datetime DEFAULT NULL,
                                        `iuser` bigint(20) unsigned NOT NULL,
                                        PRIMARY KEY (`itodo`),
                                        KEY `iuser` (`iuser`),
                                        CONSTRAINT `t_todo_ibfk_1` FOREIGN KEY (`iuser`) REFERENCES `t_user` (`iuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 sec_todo.t_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_user` (
                                        `iuser` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                                        `uid` varchar(30) NOT NULL,
                                        `upw` varchar(100) NOT NULL,
                                        `name` varchar(10) NOT NULL,
                                        `role` varchar(10) NOT NULL,
                                        `created_at` datetime DEFAULT current_timestamp(),
                                        `updated_at` datetime DEFAULT current_timestamp(),
                                        PRIMARY KEY (`iuser`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
