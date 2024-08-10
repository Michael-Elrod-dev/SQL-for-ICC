-- Create schema
CREATE SCHEMA `icc`;

-- Create the job table
CREATE TABLE job (
    job_id INT PRIMARY KEY AUTO_INCREMENT,
    job_title VARCHAR(255) NOT NULL,
    job_clientname VARCHAR(50),
    job_clientphone CHAR(10),
    job_clientemail VARCHAR(50),
    job_startdate CHAR(7) NOT NULL,
    job_location VARCHAR(255),
    job_description VARCHAR(255)
);

-- Create the phase table
CREATE TABLE phase (
    phase_id INT PRIMARY KEY AUTO_INCREMENT,
    job_id INT,
    phase_title VARCHAR(255) NOT NULL,
    phase_description VARCHAR(255) NOT NULL,
    FOREIGN KEY (job_id) REFERENCES job(job_id)
);

-- Create the task table
CREATE TABLE task (
    task_id INT PRIMARY KEY AUTO_INCREMENT,
    phase_id INT,
    task_title VARCHAR(255) NOT NULL,
    task_startdate CHAR(8) NOT NULL,
    task_duration CHAR(3) NOT NULL,
    task_details VARCHAR(255),
    task_status CHAR(1) DEFAULT '0',
    FOREIGN KEY (phase_id) REFERENCES phase(phase_id)
);

-- Create the material table
CREATE TABLE material (
    mat_id INT PRIMARY KEY AUTO_INCREMENT,
    phase_id INT,
    mat_title VARCHAR(255) NOT NULL,
    mat_startdate CHAR(8) NOT NULL,
    mat_duration CHAR(3) NOT NULL,
    mat_details VARCHAR(255),
    mat_status CHAR(1) DEFAULT '0',
    FOREIGN KEY (phase_id) REFERENCES phase(phase_id)
);

-- Create the note table
CREATE TABLE note (
    note_id INT PRIMARY KEY AUTO_INCREMENT,
    phase_id INT,
    note_details VARCHAR(255) NOT NULL,
    FOREIGN KEY (phase_id) REFERENCES phase(phase_id)
);

-- Create the user table
CREATE TABLE user (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name CHAR(50) NOT NULL,
    user_phone CHAR(10) NOT NULL,
    user_email CHAR(50) NOT NULL
);

-- Create the user_task table
CREATE TABLE user_task (
    user_id INT,
    task_id INT,
    PRIMARY KEY (user_id, task_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (task_id) REFERENCES task(task_id)
);

-- Create the user_material table
CREATE TABLE user_material (
    user_id INT,
    mat_id INT,
    PRIMARY KEY (user_id, mat_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (mat_id) REFERENCES material(mat_id)
);
