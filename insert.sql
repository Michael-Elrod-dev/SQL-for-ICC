-- Use the icc database
USE icc;
GO

-- Populate the user table
INSERT INTO [user] (user_type, user_name, user_phone, user_email) VALUES
('Owner', 'John Smith', '5551234567', 'john.smith@example.com'),
('Admin', 'Jane Doe', '5559876543', 'jane.doe@example.com'),
('Contractor', 'Bob Builder', '5552223333', 'bob.builder@example.com'),
('User', 'Alice Johnson', '5554445555', 'alice.johnson@example.com'),
('Client', 'Charlie Brown', '5556667777', 'charlie.brown@example.com');

-- Populate the job table
INSERT INTO job (client_id, job_title, job_startdate, job_location, job_description) VALUES
(5, 'Home Renovation', '2024-09-01', '123 Main St, Anytown, USA', 'Complete home renovation including kitchen and bathroom remodel'),
(5, 'Office Expansion', '2024-10-15', '456 Business Ave, Cityville, USA', 'Expand office space and add new conference room');

-- Populate the phase table
INSERT INTO phase (job_id, phase_title, phase_description) VALUES
(1, 'Kitchen Remodel', 'Remodel kitchen with new cabinets, countertops, and appliances'),
(1, 'Bathroom Renovation', 'Update bathroom with new fixtures and tiling'),
(2, 'Wall Removal', 'Remove existing walls to create open office space'),
(2, 'Conference Room Construction', 'Build new conference room with state-of-the-art technology');

-- Populate the task table
INSERT INTO task (phase_id, task_title, task_startdate, task_duration, task_details, task_status) VALUES
(1, 'Demo Old Kitchen', '2024-09-01', 3, 'Remove old cabinets, countertops, and appliances', 'Not Started'),
(1, 'Install New Cabinets', '2024-09-04', 5, 'Install new custom cabinets', 'Not Started'),
(2, 'Bathroom Demolition', '2024-09-10', 2, 'Remove old fixtures and tiles', 'Not Started'),
(2, 'Tile Installation', '2024-09-12', 4, 'Install new floor and wall tiles', 'Not Started'),
(3, 'Wall Demolition', '2024-10-15', 3, 'Carefully remove existing walls', 'Not Started'),
(3, 'Structural Reinforcement', '2024-10-18', 2, 'Add necessary structural support', 'Not Started'),
(4, 'Frame Conference Room', '2024-10-20', 4, 'Frame new conference room walls', 'Not Started'),
(4, 'Install AV Equipment', '2024-10-25', 3, 'Set up audio-visual equipment in new conference room', 'Not Started');

-- Populate the material table
INSERT INTO material (phase_id, mat_title, mat_startdate, mat_duration, mat_details, mat_status) VALUES
(1, 'Kitchen Cabinets', '2024-08-25', 7, 'Custom kitchen cabinets', 'Not Ordered'),
(1, 'Countertops', '2024-08-28', 5, 'Granite countertops', 'Not Ordered'),
(2, 'Bathroom Tiles', '2024-09-05', 5, 'Ceramic floor and wall tiles', 'Not Ordered'),
(2, 'Bathroom Fixtures', '2024-09-07', 3, 'New sink, toilet, and shower fixtures', 'Not Ordered'),
(3, 'Support Beams', '2024-10-10', 5, 'Steel support beams for structural reinforcement', 'Not Ordered'),
(4, 'Conference Room Doors', '2024-10-18', 7, 'Glass doors for conference room', 'Not Ordered');

-- Populate the note table
INSERT INTO note (phase_id, note_details) VALUES
(1, 'Client prefers a modern design for the kitchen'),
(2, 'Use water-resistant materials in the bathroom'),
(3, 'Ensure proper permits are obtained before wall removal'),
(4, 'Conference room should be soundproofed');

-- Populate the user_task table
INSERT INTO user_task (user_id, task_id) VALUES
(3, 1), (3, 2), (3, 3), (3, 4), (3, 5), (3, 6), (3, 7), (3, 8);

-- Populate the user_material table
INSERT INTO user_material (user_id, mat_id) VALUES
(2, 1), (2, 2), (2, 3), (2, 4), (2, 5), (2, 6);
