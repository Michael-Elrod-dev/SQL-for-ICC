-- Create schema
CREATE DATABASE IF NOT EXISTS `icc`;
USE `icc`;

-- Create the app_user table first since it's referenced by other tables
CREATE TABLE app_user (
   user_id INT AUTO_INCREMENT PRIMARY KEY,
   user_type VARCHAR(12) NOT NULL,
   CONSTRAINT chk_user_type CHECK (user_type IN ('Owner','Admin', 'User', 'Client')),
   user_name VARCHAR(50) NOT NULL,
   user_phone VARCHAR(15) NOT NULL,
   user_email VARCHAR(50) NOT NULL UNIQUE,
   created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create the job table
CREATE TABLE job (
   job_id INT AUTO_INCREMENT PRIMARY KEY,
   job_title VARCHAR(50) NOT NULL,
   job_startdate DATE NOT NULL,
   job_location VARCHAR(50),
   job_description TEXT,
   job_floorplan LONGBLOB,
   client_id INT,
   created_by INT NOT NULL,
   FOREIGN KEY (client_id) REFERENCES app_user(user_id),
   FOREIGN KEY (created_by) REFERENCES app_user(user_id),
   created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create the phase table
CREATE TABLE phase (
   phase_id INT AUTO_INCREMENT PRIMARY KEY,
   job_id INT NOT NULL,
   phase_title VARCHAR(50) NOT NULL,
   phase_duration INT NOT NULL,
   phase_description TEXT,
   created_by INT NOT NULL,
   FOREIGN KEY (job_id) REFERENCES job(job_id),
   FOREIGN KEY (created_by) REFERENCES app_user(user_id),
   created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create the task table
CREATE TABLE task (
   task_id INT AUTO_INCREMENT PRIMARY KEY,
   phase_id INT NOT NULL,
   task_title VARCHAR(50) NOT NULL,
   task_startdate DATE NOT NULL,
   task_duration INT NOT NULL,
   task_description TEXT NOT NULL,
   task_status VARCHAR(20) NOT NULL,
   CONSTRAINT chk_task_status CHECK (task_status IN ('Incomplete', 'Complete')),
   created_by INT NOT NULL,
   FOREIGN KEY (phase_id) REFERENCES phase(phase_id),
   FOREIGN KEY (created_by) REFERENCES app_user(user_id),
   created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create the material table
CREATE TABLE material (
   material_id INT AUTO_INCREMENT PRIMARY KEY,
   phase_id INT NOT NULL,
   material_title VARCHAR(50) NOT NULL,
   material_duedate DATE NOT NULL,
   material_description TEXT NOT NULL,
   material_status VARCHAR(20) NOT NULL,
   CONSTRAINT chk_material_status CHECK (material_status IN ('Incomplete', 'Complete')),
   created_by INT NOT NULL,
   FOREIGN KEY (phase_id) REFERENCES phase(phase_id),
   FOREIGN KEY (created_by) REFERENCES app_user(user_id),
   created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create the note table
CREATE TABLE note (
   note_id INT AUTO_INCREMENT PRIMARY KEY,
   phase_id INT NOT NULL,
   note_details TEXT NOT NULL,
   created_by INT NOT NULL,
   FOREIGN KEY (phase_id) REFERENCES phase(phase_id),
   FOREIGN KEY (created_by) REFERENCES app_user(user_id),
   created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create the user_task table (for task assignments)
CREATE TABLE user_task (
   user_id INT NOT NULL,
   task_id INT NOT NULL,
   assigned_by INT NOT NULL,
   PRIMARY KEY (user_id, task_id),
   FOREIGN KEY (user_id) REFERENCES app_user(user_id),
   FOREIGN KEY (task_id) REFERENCES task(task_id),
   FOREIGN KEY (assigned_by) REFERENCES app_user(user_id),
   created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create the user_material table (for material assignments)
CREATE TABLE user_material (
   user_id INT NOT NULL,
   material_id INT NOT NULL,
   assigned_by INT NOT NULL,
   PRIMARY KEY (user_id, material_id),
   FOREIGN KEY (user_id) REFERENCES app_user(user_id),
   FOREIGN KEY (material_id) REFERENCES material(material_id),
   FOREIGN KEY (assigned_by) REFERENCES app_user(user_id),
   created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);