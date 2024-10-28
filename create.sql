-- Create schema
CREATE DATABASE `icc`;
USE `icc`;
GO

-- Create the user table first since it's referenced by other tables
CREATE TABLE [user] (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    user_type VARCHAR(12) NOT NULL CHECK (user_type IN ('Owner', 'Admin', 'Contractor', 'User', 'Client')),
    user_name VARCHAR(50) NOT NULL,
    user_phone CHAR(10) NOT NULL,
    user_email VARCHAR(50) NOT NULL
);

-- Create the job table
CREATE TABLE job (
    job_id INT IDENTITY(1,1) PRIMARY KEY,
    client_id INT,
    job_title VARCHAR(50) NOT NULL,
    job_startdate DATE NOT NULL,
    job_location VARCHAR(50),
    job_description VARCHAR(MAX),
    FOREIGN KEY (client_id) REFERENCES [user](user_id)
);

-- Create the phase table
CREATE TABLE phase (
    phase_id INT IDENTITY(1,1) PRIMARY KEY,
    job_id INT NOT NULL,
    phase_title VARCHAR(50) NOT NULL,
    phase_description VARCHAR(MAX),
    FOREIGN KEY (job_id) REFERENCES job(job_id)
);

-- Create the task table
CREATE TABLE task (
    task_id INT IDENTITY(1,1) PRIMARY KEY,
    phase_id INT NOT NULL,
    task_title VARCHAR(50) NOT NULL,
    task_startdate DATE NOT NULL,
    task_duration INT NOT NULL,
    task_details VARCHAR(MAX),
    task_status VARCHAR(20) NOT NULL CHECK (task_status IN ('Not Started', 'In Progress', 'Completed')),
    FOREIGN KEY (phase_id) REFERENCES phase(phase_id)
);

-- Create the material table
CREATE TABLE material (
    mat_id INT IDENTITY(1,1) PRIMARY KEY,
    phase_id INT NOT NULL,
    mat_title VARCHAR(50) NOT NULL,
    mat_startdate DATE NOT NULL,
    mat_duration INT NOT NULL,
    mat_details VARCHAR(MAX),
    mat_status VARCHAR(20) NOT NULL CHECK (mat_status IN ('Not Ordered', 'Ordered', 'Delivered')),
    FOREIGN KEY (phase_id) REFERENCES phase(phase_id)
);

-- Create the note table
CREATE TABLE note (
    note_id INT IDENTITY(1,1) PRIMARY KEY,
    phase_id INT NOT NULL,
    note_details VARCHAR(MAX) NOT NULL,
    FOREIGN KEY (phase_id) REFERENCES phase(phase_id)
);

-- Create the user_task table
CREATE TABLE user_task (
    user_id INT NOT NULL,
    task_id INT NOT NULL,
    PRIMARY KEY (user_id, task_id),
    FOREIGN KEY (user_id) REFERENCES [user](user_id),
    FOREIGN KEY (task_id) REFERENCES task(task_id)
);

-- Create the user_material table
CREATE TABLE user_material (
    user_id INT NOT NULL,
    mat_id INT NOT NULL,
    PRIMARY KEY (user_id, mat_id),
    FOREIGN KEY (user_id) REFERENCES [user](user_id),
    FOREIGN KEY (mat_id) REFERENCES material(mat_id)
);
