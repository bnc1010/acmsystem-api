-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: acm_system
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `classname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_cn` varchar(50) DEFAULT NULL,
  `name_en` varchar(50) DEFAULT NULL,
  `m_1` int(11) DEFAULT NULL,
  `m_2` int(11) DEFAULT NULL,
  `m_3` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `m_1` (`m_1`),
  KEY `m_2` (`m_2`),
  KEY `m_3` (`m_3`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`m_1`) REFERENCES `members` (`id`),
  CONSTRAINT `team_ibfk_2` FOREIGN KEY (`m_2`) REFERENCES `members` (`id`),
  CONSTRAINT `team_ibfk_3` FOREIGN KEY (`m_3`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_name` varchar(45) NOT NULL COMMENT '文件名',
  `file_url` varchar(45) NOT NULL COMMENT '文件路径',
  PRIMARY KEY (`f_id`),
  UNIQUE KEY `f_id_UNIQUE` (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_permission`
--

DROP TABLE IF EXISTS `file_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_permission` (
  `f_id` int(11) NOT NULL COMMENT '文件主键id',
  `p_id` int(11) NOT NULL COMMENT '权限主键id',
  KEY `f_id_idx` (`f_id`),
  KEY `p_id_idx` (`p_id`),
  CONSTRAINT `f_id` FOREIGN KEY (`f_id`) REFERENCES `file` (`f_id`),
  CONSTRAINT `p_id_3` FOREIGN KEY (`p_id`) REFERENCES `permission` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限文件关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_permission`
--

LOCK TABLES `file_permission` WRITE;
/*!40000 ALTER TABLE `file_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `honor`
--

DROP TABLE IF EXISTS `honor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `honor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamId` int(11) DEFAULT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `ctype` int(11) DEFAULT NULL,
  `ctime` datetime DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  `pic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teamId` (`teamId`),
  KEY `pic_id` (`pic_id`),
  CONSTRAINT `honor_ibfk_1` FOREIGN KEY (`teamId`) REFERENCES `team` (`id`),
  CONSTRAINT `honor_ibfk_2` FOREIGN KEY (`pic_id`) REFERENCES `picture` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `honor`
--

LOCK TABLES `honor` WRITE;
/*!40000 ALTER TABLE `honor` DISABLE KEYS */;
/*!40000 ALTER TABLE `honor` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_name` varchar(45) NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(45) NOT NULL COMMENT '菜单URL',
  `parent_m_id` int(11) DEFAULT NULL COMMENT '父级菜单',
  PRIMARY KEY (`m_id`),
  UNIQUE KEY `m_id_UNIQUE` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_permission`
--

DROP TABLE IF EXISTS `menu_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_permission` (
  `m_id` int(11) NOT NULL COMMENT '菜单主键',
  `p_id` int(11) NOT NULL COMMENT '权限主键',
  KEY `p_id_idx` (`p_id`),
  KEY `m_id_idx` (`m_id`),
  CONSTRAINT `m_id` FOREIGN KEY (`m_id`) REFERENCES `menu` (`m_id`),
  CONSTRAINT `p_id` FOREIGN KEY (`p_id`) REFERENCES `permission` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单和权限关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_permission`
--

LOCK TABLES `menu_permission` WRITE;
/*!40000 ALTER TABLE `menu_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `o_name` varchar(45) NOT NULL COMMENT '操作名称',
  `o_code` varchar(45) NOT NULL COMMENT '操作编码',
  `url` varchar(45) NOT NULL COMMENT '拦截的url',
  `parent_id` varchar(45) DEFAULT NULL COMMENT '父级操作id',
  PRIMARY KEY (`o_id`),
  UNIQUE KEY `o_id_UNIQUE` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能操作表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `page_code` varchar(45) NOT NULL COMMENT '页面元素编码',
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `page_id_UNIQUE` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='页面元素表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_permission`
--

DROP TABLE IF EXISTS `page_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_permission` (
  `page_id` int(11) NOT NULL COMMENT '页面主键',
  `p_id` int(11) NOT NULL COMMENT '权限主键',
  KEY `page_id_idx` (`page_id`),
  KEY `p_id_idx` (`p_id`),
  CONSTRAINT `p_id_2` FOREIGN KEY (`p_id`) REFERENCES `permission` (`p_id`),
  CONSTRAINT `page_id` FOREIGN KEY (`page_id`) REFERENCES `page` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限页面元素关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_permission`
--

LOCK TABLES `page_permission` WRITE;
/*!40000 ALTER TABLE `page_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `p_type_name` varchar(45) NOT NULL COMMENT '权限类型',
  PRIMARY KEY (`p_id`),
  UNIQUE KEY `p_id_UNIQUE` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_operation`
--

DROP TABLE IF EXISTS `permission_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_operation` (
  `p_id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  PRIMARY KEY (`p_id`,`o_id`),
  KEY `fk_permission_has_operation_operation1_idx` (`o_id`),
  KEY `fk_permission_has_operation_permission1_idx` (`p_id`),
  CONSTRAINT `fk_permission_has_operation_operation1` FOREIGN KEY (`o_id`) REFERENCES `operation` (`o_id`),
  CONSTRAINT `fk_permission_has_operation_permission1` FOREIGN KEY (`p_id`) REFERENCES `permission` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限和操作中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_operation`
--

LOCK TABLES `permission_operation` WRITE;
/*!40000 ALTER TABLE `permission_operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_operation` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(45) NOT NULL COMMENT '角色名',
  PRIMARY KEY (`r_id`),
  UNIQUE KEY `r_id_UNIQUE` (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `p_id` int(11) NOT NULL COMMENT '角色主键',
  `r_id` int(11) NOT NULL COMMENT '权限主键',
  PRIMARY KEY (`p_id`,`r_id`),
  KEY `fk_permission_has_role_role1_idx` (`r_id`),
  KEY `fk_permission_has_role_permission1_idx` (`p_id`),
  CONSTRAINT `fk_permission_has_role_permission1` FOREIGN KEY (`p_id`) REFERENCES `permission` (`p_id`),
  CONSTRAINT `fk_permission_has_role_role1` FOREIGN KEY (`r_id`) REFERENCES `role` (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(45) NOT NULL COMMENT '用户名',
  `password` varchar(45) NOT NULL COMMENT '密码',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `id_UNIQUE` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Leeyom','123','1993-08-26',1,24),(2,'Tom','5566','1990-12-25',1,18);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_name` varchar(45) NOT NULL COMMENT '用户组名称',
  `parent_group_name` varchar(45) NOT NULL COMMENT '父级用户组名称',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `group_id_UNIQUE` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_role`
--

DROP TABLE IF EXISTS `user_group_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_role` (
  `group_id` int(11) NOT NULL COMMENT '用户组',
  `r_id` int(11) NOT NULL COMMENT '角色',
  PRIMARY KEY (`group_id`,`r_id`),
  KEY `fk_user_group_has_role_role1_idx` (`r_id`),
  KEY `fk_user_group_has_role_user_group1_idx` (`group_id`),
  CONSTRAINT `fk_user_group_has_role_role1` FOREIGN KEY (`r_id`) REFERENCES `role` (`r_id`),
  CONSTRAINT `fk_user_group_has_role_user_group1` FOREIGN KEY (`group_id`) REFERENCES `user_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组和角色中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_role`
--

LOCK TABLES `user_group_role` WRITE;
/*!40000 ALTER TABLE `user_group_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_user`
--

DROP TABLE IF EXISTS `user_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_user` (
  `group_id` int(11) NOT NULL COMMENT '用户组',
  `u_id` int(11) NOT NULL COMMENT '用户\n',
  PRIMARY KEY (`group_id`,`u_id`),
  KEY `fk_user_group_has_user_user1_idx` (`u_id`),
  KEY `fk_user_group_has_user_user_group1_idx` (`group_id`),
  CONSTRAINT `fk_user_group_has_user_user1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`),
  CONSTRAINT `fk_user_group_has_user_user_group1` FOREIGN KEY (`group_id`) REFERENCES `user_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组和用户中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_user`
--

LOCK TABLES `user_group_user` WRITE;
/*!40000 ALTER TABLE `user_group_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `u_id` int(11) NOT NULL COMMENT '用户id',
  `r_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`u_id`,`r_id`),
  KEY `fk_user_has_role_role1_idx` (`r_id`),
  KEY `fk_user_has_role_user_idx` (`u_id`),
  CONSTRAINT `fk_user_has_role_role1` FOREIGN KEY (`r_id`) REFERENCES `role` (`r_id`),
  CONSTRAINT `fk_user_has_role_user` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-28 21:33:33
