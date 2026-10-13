-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Oct 13, 2026 at 05:44 AM
-- Server version: 8.0.46
-- PHP Version: 8.3.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ontology_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_actions`
--

CREATE TABLE `activity_actions` (
  `id` int NOT NULL,
  `activity_diagram_id` int NOT NULL,
  `action_no` varchar(50) NOT NULL,
  `lane_no` varchar(50) DEFAULT '',
  `caption` varchar(255) DEFAULT '',
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `activity_actions`
--

INSERT INTO `activity_actions` (`id`, `activity_diagram_id`, `action_no`, `lane_no`, `caption`, `description`) VALUES
(53, 13, 'A-01', 'L-01', 'ผู้ใช้งานลงชื่อเข้าใช้', 'ผู้ใช้งานลงชื่อเข้าใช้'),
(54, 13, 'A-02', 'L-01', 'เลือกหน้าที่ต้องการดู', 'เลือกหน้าที่ต้องการดู'),
(55, 13, 'A-03', 'L-02', 'ระบบแสดงผลหน้าที่เลือก', 'ระบบแสดงผลหน้าที่เลือก'),
(56, 14, 'A-01', 'L-01', 'ผู้ใช้งานลงชื่อเข้าใช้', 'ผู้ใช้งานลงชื่อเข้าใช้'),
(57, 14, 'A-02', 'L-01', 'กรอกแบบฟอร์มข้อเสนอแนะ', 'กรอกแบบฟอร์มข้อเสนอแนะ'),
(58, 14, 'A-03', 'L-01', 'กดส่งข้อเสนอแนะ', 'กดส่งข้อเสนอแนะ'),
(59, 14, 'A-04', 'L-02', 'ระบบบันทึกข้อเสนอแนะ', 'ระบบบันทึกข้อเสนอแนะ'),
(60, 15, 'A-01', 'L-01', 'ผู้ดูแลระบบเรียกดูข้อเสนอแนะ', 'ผู้ดูแลระบบเรียกดูข้อเสนอแนะ'),
(61, 15, 'A-02', 'L-02', 'ระบบแสดงข้อเสนอแนะ', 'ระบบแสดงข้อเสนอแนะ'),
(62, 12, 'A-01', 'L-01', 'ผู้ใช้งานกรอก username และ password', 'ผู้ใช้งานกรอก username และ password'),
(63, 12, 'A-02', 'L-02', 'ระบบแจ้งเตือน username หรือ password ไม่ถูก', 'ระบบแจ้งเตือน username หรือ password ไม่ถูก'),
(64, 12, 'A-03', 'L-02', 'ระบบแจ้งเตือน username และ password ถูกต้อง', 'ระบบแจ้งเตือน username และ password ถูกต้อง'),
(65, 12, 'A-04', 'L-02', 'ระบบพากลับไปหน้า login ใหม่', 'ระบบพากลับไปหน้า login ใหม่'),
(66, 12, 'A-05', 'L-02', 'เข้าสู่ระบบ', 'เข้าสู่ระบบ');

-- --------------------------------------------------------

--
-- Table structure for table `activity_decision_criteria`
--

CREATE TABLE `activity_decision_criteria` (
  `id` int NOT NULL,
  `decision_node_id` int NOT NULL,
  `criteria_no` varchar(50) NOT NULL,
  `detail` text,
  `reference_id` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `activity_decision_criteria`
--

INSERT INTO `activity_decision_criteria` (`id`, `decision_node_id`, `criteria_no`, `detail`, `reference_id`) VALUES
(17, 12, 'C-01', 'username และ password ถูกต้อง', 'A-02'),
(18, 12, 'C-02', 'username หรือ password ไม่ถูก', 'A-03');

-- --------------------------------------------------------

--
-- Table structure for table `activity_decision_nodes`
--

CREATE TABLE `activity_decision_nodes` (
  `id` int NOT NULL,
  `activity_diagram_id` int NOT NULL,
  `decision_no` varchar(50) NOT NULL,
  `lane_no` varchar(50) DEFAULT '',
  `from_action_no` varchar(50) DEFAULT '',
  `caption` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `activity_decision_nodes`
--

INSERT INTO `activity_decision_nodes` (`id`, `activity_diagram_id`, `decision_no`, `lane_no`, `from_action_no`, `caption`) VALUES
(12, 12, 'D-01', 'L-02', 'A-01', 'เช็ค username และ password ว่าถูกต้องไหม');

-- --------------------------------------------------------

--
-- Table structure for table `activity_diagrams`
--

CREATE TABLE `activity_diagrams` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `activity_id` varchar(50) NOT NULL,
  `activity_name` varchar(255) NOT NULL,
  `use_case_ref` varchar(255) DEFAULT '',
  `class_ref` varchar(255) DEFAULT '',
  `preliminary_activity_id` varchar(50) DEFAULT '',
  `description` text,
  `image_path` longtext,
  `file_name` varchar(255) DEFAULT NULL,
  `has_swimlane` varchar(10) DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `activity_diagrams`
--

INSERT INTO `activity_diagrams` (`id`, `project_id`, `activity_id`, `activity_name`, `use_case_ref`, `class_ref`, `preliminary_activity_id`, `description`, `image_path`, `file_name`, `has_swimlane`, `created_at`) VALUES
(12, 8, 'ACT-01', 'Login', 'UC-01 (User), UC-02 (login)', '', '', 'Activity ที่แสดงขั้นตอนในการลงชื่อเข้าใช้งาน', '/diagram_pic/activity/diagram_activity_pro_54572.jpg', 'Untitled Diagram (3).jpg', 'Yes', '2026-10-13 03:48:47'),
(13, 8, 'ACT-02', 'ViewPages', 'UC-02 (login), UC-01 (User), UC-03 (view page)', 'CL-01 (User), CL-02 (Pages)', 'ACT-01', 'ขั้นตอนที่ผู้ใช้งานเรียกดูหน้าเว็บ', '/diagram_pic/activity/diagram_activity_pro_24411.jpg', 'Untitled Diagram (4).jpg', 'Yes', '2026-10-13 04:00:04'),
(14, 8, 'ACT-03', 'Feedback', 'UC-02 (login), UC-01 (User), UC-04 (send feedback)', 'CL-03 (Feedback)', 'ACT-01', 'แสดงขั้นตอนการส่ง Feedback ให้ผู้ดูแลระบบ', '/diagram_pic/activity/diagram_activity_pro_1597.jpg', 'Untitled Diagram (5).jpg', 'Yes', '2026-10-13 04:41:59'),
(15, 8, 'ACT-04', 'ViewFeedback', 'UC-04 (send feedback)', 'CL-03 (Feedback)', '', 'ขั้นตอนการดู feedback ของผู้ดูแลระบบ', '/diagram_pic/activity/diagram_activity_pro_27810.jpg', 'Untitled Diagram (6).jpg', 'Yes', '2026-10-13 04:44:20');

-- --------------------------------------------------------

--
-- Table structure for table `activity_end_points`
--

CREATE TABLE `activity_end_points` (
  `id` int NOT NULL,
  `activity_diagram_id` int NOT NULL,
  `lane_no` varchar(50) DEFAULT '',
  `from_type` varchar(50) DEFAULT '',
  `from_no` varchar(50) DEFAULT '',
  `end_state` varchar(20) DEFAULT 'Success'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `activity_end_points`
--

INSERT INTO `activity_end_points` (`id`, `activity_diagram_id`, `lane_no`, `from_type`, `from_no`, `end_state`) VALUES
(20, 13, 'L-02', 'Action', 'A-03', 'Success'),
(21, 14, 'L-02', 'Action', 'A-04', 'Success'),
(22, 15, 'L-02', 'Action', 'A-02', 'Success'),
(23, 12, '', 'Action', '', 'Success');

-- --------------------------------------------------------

--
-- Table structure for table `activity_start_points`
--

CREATE TABLE `activity_start_points` (
  `id` int NOT NULL,
  `activity_diagram_id` int NOT NULL,
  `from_lane_no` varchar(50) DEFAULT '',
  `to_action` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `activity_start_points`
--

INSERT INTO `activity_start_points` (`id`, `activity_diagram_id`, `from_lane_no`, `to_action`) VALUES
(16, 13, 'L-01', 'A-01'),
(17, 14, 'L-01', 'A-01'),
(18, 15, 'L-01', 'A-01'),
(19, 12, 'L-01', 'A-01');

-- --------------------------------------------------------

--
-- Table structure for table `activity_swimlanes`
--

CREATE TABLE `activity_swimlanes` (
  `id` int NOT NULL,
  `activity_diagram_id` int NOT NULL,
  `lane_no` varchar(50) NOT NULL,
  `type` varchar(100) DEFAULT '',
  `caption` varchar(255) DEFAULT '',
  `reference_id` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `activity_swimlanes`
--

INSERT INTO `activity_swimlanes` (`id`, `activity_diagram_id`, `lane_no`, `type`, `caption`, `reference_id`) VALUES
(29, 13, 'L-01', 'User', 'User Lane', 'SL-01'),
(30, 13, 'L-02', 'System', 'System Lane', 'SL-02'),
(31, 14, 'L-01', 'User', 'User Lane', 'SL-01'),
(32, 14, 'L-02', 'System', 'System Lane', 'SL-02'),
(33, 15, 'L-01', 'User', 'User Lane', 'SL-01'),
(34, 15, 'L-02', 'System', 'System Lane', 'SL-02'),
(35, 12, 'L-01', 'User', 'User Lane', 'L-01'),
(36, 12, 'L-02', 'System', 'System Lane', 'L-02');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Class','Abstract class','Interface') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Class',
  `reference` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `extend_to_class_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` int NOT NULL DEFAULT '1',
  `extend_to_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'None'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `name`, `type`, `reference`, `description`, `extend_to_class_id`, `project_id`, `extend_to_class`) VALUES
