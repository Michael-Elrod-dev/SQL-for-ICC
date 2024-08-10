-- Use schema
USE `icc`;

-- Insert sample data into job table
INSERT INTO job (job_title, job_clientname, job_clientphone, job_clientemail, job_startdate, job_location, job_description)
VALUES 
('Website Redesign', 'John Doe', '1234567890', 'john@example.com', '2024-08', 'Remote', 'Redesign company website'),
('Mobile App Development', 'Jane Smith', '9876543210', 'jane@example.com', '2024-09', 'On-site', 'Develop iOS and Android app');

-- Insert sample data into phase table
INSERT INTO phase (job_id, phase_title, phase_description)
VALUES 
(1, 'Design', 'Create wireframes and mockups'),
(1, 'Development', 'Implement the design'),
(2, 'Planning', 'Define app requirements and features'),
(2, 'Development', 'Code the app for both platforms');

-- Insert sample data into task table
INSERT INTO task (phase_id, task_title, task_startdate, task_duration, task_details, task_status)
VALUES 
(1, 'Create Homepage Wireframe', '20240801', '003', 'Design homepage layout', '1'),
(2, 'Implement Frontend', '20240815', '014', 'Develop HTML/CSS/JS for the website', '0'),
(3, 'Define User Stories', '20240901', '005', 'Create list of user stories for the app', '1'),
(4, 'Develop iOS Version', '20240915', '030', 'Code the iOS version of the app', '0');

-- Insert sample data into material table
INSERT INTO material (phase_id, mat_title, mat_startdate, mat_duration, mat_details, mat_status)
VALUES 
(1, 'Design Software License', '20240801', '030', 'Monthly subscription for design software', '1'),
(2, 'Web Hosting', '20240815', '365', 'Annual web hosting plan', '1'),
(3, 'Project Management Tool', '20240901', '030', 'Monthly subscription for PM software', '1'),
(4, 'iOS Developer Account', '20240915', '365', 'Annual iOS developer account', '1');

-- Insert sample data into note table
INSERT INTO note (phase_id, note_details)
VALUES 
(1, 'Client prefers a minimalist design'),
(2, 'Ensure mobile responsiveness'),
(3, 'Include offline functionality in requirements'),
(4, 'Use Swift for iOS development');

-- Insert sample data into user table
INSERT INTO user (user_name, user_phone, user_email)
VALUES 
('Alice Johnson', '1112223333', 'alice@example.com'),
('Bob Williams', '4445556666', 'bob@example.com'),
('Charlie Brown', '7778889999', 'charlie@example.com');

-- Insert sample data into user_task table
INSERT INTO user_task (user_id, task_id)
VALUES 
(1, 1),
(1, 2),
(2, 3),
(3, 4);

-- Insert sample data into user_material table
INSERT INTO user_material (user_id, mat_id)
VALUES 
(1, 1),
(2, 2),
(2, 3),
(3, 4);