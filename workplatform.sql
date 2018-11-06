/*
SQLyog Ultimate v8.32 
MySQL - 5.7.9 : Database - workplatform
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`workplatform` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `workplatform`;

/*Table structure for table `t_author_element` */

DROP TABLE IF EXISTS `t_author_element`;

CREATE TABLE `t_author_element` (
  `ae_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限元素id_PK_中间表',
  `ae_author_id` bigint(20) NOT NULL COMMENT '权限id',
  `ae_element_id` bigint(20) NOT NULL COMMENT '元素id',
  PRIMARY KEY (`ae_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_author_element` */

/*Table structure for table `t_author_menu` */

DROP TABLE IF EXISTS `t_author_menu`;

CREATE TABLE `t_author_menu` (
  `am_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限菜单表id_PK_中间表',
  `am_author_id` bigint(20) NOT NULL COMMENT '权限id',
  `am_menu_id` bigint(20) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`am_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_author_menu` */

/*Table structure for table `t_authorities` */

DROP TABLE IF EXISTS `t_authorities`;

CREATE TABLE `t_authorities` (
  `a_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限表id_PK',
  `a_aname` varchar(32) NOT NULL COMMENT '权限名称',
  `a_type` int(11) NOT NULL COMMENT '权限类型',
  `a_remark` varchar(256) DEFAULT NULL COMMENT '权限备注',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_authorities` */

/*Table structure for table `t_element` */

DROP TABLE IF EXISTS `t_element`;

CREATE TABLE `t_element` (
  `e_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '页面元素表id_PK',
  `e_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '元素名',
  `e_code` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '元素编码',
  `e_remark` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_element` */

/*Table structure for table `t_group` */

DROP TABLE IF EXISTS `t_group`;

CREATE TABLE `t_group` (
  `g_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '组表id_PK',
  `g_groupname` varchar(32) NOT NULL COMMENT '组名称',
  `g_parentid` bigint(20) DEFAULT NULL COMMENT '父组id',
  `g_remark` varchar(256) DEFAULT NULL COMMENT '组备注',
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_group` */

/*Table structure for table `t_menu` */

DROP TABLE IF EXISTS `t_menu`;

CREATE TABLE `t_menu` (
  `m_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单表id_PK',
  `m_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单名',
  `m_parent` bigint(20) DEFAULT NULL COMMENT '父菜单id',
  `m_URL` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单地址',
  `m_remark` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_menu` */

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `r_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色表id_PK',
  `r_parentid` bigint(20) NOT NULL COMMENT '父角色id',
  `r_rolename` varchar(32) NOT NULL COMMENT '角色名称',
  `r_remark` varchar(256) DEFAULT NULL COMMENT '角色备注',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

/*Table structure for table `t_role_author` */

DROP TABLE IF EXISTS `t_role_author`;

CREATE TABLE `t_role_author` (
  `ra_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色权限表id_PK_中间表',
  `ra_role_id` bigint(20) NOT NULL COMMENT '角色id',
  `ra_author_id` bigint(20) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`ra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_role_author` */

/*Table structure for table `t_role_group` */

DROP TABLE IF EXISTS `t_role_group`;

CREATE TABLE `t_role_group` (
  `rg_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色组表id_PK_中间表',
  `rg_role_id` bigint(20) NOT NULL COMMENT '角色id',
  `rg_group_id` bigint(20) NOT NULL COMMENT '组id',
  PRIMARY KEY (`rg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_role_group` */

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
  `u_remark` varchar(256) DEFAULT NULL COMMENT '用户备注',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

/*Table structure for table `t_user_group` */

DROP TABLE IF EXISTS `t_user_group`;

CREATE TABLE `t_user_group` (
  `ug_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户组表id_PK_中间表',
  `ug_user_id` bigint(20) NOT NULL COMMENT '用户id',
  `ug_group_id` bigint(20) NOT NULL COMMENT '组表id',
  PRIMARY KEY (`ug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_user_group` */

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `ur_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户角色表id_PK_中间表',
  `ur_user_id` bigint(20) NOT NULL COMMENT '用户id',
  `ur_role_id` bigint(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`ur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_user_role` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
