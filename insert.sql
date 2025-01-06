USE icc;

-- Insert app_users
INSERT INTO app_user (user_type, user_first_name, user_last_name, user_phone, user_email, password)
VALUES 
    -- Owners (Company Principals)
    ('Owner', 'Michael', 'Elrod', '8032308694', 'michaelelrod.dev@gmail.com', '$2a$12$wfa32EkxHD4SvsbiAg/Au.jvOsYxKzmcgmVssHlbMIiNyLftJK6zO'),
    
    -- Admins (Project Managers/Superintendents)
    ('Admin', 'Michael', 'Chen', '5015550201', 'michael.c@icc.com', '$2a$12$wfa32EkxHD4SvsbiAg/Au.jvOsYxKzmcgmVssHlbMIiNyLftJK6zO'),

    -- Users (Field Staff)
    ('User', 'Emma', 'Davis', '5015550301', 'emma.d@icc.com', '$2a$12$wfa32EkxHD4SvsbiAg/Au.jvOsYxKzmcgmVssHlbMIiNyLftJK6zO'),
    ('User', 'James', 'Brown', '5015550302', 'james.b@icc.com', '$2a$12$wfa32EkxHD4SvsbiAg/Au.jvOsYxKzmcgmVssHlbMIiNyLftJK6zO'),
    ('User', 'Maria', 'Garcia', '5015550303', 'maria.g@icc.com', '$2a$12$wfa32EkxHD4SvsbiAg/Au.jvOsYxKzmcgmVssHlbMIiNyLftJK6zO'),
    
    -- Clients (Property Developers/Owners) - Note: no passwords for clients
    ('Client', 'Commercial', 'Properties', '5015550401', 'contact@commercial-prop.com', NULL),
    ('Client', 'Industrial', 'Developers', '5015550402', 'projects@industrial-dev.com', NULL);
    
-- -- Insert jobs
-- INSERT INTO job (job_title, job_startdate, job_location, job_description, client_id, created_by)
-- VALUES
--     ('Mixed-Use Development', '2024-06-01', 'Los Angeles, CA', 
--         '12-story mixed-use building with ground floor retail, 5 floors of office space, and 6 floors of residential units. 150,000 sq ft total.', 
--         (SELECT user_id FROM app_user WHERE user_email = 'contact@commercial-prop.com'),
--         (SELECT user_id FROM app_user WHERE user_email = 'john.smith@icc.com')),
        
--     ('Industrial Park Buildings', '2024-07-15', 'San Francisco, CA', 
--         'Construction of three tilt-up concrete industrial buildings totaling 275,000 sq ft with associated site work and infrastructure',
--         (SELECT user_id FROM app_user WHERE user_email = 'projects@industrial-dev.com'),
--         (SELECT user_id FROM app_user WHERE user_email = 'sarah.j@icc.com'));

