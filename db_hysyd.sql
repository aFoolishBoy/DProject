/*
Navicat MySQL Data Transfer

Source Server         : 111
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : db_hysyd

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2019-02-28 16:54:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL auto_increment,
  `userName` varchar(50) default NULL,
  `userPw` varchar(50) default NULL,
  PRIMARY KEY  (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'a', 'a');

-- ----------------------------
-- Table structure for `t_gonggao`
-- ----------------------------
DROP TABLE IF EXISTS `t_gonggao`;
CREATE TABLE `t_gonggao` (
  `id` varchar(50) NOT NULL,
  `title` varchar(50) default NULL,
  `content` varchar(5000) default NULL,
  `shijian` varchar(500) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gonggao
-- ----------------------------
INSERT INTO `t_gonggao` VALUES ('1319091593625', '春节节放假7天，正月初8上班', '春节节放假7天，正月初8上班', '2015-02-16 14:19:53');
INSERT INTO `t_gonggao` VALUES ('1504579409843', '会议室网上预定系统', '<strong><font size=\"6\">会议室网上预定系统</font></strong>', '2017-9-5 10:43:29');

-- ----------------------------
-- Table structure for `t_huiyishi`
-- ----------------------------
DROP TABLE IF EXISTS `t_huiyishi`;
CREATE TABLE `t_huiyishi` (
  `id` int(11) NOT NULL auto_increment,
  `mingcheng` varchar(500) default NULL,
  `del` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_huiyishi
-- ----------------------------
INSERT INTO `t_huiyishi` VALUES ('5', '第一会议室', 'no');
INSERT INTO `t_huiyishi` VALUES ('6', '第二会议室', 'no');
INSERT INTO `t_huiyishi` VALUES ('8', '第三会议室', 'no');
