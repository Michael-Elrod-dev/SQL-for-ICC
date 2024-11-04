-- Create schema
CREATE DATABASE IF NOT EXISTS `icc`;
USE `icc`;

-- Create the app_user table
CREATE TABLE `app_user` (
   `user_id` int NOT NULL AUTO_INCREMENT,
   `user_type` varchar(12) NOT NULL,
   `user_name` varchar(50) NOT NULL,
   `user_phone` varchar(15) NOT NULL,
   `user_email` varchar(50) NOT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`user_id`),
   UNIQUE KEY `user_email` (`user_email`),
   CONSTRAINT `chk_user_type` CHECK ((`user_type` in ('Owner','Admin','User','Client')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create the job table
CREATE TABLE `job` (
   `job_id` int NOT NULL AUTO_INCREMENT,
   `job_title` varchar(50) NOT NULL,
   `job_startdate` date NOT NULL,
   `job_location` varchar(50) DEFAULT NULL,
   `job_description` text,
   `job_floorplan` longblob,
   `client_id` int DEFAULT NULL,
   `created_by` int NOT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   `job_status` varchar(10) NOT NULL DEFAULT 'active',
   PRIMARY KEY (`job_id`),
   KEY `client_id` (`client_id`),
   KEY `created_by` (`created_by`),
   CONSTRAINT `job_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `app_user` (`user_id`),
   CONSTRAINT `job_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `app_user` (`user_id`),
   CONSTRAINT `chk_job_status` CHECK ((`job_status` in ('active','closed','deleted')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create the phase table
CREATE TABLE `phase` (
   `phase_id` int NOT NULL AUTO_INCREMENT,
   `job_id` int NOT NULL,
   `phase_title` varchar(50) NOT NULL,
   `phase_startdate` date NOT NULL,
   `phase_description` text,
   `created_by` int NOT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`phase_id`),
   KEY `job_id` (`job_id`),
   KEY `created_by` (`created_by`),
   CONSTRAINT `phase_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`),
   CONSTRAINT `phase_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `app_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create the task table
CREATE TABLE `task` (
   `task_id` int NOT NULL AUTO_INCREMENT,
   `phase_id` int NOT NULL,
   `task_title` varchar(50) NOT NULL,
   `task_startdate` date NOT NULL,
   `task_duration` int NOT NULL,
   `task_description` text NOT NULL,
   `task_status` varchar(20) NOT NULL,
   `created_by` int NOT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`task_id`),
   KEY `phase_id` (`phase_id`),
   KEY `created_by` (`created_by`),
   CONSTRAINT `task_ibfk_1` FOREIGN KEY (`phase_id`) REFERENCES `phase` (`phase_id`),
   CONSTRAINT `task_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `app_user` (`user_id`),
   CONSTRAINT `chk_task_status` CHECK ((`task_status` in ('Incomplete','Complete')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create the material table
CREATE TABLE `material` (
   `material_id` int NOT NULL AUTO_INCREMENT,
   `phase_id` int NOT NULL,
   `material_title` varchar(50) NOT NULL,
   `material_duedate` date NOT NULL,
   `material_description` text NOT NULL,
   `material_status` varchar(20) NOT NULL,
   `created_by` int NOT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`material_id`),
   KEY `phase_id` (`phase_id`),
   KEY `created_by` (`created_by`),
   CONSTRAINT `material_ibfk_1` FOREIGN KEY (`phase_id`) REFERENCES `phase` (`phase_id`),
   CONSTRAINT `material_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `app_user` (`user_id`),
   CONSTRAINT `chk_material_status` CHECK ((`material_status` in ('Incomplete','Complete')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create the note table
CREATE TABLE `note` (
   `note_id` int NOT NULL AUTO_INCREMENT,
   `phase_id` int NOT NULL,
   `note_details` text NOT NULL,
   `created_by` int NOT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`note_id`),
   KEY `phase_id` (`phase_id`),
   KEY `created_by` (`created_by`),
   CONSTRAINT `note_ibfk_1` FOREIGN KEY (`phase_id`) REFERENCES `phase` (`phase_id`),
   CONSTRAINT `note_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `app_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create the user_task table
CREATE TABLE `user_task` (
   `user_id` int NOT NULL,
   `task_id` int NOT NULL,
   `assigned_by` int NOT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`user_id`,`task_id`),
   KEY `task_id` (`task_id`),
   KEY `assigned_by` (`assigned_by`),
   CONSTRAINT `user_task_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`),
   CONSTRAINT `user_task_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`),
   CONSTRAINT `user_task_ibfk_3` FOREIGN KEY (`assigned_by`) REFERENCES `app_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create the user_material table
CREATE TABLE `user_material` (
   `user_id` int NOT NULL,
   `material_id` int NOT NULL,
   `assigned_by` int NOT NULL,
   `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`user_id`,`material_id`),
   KEY `material_id` (`material_id`),
   KEY `assigned_by` (`assigned_by`),
   CONSTRAINT `user_material_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`),
   CONSTRAINT `user_material_ibfk_2` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`),
   CONSTRAINT `user_material_ibfk_3` FOREIGN KEY (`assigned_by`) REFERENCES `app_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;