('CL-01', 'test01', 'Class', 'UC-01', 'ทดสอบ 1', NULL, 1, 'None'),
('CL-01', 'User', 'Class', 'UC-01, UC-02', 'Class แสดงข้อมูลเกี่ยวกับ User และ Method สำหรับการ login', NULL, 8, 'None'),
('CL-02', 'Pages', 'Class', 'UC-03', 'Class สำหรับการแสดงผลหน้าเว็บที่เรียกดู', NULL, 8, 'None'),
('CL-03', 'Feedback', 'Class', 'UC-04', 'หน้าสำหรับส่งข้อเสนอแนะ', NULL, 8, 'None');

-- --------------------------------------------------------

--
-- Table structure for table `class_attributes`
--

CREATE TABLE `class_attributes` (
  `id` int NOT NULL,
  `class_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `encapsulation` enum('private','public','protected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'public',
  `data_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `example_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_attributes`
--

INSERT INTO `class_attributes` (`id`, `class_id`, `name`, `encapsulation`, `data_type`, `data_size`, `description`, `example_format`, `project_id`) VALUES
(1, 'CL-01', 'x1', 'private', 'String', '10', 'x1', 'x1', 1),
(29, 'CL-01', 'fullName', 'public', 'String', '', 'ชื่อเต็มของ User', 'Name Surname', 8),
(30, 'CL-01', 'username', 'public', 'String', '', 'Username ของ User', 'abc123456', 8),
(31, 'CL-01', 'password', 'public', 'String', '', 'Password ของ User', 'abc123456', 8),
(32, 'CL-01', 'email', 'public', 'String', '', 'Email ของ User', 'abc@abc.com', 8),
(33, 'CL-01', 'tell', 'public', 'String', '', 'เบอร์มือถือของ User', '0123456789', 8),
(34, 'CL-02', 'title', 'public', 'String', '', 'หัวข้อ', '', 8),
(35, 'CL-02', 'content', 'public', 'String', '', 'content หน้าที่เรียกดู', '', 8),
(36, 'CL-03', 'title', 'public', 'String', '', 'หัวข้อ', '', 8),
(37, 'CL-03', 'content', 'public', 'String', '', 'เนื้อหา', '', 8),
(38, 'CL-03', 'feedbackId', 'public', 'String', '', 'รหัสข้อเสนอแนะ', '', 8);

-- --------------------------------------------------------

--
-- Table structure for table `class_implements`
--

CREATE TABLE `class_implements` (
  `id` int NOT NULL,
  `class_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int NOT NULL DEFAULT '1',
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `impl_class_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_methods`
--

CREATE TABLE `class_methods` (
  `id` int NOT NULL,
  `class_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Constructor/Overload','Method','Abstract Method') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Method',
  `encapsulation` enum('private','public','protected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'public',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `return_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_data_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'void',
  `return_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `project_id` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_methods`
--

INSERT INTO `class_methods` (`id`, `class_id`, `type`, `encapsulation`, `name`, `description`, `return_value`, `return_data_type`, `return_description`, `project_id`) VALUES
(1, 'CL-01', 'Method', 'public', 'y1', 'y1', 'z1', 'void', 'z1', 1),
(9, 'CL-01', 'Method', 'public', 'login', 'Method สำหรับลงชื่อเข้าใช้', '', 'void', '', 8),
(10, 'CL-02', 'Method', 'public', 'viewPages', 'Method สำหรับเรียกดูหน้า', 'content', 'content', 'คืนค่าหน้าที่เรียกดู', 8),
(11, 'CL-03', 'Method', 'public', 'sendFeedback', 'Method สำหรับการส่งข้อเสนอแนะ', '', 'void', '', 8),
(12, 'CL-03', 'Method', 'public', 'viewFeedback', 'Method สำหรับเรียกดูข้อเสนอแนะ', 'content', 'content', 'แสดงเนื้อหา', 8);

-- --------------------------------------------------------

--
-- Table structure for table `diagrams`
--

CREATE TABLE `diagrams` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `type` enum('use-case','class','activity') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pic` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diagrams`
--

INSERT INTO `diagrams` (`id`, `project_id`, `type`, `title`, `file_name`, `image_path`, `pic`) VALUES
(14, 8, 'use-case', 'Use Case Diagram', 'Untitled Diagram.jpg', '/diagram_pic/use-case/diagram_use-case_pro_57246.jpg', '/diagram_pic/use-case/diagram_use-case_pro_57246.jpg'),
(15, 8, 'class', 'Class Diagram', 'Untitled Diagram (1).jpg', '/diagram_pic/class/diagram_class_pro_30891.jpg', '/diagram_pic/class/diagram_class_pro_30891.jpg'),
(16, 8, 'activity', 'Use Case Diagram', 'ex-diagram.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `method_parameters`
--

CREATE TABLE `method_parameters` (
  `id` int NOT NULL,
  `method_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `method_parameters`
--

INSERT INTO `method_parameters` (`id`, `method_id`, `name`, `data_type`, `description`) VALUES
(1, 1, 'a1', 'String', 'a1'),
(13, 9, 'username', 'String', 'username สำหรับลงชื่อเข้าใช้งาน'),
(14, 9, 'password', 'String', 'password สำหรับลงชื่อเข้าใช้งาน'),
(15, 11, 'title', 'String', 'หัวข้อ'),
(16, 11, 'content', 'String', 'เนื้อหา'),
(17, 12, 'feedbackId', 'String', 'รหัสข้อเสนอแนะ');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `detail`, `created_by`) VALUES
(8, 'ทดสอบการทำงานโดยรวม', 'ทดสอบการทำงานโดยรวมของการใส่ข้อมูลเกี่ยวกับแผนภาพ การแสดง Ontology Graph และ Diagram Reference', 10),
(10, 'ทดสอบเพิ่มเข้า Team', '', 10);

-- --------------------------------------------------------

--
-- Table structure for table `project_members`
--

CREATE TABLE `project_members` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Owner','Editor','Viewer') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Editor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_members`
--

INSERT INTO `project_members` (`id`, `project_id`, `user_id`, `email`, `role`) VALUES
(9, 8, 10, 'pro@gmail.com', 'Owner'),
(12, 10, 10, 'pro@gmail.com', 'Owner'),
(13, 10, 9, 'standard@gmail.com', 'Editor');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan` enum('Standard','Pro','Admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Standard',
  `pic` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `receipt` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password_hash`, `username`, `name`, `phone`, `plan`, `pic`, `description`, `role`, `receipt`) VALUES
(9, 'standard@gmail.com', '$2b$10$ushz.6OHVF.GUVLnewMuoulmO/JWcSphWgakWdYzhgZvCykjE2Yx6', 'standard', 'Standard User', '0123456789', 'Standard', '/user_pic/user-1789656023007-574832842.jpg', NULL, 'user', NULL),
(10, 'pro@gmail.com', '$2b$10$7lszxSwdDj0nYv1puUEZnOe.gJB1UP30uyJo9T9Z1aUYa5WIiE9Nu', 'pro', 'pro', NULL, 'Pro', NULL, NULL, 'user', '/user_pic/Receipt/user-20261012-836197.webp'),
(11, 'admin@gmail.com', '$2b$10$Gqtq3r7E5Rud9wOOH1mRdeNK2X/RXUkZoa.ScYiLDw5vyu7r4EVs2', 'admin', 'Admin', NULL, 'Admin', NULL, NULL, 'admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `use_cases`
--

CREATE TABLE `use_cases` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Use Case','Actor') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Use Case',
  `caption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `project_id` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `use_cases`
--

INSERT INTO `use_cases` (`id`, `type`, `caption`, `description`, `project_id`) VALUES
('UC-01', 'Actor', 'User', 'สัญลักษณ์ผู้ใช้งานระบบนี้', 8),
('UC-02', 'Actor', 'ผู้ดูแลระบบ', 'ผู้ที่ดูแลระบบในหลังบ้าน', 1),
('UC-02', 'Use Case', 'login', 'ลงชื่อเข้าใช้งานในระบบ', 8),
('UC-03', 'Actor', 'ผู้ใช้งาน', 'ผู้ใช้งานที่รวมทั้ง สมาชิกและผู้ดูแลระบบ', 1),
('UC-03', 'Use Case', 'view page', 'แสดงผลหน้าต่างๆ ของเว็บไซต์ที่เรียกดู', 8),
('UC-04', 'Use Case', 'send feedback', 'ส่งข้อเสนอแนะกลับไปหาผู้ดูแลหรือพนักงานที่ดูแลระบบ', 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_actions`
--
ALTER TABLE `activity_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_diagram_id` (`activity_diagram_id`);

--
-- Indexes for table `activity_decision_criteria`
--
ALTER TABLE `activity_decision_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `decision_node_id` (`decision_node_id`);

--
-- Indexes for table `activity_decision_nodes`
--
ALTER TABLE `activity_decision_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_diagram_id` (`activity_diagram_id`);

--
-- Indexes for table `activity_diagrams`
--
ALTER TABLE `activity_diagrams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_end_points`
--
ALTER TABLE `activity_end_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_diagram_id` (`activity_diagram_id`);

--
-- Indexes for table `activity_start_points`
--
ALTER TABLE `activity_start_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_diagram_id` (`activity_diagram_id`);

--
-- Indexes for table `activity_swimlanes`
--
ALTER TABLE `activity_swimlanes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_diagram_id` (`activity_diagram_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`,`project_id`);

--
-- Indexes for table `class_attributes`
--
ALTER TABLE `class_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_attributes_ibfk_1` (`class_id`,`project_id`);

--
-- Indexes for table `class_implements`
--
ALTER TABLE `class_implements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_implements_ibfk_1` (`class_id`,`project_id`);

--
-- Indexes for table `class_methods`
--
ALTER TABLE `class_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_methods_ibfk_1` (`class_id`,`project_id`);

--
-- Indexes for table `diagrams`
--
ALTER TABLE `diagrams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `method_parameters`
--
ALTER TABLE `method_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `method_id` (`method_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `project_members`
--
ALTER TABLE `project_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `use_cases`
--
ALTER TABLE `use_cases`
  ADD PRIMARY KEY (`id`,`project_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_actions`
--
ALTER TABLE `activity_actions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `activity_decision_criteria`
--
ALTER TABLE `activity_decision_criteria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `activity_decision_nodes`
--
ALTER TABLE `activity_decision_nodes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `activity_diagrams`
--
ALTER TABLE `activity_diagrams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `activity_end_points`
--
ALTER TABLE `activity_end_points`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `activity_start_points`
--
ALTER TABLE `activity_start_points`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `activity_swimlanes`
--
ALTER TABLE `activity_swimlanes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `class_attributes`
--
ALTER TABLE `class_attributes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `class_implements`
--
ALTER TABLE `class_implements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class_methods`
--
ALTER TABLE `class_methods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `diagrams`
--
ALTER TABLE `diagrams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `method_parameters`
--
ALTER TABLE `method_parameters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `project_members`
--
ALTER TABLE `project_members`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_actions`
--
ALTER TABLE `activity_actions`
  ADD CONSTRAINT `activity_actions_ibfk_1` FOREIGN KEY (`activity_diagram_id`) REFERENCES `activity_diagrams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `activity_decision_criteria`
--
ALTER TABLE `activity_decision_criteria`
  ADD CONSTRAINT `activity_decision_criteria_ibfk_1` FOREIGN KEY (`decision_node_id`) REFERENCES `activity_decision_nodes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `activity_decision_nodes`
--
ALTER TABLE `activity_decision_nodes`
  ADD CONSTRAINT `activity_decision_nodes_ibfk_1` FOREIGN KEY (`activity_diagram_id`) REFERENCES `activity_diagrams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `activity_end_points`
--
ALTER TABLE `activity_end_points`
  ADD CONSTRAINT `activity_end_points_ibfk_1` FOREIGN KEY (`activity_diagram_id`) REFERENCES `activity_diagrams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `activity_start_points`
--
ALTER TABLE `activity_start_points`
  ADD CONSTRAINT `activity_start_points_ibfk_1` FOREIGN KEY (`activity_diagram_id`) REFERENCES `activity_diagrams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `activity_swimlanes`
--
ALTER TABLE `activity_swimlanes`
  ADD CONSTRAINT `activity_swimlanes_ibfk_1` FOREIGN KEY (`activity_diagram_id`) REFERENCES `activity_diagrams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `class_attributes`
--
ALTER TABLE `class_attributes`
  ADD CONSTRAINT `class_attributes_ibfk_1` FOREIGN KEY (`class_id`,`project_id`) REFERENCES `classes` (`id`, `project_id`) ON DELETE CASCADE;

--
-- Constraints for table `class_implements`
--
ALTER TABLE `class_implements`
  ADD CONSTRAINT `class_implements_ibfk_1` FOREIGN KEY (`class_id`,`project_id`) REFERENCES `classes` (`id`, `project_id`) ON DELETE CASCADE;

--
-- Constraints for table `class_methods`
--
ALTER TABLE `class_methods`
  ADD CONSTRAINT `class_methods_ibfk_1` FOREIGN KEY (`class_id`,`project_id`) REFERENCES `classes` (`id`, `project_id`) ON DELETE CASCADE;

--
-- Constraints for table `diagrams`
--
ALTER TABLE `diagrams`
  ADD CONSTRAINT `diagrams_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `method_parameters`
--
ALTER TABLE `method_parameters`
  ADD CONSTRAINT `method_parameters_ibfk_1` FOREIGN KEY (`method_id`) REFERENCES `class_methods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_members`
--
ALTER TABLE `project_members`
  ADD CONSTRAINT `project_members_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
