/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50149
Source Host           : localhost:3306
Source Database       : ssm_hrm

Target Server Type    : MYSQL
Target Server Version : 50149
File Encoding         : 65001

Date: 2019-03-12 21:24:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_checkattence
-- ----------------------------
DROP TABLE IF EXISTS `tb_checkattence`;
CREATE TABLE `tb_checkattence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `islate` int(11) DEFAULT NULL COMMENT '是否迟到，0迟到，1：没有迟到',
  `isabsent` int(11) DEFAULT NULL COMMENT '是否旷工，0：旷工，1没有旷工',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_checkattence
-- ----------------------------
INSERT INTO `tb_checkattence` VALUES ('1', '2018-10-11 09:00:00', '2018-10-11 17:34:03', '正常', '1', '1', '1');
INSERT INTO `tb_checkattence` VALUES ('2', '2018-10-12 13:49:12', '2018-10-15 22:30:00', '正常', '1', '0', '0');
INSERT INTO `tb_checkattence` VALUES ('3', '2018-10-12 14:20:00', '2018-10-12 15:30:15', '请假', '2', '0', '0');
INSERT INTO `tb_checkattence` VALUES ('4', '2018-10-13 16:47:17', '2018-10-13 16:52:50', '正常', '2', '0', '0');
INSERT INTO `tb_checkattence` VALUES ('5', '2018-10-14 19:24:20', null, '旷工', '2', '0', null);
INSERT INTO `tb_checkattence` VALUES ('6', '2018-10-19 14:52:47', '2018-10-21 20:00:43', '正常', '2', '0', '0');
INSERT INTO `tb_checkattence` VALUES ('7', '2018-10-19 19:38:48', null, '旷工', '0', '1', null);
INSERT INTO `tb_checkattence` VALUES ('8', '2018-10-22 16:01:39', '2018-10-22 16:01:48', '正常', '21', '0', '0');
INSERT INTO `tb_checkattence` VALUES ('9', '2018-10-22 16:10:39', '2018-10-22 16:11:34', '缺勤半天', '20', '0', '0');
INSERT INTO `tb_checkattence` VALUES ('10', '2018-10-22 17:05:50', '2018-10-22 17:06:12', '正常', '23', '0', '0');

-- ----------------------------
-- Table structure for tb_dept
-- ----------------------------
DROP TABLE IF EXISTS `tb_dept`;
CREATE TABLE `tb_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) DEFAULT NULL,
  `creat_time` datetime DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_dept
-- ----------------------------
INSERT INTO `tb_dept` VALUES ('1', '办公室', '2018-10-08 11:34:52', '1');
INSERT INTO `tb_dept` VALUES ('2', '财务部', '2018-10-05 11:35:26', '2');
INSERT INTO `tb_dept` VALUES ('3', '后勤处', '2018-10-22 22:51:46', '3');
INSERT INTO `tb_dept` VALUES ('4', '研发部', '2018-10-08 14:49:57', '4');
INSERT INTO `tb_dept` VALUES ('5', '宣传部', '2018-10-01 16:50:27', '9');
INSERT INTO `tb_dept` VALUES ('6', '测试123', '2018-10-22 23:03:35', '7');
INSERT INTO `tb_dept` VALUES ('7', '测试2', '2018-10-12 21:46:22', '10');
INSERT INTO `tb_dept` VALUES ('8', '人事部', '2018-10-22 23:04:17', '22');

