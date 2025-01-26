-- Use schema
USE `icc_database`;

-- Drop tables with foreign keys first
DROP TABLE IF EXISTS user_material;
DROP TABLE IF EXISTS user_task;
DROP TABLE IF EXISTS note;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS task;
DROP TABLE IF EXISTS phase;
DROP TABLE IF EXISTS job;
DROP TABLE IF EXISTS invite_code;
DROP TABLE IF EXISTS job_floorplan;
DROP TABLE IF EXISTS password_reset_token;
DROP TABLE IF EXISTS app_user;

-- Drop schema
DROP SCHEMA IF EXISTS `icc_database`;