-- -- Phases for Mixed-Use Development (Job 1)
-- INSERT INTO phase (job_id, phase_title, phase_startdate, phase_description, created_by)
-- VALUES
--     ((SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development'), 
--      'Site Work & Foundations', '2024-06-01', 
--      'Site clearing, excavation, utilities, footings and foundation installation', 
--      (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    
--     ((SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development'), 
--      'Parking Structure', '2024-08-01', 
--      'Two-level underground parking structure construction',
--      (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    
--     ((SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development'), 
--      'Core & Shell', '2024-10-01', 
--      'Structural steel, concrete decks, exterior walls, and roof installation',
--      (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com'));

-- -- Tasks for Site Work & Foundations Phase
-- INSERT INTO task (phase_id, task_title, task_startdate, task_duration, task_description, task_status, created_by)
-- VALUES
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Site Work & Foundations' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Site Clearing', '2024-06-01', 10, 'Clear site, remove existing structures and obstructions', 'Complete',
--      (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Site Work & Foundations' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Excavation', '2024-06-11', 15, 'Mass excavation for underground parking levels', 'Complete',
--      (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Site Work & Foundations' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Utility Installation', '2024-06-26', 20, 'Install main utility lines and connections', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Site Work & Foundations' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Foundation System', '2024-07-16', 15, 'Install footings and foundation walls', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com'));

-- -- Tasks for Parking Structure Phase
-- INSERT INTO task (phase_id, task_title, task_startdate, task_duration, task_description, task_status, created_by)
-- VALUES
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Parking Structure' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Waterproofing', '2024-07-31', 15, 'Install foundation waterproofing system', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'james.b@icc.com')),
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Parking Structure' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Rebar Installation', '2024-08-15', 25, 'Place reinforcing steel for walls and decks', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'james.b@icc.com')),
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Parking Structure' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Concrete Pours', '2024-09-09', 30, 'Form and pour concrete walls and deck slabs', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'james.b@icc.com')),
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Parking Structure' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'MEP Rough-in', '2024-10-09', 20, 'Install mechanical, electrical, plumbing systems', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'james.b@icc.com'));

-- -- Tasks for Core & Shell Phase
-- INSERT INTO task (phase_id, task_title, task_startdate, task_duration, task_description, task_status, created_by)
-- VALUES
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Core & Shell' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Steel Erection', '2024-10-01', 40, 'Erect structural steel frame', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Core & Shell' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Deck Installation', '2024-11-10', 30, 'Install metal decking and pour concrete floors', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Core & Shell' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Exterior Walls', '2024-12-10', 35, 'Install curtain wall and exterior cladding', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com'));

-- -- Materials for Mixed-Use Development phases
-- INSERT INTO material (phase_id, material_title, material_duedate, material_description, material_status, created_by)
-- VALUES
--     -- Materials for Site Work & Foundations Phase
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Site Work & Foundations' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Erosion Control', '2024-06-01', 'Silt fence, hay bales, and erosion control measures', 'Complete',
--      (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Site Work & Foundations' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Storm Pipe', '2024-06-15', '24" RCP storm drain pipe - 500 LF', 'Complete',
--      (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Site Work & Foundations' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Foundation Rebar', '2024-07-01', '#6 and #8 rebar for foundation - 25 tons', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),

--     -- Materials for Parking Structure Phase
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Parking Structure' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Waterproofing Membrane', '2024-07-25', 'Sheet waterproofing system - 15,000 SF', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'james.b@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Parking Structure' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Concrete Mix', '2024-08-20', '5000 PSI concrete mix - 2,000 CY', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'james.b@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Parking Structure' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Rebar Bundle', '2024-08-10', 'Various sizes rebar for structure - 50 tons', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'james.b@icc.com')),

--     -- Materials for Core & Shell Phase
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Core & Shell' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Structural Steel', '2024-09-25', 'Fabricated structural steel members - 800 tons', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Core & Shell' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Metal Decking', '2024-11-01', '3" metal deck - 100,000 SF', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Core & Shell' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Curtain Wall', '2024-12-01', 'Glazed curtain wall system - 80,000 SF', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com'));

-- -- Phases for Industrial Park Buildings
-- INSERT INTO phase (job_id, phase_title, phase_startdate, phase_description, created_by)
-- VALUES
--     ((SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings'),
--      'Site Development', '2024-07-15', 'Grading, utilities, paving, and retention pond construction',
--      (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    
--     ((SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings'),
--      'Building A Construction', '2024-09-01', 'Foundation, tilt-up panels, and roof for first building',
--      (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    
--     ((SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings'),
--      'Interior Systems', '2024-11-15', 'MEP systems and interior finishes',
--      (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com'));

-- -- Tasks for Industrial Park Buildings phases
-- INSERT INTO task (phase_id, task_title, task_startdate, task_duration, task_description, task_status, created_by)
-- VALUES
--     -- Site Development tasks
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Site Development' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'Site Grading', '2024-07-15', 15, 'Mass grading and soil stabilization', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Site Development' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'Underground Utilities', '2024-07-30', 20, 'Install storm, sewer, and water lines', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Site Development' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'Paving', '2024-08-20', 10, 'Asphalt paving of parking and drive areas', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),

--     -- Building A Construction tasks
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Building A Construction' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'Foundation Work', '2024-09-01', 20, 'Pour foundations and grade beams', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Building A Construction' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'Tilt-Up Panels', '2024-09-21', 25, 'Form, pour, and erect tilt-up panels', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Building A Construction' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'Roofing', '2024-10-16', 15, 'Install roof structure and membrane', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),

--     -- Interior Systems tasks
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Interior Systems' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'MEP Rough-In', '2024-11-15', 30, 'Install mechanical, electrical, and plumbing systems', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Interior Systems' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'Interior Walls', '2024-12-15', 20, 'Frame and finish interior walls', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Interior Systems' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'Finishes', '2025-01-04', 25, 'Install flooring, paint, and final finishes', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com'));

-- -- Materials for Industrial Park Buildings phases
-- INSERT INTO material (phase_id, material_title, material_duedate, material_description, material_status, created_by)
-- VALUES
--     -- Site Development materials
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Site Development' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'Base Material', '2024-07-15', 'Crushed aggregate base - 5,000 tons', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Site Development' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'Storm Pipe', '2024-07-25', '36" RCP storm drain pipe - 1,000 LF', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Site Development' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'Asphalt', '2024-08-15', 'Hot mix asphalt - 2,000 tons', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),

--     -- Building A Construction materials
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Building A Construction' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'Concrete Forms', '2024-08-25', 'Steel forms for tilt-up panels - 20,000 SF', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Building A Construction' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'Structural Steel', '2024-09-15', 'Roof joists and girders - 200 tons', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Building A Construction' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'Roofing Material', '2024-10-10', 'TPO roofing system - 90,000 SF', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),

--     -- Interior Systems materials
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Interior Systems' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'HVAC Equipment', '2024-11-10', 'Rooftop units and ductwork', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Interior Systems' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'Electrical Gear', '2024-11-20', 'Main switchgear and panel boards', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Interior Systems' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'Interior Package', '2024-12-10', 'Doors, frames, and hardware package', 'Incomplete',
--      (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com'));

-- -- Notes for all phases
-- INSERT INTO note (phase_id, note_details, created_by)
-- VALUES
--     -- Mixed-Use Development Notes
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Site Work & Foundations' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Environmental impact study completed. All permits received.',
--      (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Site Work & Foundations' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Underground utilities mapping verified with city records.',
--      (SELECT user_id FROM app_user WHERE user_email = 'emma.d@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Parking Structure' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Waterproofing system spec updated to include additional drainage layer.',
--      (SELECT user_id FROM app_user WHERE user_email = 'james.b@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Core & Shell' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Mixed-Use Development')),
--      'Steel delivery schedule confirmed with supplier.',
--      (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),

--     -- Industrial Park Buildings Notes
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Site Development' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'Soil testing results received. Additional compaction required in building pad areas.',
--      (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Site Development' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'City approved modified retention pond design.',
--      (SELECT user_id FROM app_user WHERE user_email = 'emma.d@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Building A Construction' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'Panel erection sequence finalized with structural engineer.',
--      (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    
--     ((SELECT phase_id FROM phase WHERE phase_title = 'Interior Systems' AND job_id = (SELECT job_id FROM job WHERE job_title = 'Industrial Park Buildings')),
--      'MEP coordination drawings approved by all trades.',
--      (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com'));

-- -- User Task Assignments
-- INSERT INTO user_task (user_id, task_id, assigned_by)
-- SELECT 
--     a.user_id,
--     t.task_id,
--     b.user_id as assigned_by
-- FROM app_user a
-- CROSS JOIN task t
-- CROSS JOIN app_user b
-- WHERE 
--     -- Mixed-Use Development Task Assignments
--     (a.user_email = 'james.b@icc.com' AND t.task_title = 'Site Clearing' AND b.user_email = 'michael.c@icc.com')
--     OR (a.user_email = 'william.t@icc.com' AND t.task_title = 'Site Clearing' AND b.user_email = 'michael.c@icc.com')
--     OR (a.user_email = 'robert.t@icc.com' AND t.task_title = 'Excavation' AND b.user_email = 'michael.c@icc.com')
--     OR (a.user_email = 'maria.g@icc.com' AND t.task_title = 'Utility Installation' AND b.user_email = 'james.b@icc.com')
--     OR (a.user_email = 'sofia.p@icc.com' AND t.task_title = 'Foundation System' AND b.user_email = 'james.b@icc.com')
--     OR (a.user_email = 'emma.d@icc.com' AND t.task_title = 'Utility Installation' AND b.user_email = 'michael.c@icc.com')
--     OR (a.user_email = 'thomas.a@icc.com' AND t.task_title = 'Foundation System' AND b.user_email = 'michael.c@icc.com')
--     OR (a.user_email = 'robert.t@icc.com' AND t.task_title = 'Waterproofing' AND b.user_email = 'james.b@icc.com')
--     OR (a.user_email = 'william.t@icc.com' AND t.task_title = 'Waterproofing' AND b.user_email = 'james.b@icc.com')
--     OR (a.user_email = 'sofia.p@icc.com' AND t.task_title = 'Rebar Installation' AND b.user_email = 'james.b@icc.com')
--     OR (a.user_email = 'maria.g@icc.com' AND t.task_title = 'Rebar Installation' AND b.user_email = 'james.b@icc.com')
--     OR (a.user_email = 'thomas.a@icc.com' AND t.task_title = 'Steel Erection' AND b.user_email = 'lisa.r@icc.com')
--     OR (a.user_email = 'robert.t@icc.com' AND t.task_title = 'Steel Erection' AND b.user_email = 'lisa.r@icc.com')
--     OR (a.user_email = 'emma.d@icc.com' AND t.task_title = 'Deck Installation' AND b.user_email = 'lisa.r@icc.com')
--     OR (a.user_email = 'william.t@icc.com' AND t.task_title = 'Deck Installation' AND b.user_email = 'lisa.r@icc.com')
--     OR (a.user_email = 'jennifer.l@icc.com' AND t.task_title = 'Exterior Walls' AND b.user_email = 'david.w@icc.com')
--     OR (a.user_email = 'sofia.p@icc.com' AND t.task_title = 'Exterior Walls' AND b.user_email = 'david.w@icc.com');

-- -- User Material Assignments
-- INSERT INTO user_material (user_id, material_id, assigned_by)
-- SELECT 
--     a.user_id,
--     m.material_id,
--     b.user_id as assigned_by
-- FROM app_user a
-- CROSS JOIN material m
-- CROSS JOIN app_user b
-- WHERE 
--     -- Mixed-Use Development Material Assignments
--     (a.user_email = 'sofia.p@icc.com' AND m.material_title = 'Erosion Control' AND b.user_email = 'michael.c@icc.com')
--     OR (a.user_email = 'jennifer.l@icc.com' AND m.material_title = 'Storm Pipe' AND b.user_email = 'michael.c@icc.com')
--     OR (a.user_email = 'william.t@icc.com' AND m.material_title = 'Foundation Rebar' AND b.user_email = 'james.b@icc.com')
--     OR (a.user_email = 'robert.t@icc.com' AND m.material_title = 'Waterproofing Membrane' AND b.user_email = 'james.b@icc.com')
--     OR (a.user_email = 'emma.d@icc.com' AND m.material_title = 'Concrete Mix' AND b.user_email = 'james.b@icc.com')
--     OR (a.user_email = 'thomas.a@icc.com' AND m.material_title = 'Concrete Mix' AND b.user_email = 'james.b@icc.com')
--     OR (a.user_email = 'maria.g@icc.com' AND m.material_title = 'Rebar Bundle' AND b.user_email = 'james.b@icc.com')
--     OR (a.user_email = 'jennifer.l@icc.com' AND m.material_title = 'Rebar Bundle' AND b.user_email = 'james.b@icc.com')
--     OR (a.user_email = 'sofia.p@icc.com' AND m.material_title = 'Structural Steel' AND b.user_email = 'lisa.r@icc.com')
--     OR (a.user_email = 'thomas.a@icc.com' AND m.material_title = 'Structural Steel' AND b.user_email = 'lisa.r@icc.com')
--     OR (a.user_email = 'emma.d@icc.com' AND m.material_title = 'Metal Decking' AND b.user_email = 'lisa.r@icc.com')
--     OR (a.user_email = 'robert.t@icc.com' AND m.material_title = 'Metal Decking' AND b.user_email = 'lisa.r@icc.com')
--     OR (a.user_email = 'james.b@icc.com' AND m.material_title = 'Curtain Wall' AND b.user_email = 'david.w@icc.com')
--     OR (a.user_email = 'maria.g@icc.com' AND m.material_title = 'Curtain Wall' AND b.user_email = 'david.w@icc.com');