-- ----------------------------
-- Table structure for tb_employee
-- ----------------------------
DROP TABLE IF EXISTS `tb_employee`;
CREATE TABLE `tb_employee` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '当前状态 0：在职，1：离职，2：试用',
  `dept_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL COMMENT '所在职位id',
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_employee
-- ----------------------------
INSERT INTO `tb_employee` VALUES ('2', '李四', '1', '4', '5');
INSERT INTO `tb_employee` VALUES ('3', '王五', '0', '5', '7');
INSERT INTO `tb_employee` VALUES ('4', '赵六', '0', '4', '4');
INSERT INTO `tb_employee` VALUES ('6', '嘿嘿嘿', '0', '4', '4');
INSERT INTO `tb_employee` VALUES ('7', '哈哈哈', '0', '1', '1');
INSERT INTO `tb_employee` VALUES ('8', '六六六', '0', '4', '4');
INSERT INTO `tb_employee` VALUES ('9', '啦啦啦', '0', '4', '4');
INSERT INTO `tb_employee` VALUES ('10', '哇哇哇', '0', '4', '4');
INSERT INTO `tb_employee` VALUES ('13', '哈嘿', '1', '4', '4');
INSERT INTO `tb_employee` VALUES ('14', 'aaa', '0', '4', '5');
INSERT INTO `tb_employee` VALUES ('15', 'bbb', '2', '2', '6');
INSERT INTO `tb_employee` VALUES ('16', '嘿嘿', '0', '2', '2');
INSERT INTO `tb_employee` VALUES ('17', '嘿嘿', '0', '5', '7');
INSERT INTO `tb_employee` VALUES ('18', 'qwq', '0', '4', '4');
INSERT INTO `tb_employee` VALUES ('19', 'test', '0', '2', '2');
INSERT INTO `tb_employee` VALUES ('20', 'test', '0', '2', '2');
INSERT INTO `tb_employee` VALUES ('21', 'abc', '0', '4', '4');
INSERT INTO `tb_employee` VALUES ('22', 'ddd', '0', '4', '5');
INSERT INTO `tb_employee` VALUES ('23', 'ddd', '0', '4', '4');

-- ----------------------------
-- Table structure for tb_emp_train
-- ----------------------------
DROP TABLE IF EXISTS `tb_emp_train`;
CREATE TABLE `tb_emp_train` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `train_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_emp_train
-- ----------------------------
INSERT INTO `tb_emp_train` VALUES ('1', '2', '4');

