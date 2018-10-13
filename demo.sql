/*
SQLyog Ultimate v8.32 
MySQL - 5.7.9 : Database - demo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`demo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `demo`;

/*Table structure for table `t_authorities` */

DROP TABLE IF EXISTS `t_authorities`;

CREATE TABLE `t_authorities` (
  `a_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限表id_PK',
  `a_parentid` bigint(20) NOT NULL COMMENT '父权限id',
  `a_aname` varchar(32) NOT NULL COMMENT '权限名称',
  `a_alink` varchar(512) NOT NULL COMMENT '权限链接',
  `a_remark` varchar(256) DEFAULT NULL COMMENT '权限备注',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_authorities` */

/*Table structure for table `t_group` */

DROP TABLE IF EXISTS `t_group`;

CREATE TABLE `t_group` (
  `g_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '组表id_PK',
  `g_groupname` varchar(32) NOT NULL COMMENT '组名称',
  `g_parentid` bigint(20) DEFAULT NULL COMMENT '父组id',
  `g_auth` varchar(256) NOT NULL COMMENT '组拥有权限_@分隔符',
  `g_role` varchar(256) NOT NULL COMMENT '组拥有角色_@分隔符',
  `g_remark` varchar(256) DEFAULT NULL COMMENT '组备注',
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_group` */

/*Table structure for table `t_organization` */

DROP TABLE IF EXISTS `t_organization`;

CREATE TABLE `t_organization` (
  `o_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '组织表id_PK',
  `o_parentid` bigint(20) NOT NULL COMMENT '父组织id',
  `o_name` varchar(32) NOT NULL COMMENT '组织名称',
  `o_remark` varchar(256) DEFAULT NULL COMMENT '组织备注',
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_organization` */

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `r_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色表id_PK',
  `r_parentid` bigint(20) NOT NULL COMMENT '父角色id',
  `r_rolename` varchar(32) NOT NULL COMMENT '角色名称',
  `r_auths` varchar(256) DEFAULT NULL COMMENT '拥有权限_@分隔符',
  `r_remark` varchar(256) DEFAULT NULL COMMENT '角色备注',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `u_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户表id_PK',
  `u_uid` bigint(20) DEFAULT NULL COMMENT '用户编号id',
  `u_account` varchar(32) NOT NULL COMMENT '登录账号',
  `u_password` varchar(64) NOT NULL COMMENT '登录密码',
  `u_name` varchar(32) NOT NULL COMMENT '姓名',
  `u_gender` tinyint(1) NOT NULL COMMENT '性别',
  `u_mobile` varchar(16) DEFAULT NULL COMMENT '电话',
  `u_wechat` varchar(64) DEFAULT NULL COMMENT '微信',
  `u_email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `u_createtime` datetime NOT NULL COMMENT '创建时间',
  `u_lasttime` datetime DEFAULT NULL COMMENT '上次登录时间',
  `u_count` bigint(20) DEFAULT NULL COMMENT '登录总次数',
  `u_roles` varchar(256) DEFAULT NULL COMMENT '拥有角色_@分隔符',
  `u_group` varchar(256) DEFAULT NULL COMMENT '拥有组_@分隔符',
  `u_organization` varchar(256) DEFAULT NULL COMMENT '拥有组织_@分隔符',
  `u_remark` varchar(256) DEFAULT NULL COMMENT '用户备注',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