-- ----------------------------
-- Table structure for tb_interview
-- ----------------------------
DROP TABLE IF EXISTS `tb_interview`;
CREATE TABLE `tb_interview` (
  `interview_id` int(11) NOT NULL AUTO_INCREMENT,
  `reid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `delivertime` datetime DEFAULT NULL,
  `resume_id` int(11) DEFAULT NULL COMMENT '简历号',
  `isread` int(11) DEFAULT NULL COMMENT '是否已阅 0：未读，1 已读',
  `noticeinterview` int(11) DEFAULT NULL COMMENT '是否通知面试 0:未通知，1已通知',
  `interviewtime` datetime DEFAULT NULL,
  `isinterview` int(11) DEFAULT NULL COMMENT '是否面试 0未面试，1已面试',
  `emp_id` int(11) DEFAULT NULL,
  `isavail` int(11) DEFAULT NULL COMMENT '是否录用 0：未录用，1已录用',
  PRIMARY KEY (`interview_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_interview
-- ----------------------------
INSERT INTO `tb_interview` VALUES ('1', '1', '1', '2018-10-15 19:44:27', '1', '1', '1', '2018-10-22 13:50:00', '0', '0', '0');
INSERT INTO `tb_interview` VALUES ('2', '1', '4', '2018-10-16 12:22:47', '1', '1', '1', '2018-10-31 09:00:00', '1', '18', '1');
INSERT INTO `tb_interview` VALUES ('5', '2', '5', '2018-10-16 16:44:08', '3', '1', '1', '2018-10-30 13:00:00', '1', '20', '1');
INSERT INTO `tb_interview` VALUES ('6', '1', '4', '2018-10-17 20:02:19', '1', '1', '1', '2018-10-30 15:20:00', '0', '0', '0');
INSERT INTO `tb_interview` VALUES ('7', '5', '8', '2018-10-19 15:23:42', '4', '1', '1', '2018-10-31 09:06:00', '0', '0', '0');
INSERT INTO `tb_interview` VALUES ('8', '1', '10', '2018-10-22 15:47:54', '5', '1', '1', '2018-10-31 12:00:00', '1', '21', '1');
INSERT INTO `tb_interview` VALUES ('9', '4', '10', '2018-10-22 15:48:00', '5', '0', '0', null, '0', '0', '0');
INSERT INTO `tb_interview` VALUES ('10', '8', '11', '2018-10-22 16:58:27', '6', '0', '0', null, '0', '0', '0');
INSERT INTO `tb_interview` VALUES ('11', '10', '11', '2018-10-22 16:58:33', '6', '1', '1', '2018-10-31 09:30:00', '1', '22', '1');
INSERT INTO `tb_interview` VALUES ('12', '1', '11', '2018-10-22 16:58:44', '6', '1', '1', '2018-10-30 10:20:00', '1', '23', '1');

-- ----------------------------
-- Table structure for tb_notice
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice`;
CREATE TABLE `tb_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_notice
-- ----------------------------
INSERT INTO `tb_notice` VALUES ('1', '开会通知', '今天下午进行开会', '2018-10-18 16:01:42', '7');
INSERT INTO `tb_notice` VALUES ('2', 'test', 'testNotice123', '2018-10-22 23:16:27', '7');
INSERT INTO `tb_notice` VALUES ('4', 'notice', 'notice22323', '2018-10-22 13:38:01', '7');
INSERT INTO `tb_notice` VALUES ('5', 'Notice3', 'ccadfaf', '2018-10-18 17:21:31', '7');
INSERT INTO `tb_notice` VALUES ('6', 'aaaa', 'importantance notice', '2018-10-18 17:21:41', '7');
INSERT INTO `tb_notice` VALUES ('7', 'dddd', 'weadfadsf', '2018-10-18 17:21:53', '7');

-- ----------------------------
-- Table structure for tb_objectionsalary
-- ----------------------------
DROP TABLE IF EXISTS `tb_objectionsalary`;
CREATE TABLE `tb_objectionsalary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `errcontent` varchar(255) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `reissue_time` datetime DEFAULT NULL,
  `isexecute` int(11) DEFAULT NULL COMMENT '是否执行 1：执行，0未执行',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_objectionsalary
-- ----------------------------
INSERT INTO `tb_objectionsalary` VALUES ('1', '2', '2018-10-31 20:55:03', '失误', '100', '2018-10-25 20:55:52', '1');
INSERT INTO `tb_objectionsalary` VALUES ('2', '2', '2018-10-22 10:17:21', '请假了的', '100', null, '0');
INSERT INTO `tb_objectionsalary` VALUES ('3', '2', '2018-10-22 10:18:44', '竞赛获奖', '120', '2018-10-22 13:20:28', '1');
INSERT INTO `tb_objectionsalary` VALUES ('5', '2', '2018-10-22 10:36:12', '竞赛获奖', '60', '2018-10-22 13:34:22', '1');

-- ----------------------------
-- Table structure for tb_position
-- ----------------------------
DROP TABLE IF EXISTS `tb_position`;
CREATE TABLE `tb_position` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(255) DEFAULT NULL,
  `creat_time` datetime DEFAULT NULL,
  `dept_id` int(11) NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_position
-- ----------------------------
INSERT INTO `tb_position` VALUES ('1', '文员', '2018-10-15 11:37:09', '1');
INSERT INTO `tb_position` VALUES ('2', '会计', '2018-10-08 11:37:42', '2');
INSERT INTO `tb_position` VALUES ('3', '厨师', '2018-10-07 11:37:58', '3');
INSERT INTO `tb_position` VALUES ('4', 'java工程师', '2018-10-16 14:48:04', '4');
INSERT INTO `tb_position` VALUES ('5', 'python工程师', '2018-10-11 14:48:31', '4');
INSERT INTO `tb_position` VALUES ('6', '财务总监', '2018-10-08 22:17:45', '2');
INSERT INTO `tb_position` VALUES ('7', '宣传干事', '2018-10-15 09:59:37', '5');
INSERT INTO `tb_position` VALUES ('10', 'C语言', '2018-10-22 20:07:34', '4');

-- ----------------------------
-- Table structure for tb_recruit
-- ----------------------------
DROP TABLE IF EXISTS `tb_recruit`;
CREATE TABLE `tb_recruit` (
  `reid` int(11) NOT NULL AUTO_INCREMENT,
  `deptid` int(11) NOT NULL,
  `positionid` int(11) NOT NULL,
  `describes` varchar(255) DEFAULT NULL,
  `numbs` varchar(255) DEFAULT NULL,
  `valuetime` datetime DEFAULT NULL,
  PRIMARY KEY (`reid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_recruit
-- ----------------------------
INSERT INTO `tb_recruit` VALUES ('1', '4', '4', '招聘java程序员，本科学历', '5', '2018-10-31 15:22:29');
INSERT INTO `tb_recruit` VALUES ('2', '2', '2', '招聘会计，两年工作经验', '2', '2018-10-30 15:25:05');
INSERT INTO `tb_recruit` VALUES ('3', '5', '7', '招聘宣传干事，有一定的宣传能努力', '3', '2018-10-30 10:00:22');
INSERT INTO `tb_recruit` VALUES ('4', '5', '3', 'test', '4', '2018-10-24 10:00:49');
INSERT INTO `tb_recruit` VALUES ('5', '3', '4', 'test', '6', '2018-10-22 10:01:05');
INSERT INTO `tb_recruit` VALUES ('6', '1', '1', 'test6', '5', '2018-10-24 10:01:42');
INSERT INTO `tb_recruit` VALUES ('7', '2', '2', 'test7', '6', '2018-10-23 10:01:53');
INSERT INTO `tb_recruit` VALUES ('8', '3', '3', 'test8', '6', '2018-10-29 10:02:06');
INSERT INTO `tb_recruit` VALUES ('9', '4', '4', 'qwq', '6', '2018-10-09 00:00:00');
INSERT INTO `tb_recruit` VALUES ('10', '4', '5', 'qwq', '6', '2018-10-31 00:00:00');

-- ----------------------------
-- Table structure for tb_resume
-- ----------------------------
DROP TABLE IF EXISTS `tb_resume`;
CREATE TABLE `tb_resume` (
  `resume_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `lastjob` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `eduction` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `politicalstatus` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `hobby` varchar(255) DEFAULT NULL,
  `dept_id` int(11) NOT NULL,
  `positon_id` int(11) NOT NULL,
  PRIMARY KEY (`resume_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_resume
-- ----------------------------
INSERT INTO `tb_resume` VALUES ('1', '4', '我是qwq22', '24', '12345678912', 'java csd2vcc', '5000~8000', '男', '本科', '1937859795@qq.com', '共青团员', 'java c', 'c python12123', '0', '0');
INSERT INTO `tb_resume` VALUES ('2', '1', 'aaa', '23', '12345678912', 'java', '5000~8000', '男', '本科', '9999@qq.com', '共青团员', 'java', 'study', '0', '0');
INSERT INTO `tb_resume` VALUES ('3', '5', 'test', '23', '15279551295', 'java', '5000~8000', '男', '本科', '1937859795@qq.com', '中共党员', '无', '打球', '0', '0');
INSERT INTO `tb_resume` VALUES ('4', '8', '666', '22', '12345678912', 'java csd', '5000~8000', '男', '本科', '1937859795@qq.com', '中共党员', 'java c', 'study', '0', '0');
INSERT INTO `tb_resume` VALUES ('5', '10', 'abc', '22', '15279551295', 'java c', '5000~8000', '男', '本科', '1937859795@qq.com', '中共党员', 'java', 'study', '0', '0');
INSERT INTO `tb_resume` VALUES ('6', '11', 'ddd', '12', '15279881254', 'java', '3000~5000', '男', '高中', '1937859795@qq.com', '中共党员', 'java', 'study', '0', '0');

-- ----------------------------
-- Table structure for tb_retreat
-- ----------------------------
DROP TABLE IF EXISTS `tb_retreat`;
CREATE TABLE `tb_retreat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_retreat
-- ----------------------------

-- ----------------------------
-- Table structure for tb_rewardpunish
-- ----------------------------
DROP TABLE IF EXISTS `tb_rewardpunish`;
CREATE TABLE `tb_rewardpunish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` double DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_rewardpunish
-- ----------------------------
INSERT INTO `tb_rewardpunish` VALUES ('1', '-100', '2018-10-15 17:24:05', '迟到2次', '3');
INSERT INTO `tb_rewardpunish` VALUES ('2', '-300', '2018-10-10 18:33:09', '物品损坏，赔偿', '2');
INSERT INTO `tb_rewardpunish` VALUES ('3', '60', '2018-10-22 10:36:12', '竞赛获奖', '2');
INSERT INTO `tb_rewardpunish` VALUES ('4', '-20', '2018-10-22 16:11:34', '缺勤半天', '20');

-- ----------------------------
-- Table structure for tb_salary
-- ----------------------------
DROP TABLE IF EXISTS `tb_salary`;
CREATE TABLE `tb_salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `base` double DEFAULT NULL,
  `achievement` double DEFAULT NULL,
  `reward_id` int(11) DEFAULT NULL,
  `socialsec` double DEFAULT NULL,
  `disgree` int(11) DEFAULT NULL COMMENT '是否异议 0：无异议，1有异议',
  `ishandle` int(11) DEFAULT NULL COMMENT '是否处理 0已经处理，1未处理',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_salary
-- ----------------------------
INSERT INTO `tb_salary` VALUES ('1', '2', '2018-10-08 13:57:51', '5000', '900', '1', '200', '0', '1');
INSERT INTO `tb_salary` VALUES ('2', '22', '2018-10-22 17:01:08', '4500', null, null, '800', null, null);
INSERT INTO `tb_salary` VALUES ('3', '23', '2018-10-22 17:02:44', '4500', null, null, '800', null, null);

-- ----------------------------
-- Table structure for tb_train
-- ----------------------------
DROP TABLE IF EXISTS `tb_train`;
CREATE TABLE `tb_train` (
  `train_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL COMMENT '这是职位Id，并不是emp',
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`train_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_train
-- ----------------------------
INSERT INTO `tb_train` VALUES ('1', 'java上岗前培训', '4', '4', '2018-10-25 11:06:26');
INSERT INTO `tb_train` VALUES ('2', '会计上市培新test', '4', '5', '2018-10-31 00:00:00');
INSERT INTO `tb_train` VALUES ('4', 'c语言培训', '4', '10', '2018-10-29 09:00:00');
INSERT INTO `tb_train` VALUES ('5', '会计培训', '2', '2', '2018-10-24 14:00:00');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT '0' COMMENT '类型：0代表游客，1代表员工，2代表管理员',
  `employeeid` int(11) NOT NULL COMMENT '管理员工表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'aaa', 'aaa', '1', '1');
INSERT INTO `tb_user` VALUES ('2', 'bbb', 'bbb', '2', '0');
INSERT INTO `tb_user` VALUES ('3', 'ccc', 'ccc', '1', '2');
INSERT INTO `tb_user` VALUES ('4', 'qwq', '123', '0', '0');
INSERT INTO `tb_user` VALUES ('5', 'test', '123', '1', '20');
INSERT INTO `tb_user` VALUES ('6', 'test2', '123', '0', '0');
INSERT INTO `tb_user` VALUES ('7', 'admin', 'admin', '2', '1');
INSERT INTO `tb_user` VALUES ('8', '666', '666', '0', '0');
INSERT INTO `tb_user` VALUES ('9', 'kkk', '123', '0', '0');
INSERT INTO `tb_user` VALUES ('10', 'abc', 'abc', '1', '21');
INSERT INTO `tb_user` VALUES ('11', 'ddd', 'ddd', '1', '23');
