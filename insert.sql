USE icc;

-- Insert app_users (keeping original user_types but making roles more construction-focused)
INSERT INTO app_user (user_type, user_name, user_phone, user_email)
VALUES 
    -- Owners (Company Principals)
    ('Owner', 'John Smith', '555-0101', 'john.smith@icc.com'),
    ('Owner', 'Sarah Johnson', '555-0102', 'sarah.j@icc.com'),
    
    -- Admins (Project Managers/Superintendents)
    ('Admin', 'Michael Chen', '555-0201', 'michael.c@icc.com'),    -- Senior Project Manager
    ('Admin', 'Lisa Rodriguez', '555-0202', 'lisa.r@icc.com'),     -- Project Manager
    ('Admin', 'David Wilson', '555-0203', 'david.w@icc.com'),      -- Site Superintendent
    
    -- Users (Field Staff)
    ('User', 'Emma Davis', '555-0301', 'emma.d@icc.com'),          -- Site Engineer
    ('User', 'James Brown', '555-0302', 'james.b@icc.com'),        -- Foreman
    ('User', 'Maria Garcia', '555-0303', 'maria.g@icc.com'),       -- Safety Coordinator
    ('User', 'Robert Taylor', '555-0304', 'robert.t@icc.com'),     -- Lead Carpenter
    ('User', 'Jennifer Lee', '555-0305', 'jennifer.l@icc.com'),    -- Project Coordinator
    ('User', 'William Turner', '555-0306', 'william.t@icc.com'),   -- Equipment Manager
    ('User', 'Sofia Patel', '555-0307', 'sofia.p@icc.com'),        -- Quality Control
    ('User', 'Thomas Anderson', '555-0308', 'thomas.a@icc.com'),   -- Site Supervisor
    
    -- Clients (Property Developers/Owners)
    ('Client', 'Commercial Properties LLC', '555-0401', 'contact@commercial-prop.com'),
    ('Client', 'Industrial Developers Inc', '555-0402', 'projects@industrial-dev.com'),
    ('Client', 'Retail Centers Group', '555-0403', 'build@retail-centers.com'),
    ('Client', 'Metropolitan Properties', '555-0404', 'construction@metro-prop.com'),
    ('Client', 'Educational Facilities Corp', '555-0405', 'development@edu-facilities.org'),
    ('Client', 'Healthcare Development Trust', '555-0406', 'facilities@healthcare-dev.com');

-- Insert jobs (more construction-focused projects)
INSERT INTO job (job_title, job_startdate, job_location, job_description, client_id, created_by)
VALUES
    ('Mixed-Use Development Phase 1', '2024-06-01', 'Los Angeles, CA', 
        '12-story mixed-use building with ground floor retail, 5 floors of office space, and 6 floors of residential units. 150,000 sq ft total.', 
        (SELECT user_id FROM app_user WHERE user_email = 'contact@commercial-prop.com'),
        (SELECT user_id FROM app_user WHERE user_email = 'john.smith@icc.com')),
        
    ('Industrial Park Buildings', '2024-07-15', 'San Francisco, CA', 
        'Construction of three tilt-up concrete industrial buildings totaling 275,000 sq ft with associated site work and infrastructure',
        (SELECT user_id FROM app_user WHERE user_email = 'projects@industrial-dev.com'),
        (SELECT user_id FROM app_user WHERE user_email = 'sarah.j@icc.com')),
        
    ('Distribution Center', '2024-08-01', 'Austin, TX', 
        'Pre-engineered metal building for distribution center. 180,000 sq ft with 32ft clear height, loading docks, and office space',
        (SELECT user_id FROM app_user WHERE user_email = 'build@retail-centers.com'),
        (SELECT user_id FROM app_user WHERE user_email = 'john.smith@icc.com')),
        
    ('Hotel Renovation', '2024-09-01', 'Miami, FL', 
        'Complete renovation of existing 10-story hotel including all 200 rooms, lobby, restaurants, and conference facilities',
        (SELECT user_id FROM app_user WHERE user_email = 'construction@metro-prop.com'),
        (SELECT user_id FROM app_user WHERE user_email = 'sarah.j@icc.com')),
        
    ('University Science Building', '2024-10-15', 'Chicago, IL', 
        'New 4-story science building with specialized laboratories, lecture halls, and research facilities. 120,000 sq ft',
        (SELECT user_id FROM app_user WHERE user_email = 'development@edu-facilities.org'),
        (SELECT user_id FROM app_user WHERE user_email = 'john.smith@icc.com')),
        
    ('Medical Office Building', '2024-11-01', 'Houston, TX', 
        'Three-story medical office building with ambulatory surgery center. 85,000 sq ft with specialty mechanical systems',
        (SELECT user_id FROM app_user WHERE user_email = 'facilities@healthcare-dev.com'),
        (SELECT user_id FROM app_user WHERE user_email = 'sarah.j@icc.com'));

-- Insert phases for Mixed-Use Development Phase 1
INSERT INTO phase (job_id, phase_title, phase_duration, phase_description, created_by)
VALUES
    (1, 'Site Work & Foundations', 60, 'Site clearing, excavation, utilities, footings and foundation installation', 
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    (1, 'Parking Structure', 90, 'Two-level underground parking structure construction',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    (1, 'Core & Shell', 120, 'Structural steel, concrete decks, exterior walls, and roof installation',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    (1, 'Interior Build-Out', 150, 'MEP rough-in, walls, finishes for retail, office, and residential spaces',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com'));

-- Insert phases for Industrial Park Buildings
INSERT INTO phase (job_id, phase_title, phase_duration, phase_description, created_by)
VALUES
    (2, 'Site Development', 45, 'Grading, utilities, paving, and retention pond construction',
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    (2, 'Building A Tilt-Up', 90, 'Foundation, slab, tilt panels, and roof for first building',
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    (2, 'Building B Tilt-Up', 90, 'Foundation, slab, tilt panels, and roof for second building',
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    (2, 'Building C Tilt-Up', 90, 'Foundation, slab, tilt panels, and roof for third building',
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    (2, 'Interior Build-Out', 60, 'Office space build-out and warehouse improvements',
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com'));

-- Insert phases for Distribution Center
INSERT INTO phase (job_id, phase_title, phase_duration, phase_description, created_by)
VALUES
    (3, 'Site Preparation', 30, 'Site clearing, grading, and pad preparation',
        (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    (3, 'Foundation Work', 45, 'Footings, foundation walls, and slab on grade',
        (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    (3, 'Pre-Engineered Building', 60, 'Steel frame erection and metal panel installation',
        (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    (3, 'Loading Dock Area', 30, 'Dock levelers, equipment, and concrete work',
        (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    (3, 'Office Area Build-Out', 45, 'Office space construction and finishing',
        (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com'));

-- Insert phases for Hotel Renovation
INSERT INTO phase (job_id, phase_title, phase_duration, phase_description, created_by)
VALUES
    (4, 'Demolition', 45, 'Selective demolition of existing finishes and systems',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    (4, 'MEP Rough-In', 60, 'New mechanical, electrical, and plumbing systems installation',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    (4, 'Guest Room Renovation', 120, 'Complete renovation of all guest rooms in phases',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    (4, 'Public Areas', 90, 'Renovation of lobby, restaurants, and conference spaces',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com'));

-- Insert phases for University Science Building
INSERT INTO phase (job_id, phase_title, phase_duration, phase_description, created_by)
VALUES
    (5, 'Foundation Work', 60, 'Deep foundations and grade beams for specialized equipment',
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    (5, 'Structural Frame', 90, 'Steel frame and concrete deck installation',
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    (5, 'Building Envelope', 75, 'Exterior walls, windows, and roofing systems',
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    (5, 'Laboratory Build-Out', 120, 'Specialized lab space construction and equipment installation',
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com'));

-- Insert phases for Medical Office Building
INSERT INTO phase (job_id, phase_title, phase_duration, phase_description, created_by)
VALUES
    (6, 'Site & Foundation', 45, 'Site work, utilities, and foundation construction',
        (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    (6, 'Core & Shell', 90, 'Structural frame, exterior walls, and roof installation',
        (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    (6, 'MEP Systems', 60, 'Medical gas, advanced HVAC, and electrical systems',
        (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    (6, 'Interior Build-Out', 75, 'Medical office and surgery center construction',
        (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    (6, 'Equipment Integration', 30, 'Medical equipment installation and testing',
        (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com'));

-- Tasks for Mixed-Use Development - Site Work & Foundations Phase
INSERT INTO task (phase_id, task_title, task_startdate, task_duration, task_description, task_status, created_by)
VALUES
    (1, 'Site Clearing', '2024-06-01', 10, 'Clear site, remove existing structures and obstructions', 'Complete',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    (1, 'Excavation', '2024-06-11', 15, 'Mass excavation for underground parking levels', 'Complete',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    (1, 'Utility Installation', '2024-06-26', 20, 'Install main utility lines and connections', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    (1, 'Foundation System', '2024-07-16', 15, 'Install footings and foundation walls', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com'));

-- Tasks for Mixed-Use Development - Parking Structure Phase
INSERT INTO task (phase_id, task_title, task_startdate, task_duration, task_description, task_status, created_by)
VALUES
    (2, 'Waterproofing', '2024-07-31', 15, 'Install foundation waterproofing system', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'james.b@icc.com')),
    (2, 'Rebar Installation', '2024-08-15', 25, 'Place reinforcing steel for walls and decks', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'james.b@icc.com')),
    (2, 'Concrete Pours', '2024-09-09', 30, 'Form and pour concrete walls and deck slabs', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'james.b@icc.com')),
    (2, 'MEP Rough-in', '2024-10-09', 20, 'Install mechanical, electrical, plumbing systems', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'james.b@icc.com'));

-- Tasks for Industrial Park - Site Development Phase
INSERT INTO task (phase_id, task_title, task_startdate, task_duration, task_description, task_status, created_by)
VALUES
    (5, 'Earthwork', '2024-07-15', 15, 'Site grading and soil compaction', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'maria.g@icc.com')),
    (5, 'Storm Drainage', '2024-07-30', 12, 'Install storm drainage system and retention pond', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'maria.g@icc.com')),
    (5, 'Utilities', '2024-08-11', 10, 'Install water, sewer, and electrical services', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'maria.g@icc.com')),
    (5, 'Paving', '2024-08-21', 8, 'Asphalt paving for parking and drive areas', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'maria.g@icc.com'));

-- Tasks for Industrial Park - Building A Tilt-Up Phase
INSERT INTO task (phase_id, task_title, task_startdate, task_duration, task_description, task_status, created_by)
VALUES
    (6, 'Foundation Prep', '2024-08-29', 15, 'Form and pour building footings', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'william.t@icc.com')),
    (6, 'Slab Pour', '2024-09-13', 20, 'Form and pour slab with embeds and floor joints', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'william.t@icc.com')),
    (6, 'Panel Formation', '2024-10-03', 25, 'Form and pour tilt-up wall panels', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'william.t@icc.com')),
    (6, 'Panel Erection', '2024-10-28', 15, 'Crane operation to lift and place wall panels', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'william.t@icc.com')),
    (6, 'Roof Structure', '2024-11-12', 15, 'Install steel joists and metal deck roofing', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'william.t@icc.com'));

-- Tasks for Distribution Center - Site Preparation Phase
INSERT INTO task (phase_id, task_title, task_startdate, task_duration, task_description, task_status, created_by)
VALUES
    (11, 'Site Survey', '2024-08-01', 5, 'Establish site control points and building corners', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    (11, 'Clearing', '2024-08-06', 10, 'Clear vegetation and strip topsoil', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    (11, 'Pad Preparation', '2024-08-16', 15, 'Import and compact structural fill for building pad', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com'));

-- Distribution Center - Foundation Work Phase
INSERT INTO task (phase_id, task_title, task_startdate, task_duration, task_description, task_status, created_by)
VALUES
    (12, 'Footing Layout', '2024-08-31', 5, 'Layout and excavate building footings', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'emma.d@icc.com')),
    (12, 'Foundation Walls', '2024-09-05', 20, 'Form and pour foundation walls', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'emma.d@icc.com')),
    (12, 'Under-slab Utilities', '2024-09-25', 10, 'Install under-slab plumbing and electrical', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'emma.d@icc.com')),
    (12, 'Slab on Grade', '2024-10-05', 10, 'Pour main warehouse floor slab', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'emma.d@icc.com'));

-- Tasks for Hotel Renovation - Demolition Phase
INSERT INTO task (phase_id, task_title, task_startdate, task_duration, task_description, task_status, created_by)
VALUES
    (16, 'Asbestos Survey', '2024-09-01', 5, 'Complete asbestos testing and abatement planning', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    (16, 'Floor Protection', '2024-09-06', 3, 'Install protection for floors and existing finishes', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    (16, 'Interior Demolition', '2024-09-09', 25, 'Remove existing finishes, fixtures, and systems', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    (16, 'Structural Verification', '2024-10-04', 12, 'Verify and document structural conditions', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com'));

-- Tasks for Hotel Renovation - MEP Rough-In Phase
INSERT INTO task (phase_id, task_title, task_startdate, task_duration, task_description, task_status, created_by)
VALUES
    (17, 'HVAC Installation', '2024-10-16', 25, 'Install new HVAC ducting and equipment', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'jennifer.l@icc.com')),
    (17, 'Plumbing Rough', '2024-10-16', 20, 'Install new water and waste lines', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'jennifer.l@icc.com')),
    (17, 'Electrical Rough', '2024-10-16', 20, 'Install new electrical conduit and boxes', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'jennifer.l@icc.com'));

-- Tasks for University Science Building - Foundation Work Phase
INSERT INTO task (phase_id, task_title, task_startdate, task_duration, task_description, task_status, created_by)
VALUES
    (21, 'Deep Foundations', '2024-10-15', 20, 'Install auger cast piles for building support', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    (21, 'Grade Beams', '2024-11-04', 25, 'Form and pour grade beams and pile caps', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    (21, 'Elevator Pits', '2024-11-29', 15, 'Construct elevator pits and foundation walls', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com'));

-- Now let's add some construction-specific materials
-- Materials for Mixed-Use Development - Site Work Phase
INSERT INTO material (phase_id, material_title, material_duedate, material_description, material_status, created_by)
VALUES
    (1, 'Erosion Control', '2024-06-01', 'Silt fence, hay bales, and erosion control measures', 'Complete',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    (1, 'Storm Pipe', '2024-06-15', '24" RCP storm drain pipe - 500 LF', 'Complete',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    (1, 'Foundation Rebar', '2024-07-01', '#6 and #8 rebar for foundation - 25 tons', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com'));

-- Materials for Industrial Park - Tilt-Up Phase
INSERT INTO material (phase_id, material_title, material_duedate, material_description, material_status, created_by)
VALUES
    (6, 'Concrete Mix', '2024-09-01', '5000 PSI concrete mix for tilt panels - 1200 CY', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'william.t@icc.com')),
    (6, 'Panel Formwork', '2024-09-15', 'Steel forms for tilt-up panels - 40 sets', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'william.t@icc.com')),
    (6, 'Steel Embeds', '2024-09-20', 'Panel connection plates and inserts', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'william.t@icc.com'));

-- Materials for Distribution Center - Foundation Phase
INSERT INTO material (phase_id, material_title, material_duedate, material_description, material_status, created_by)
VALUES
    (12, 'Structural Fill', '2024-09-01', 'Crushed aggregate base - 5000 tons', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'emma.d@icc.com')),
    (12, 'Vapor Barrier', '2024-09-15', '15 mil vapor barrier - 200,000 SF', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'emma.d@icc.com')),
    (12, 'Floor Hardener', '2024-09-20', 'Concrete floor hardener - 180,000 SF coverage', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'emma.d@icc.com'));

-- Construction-specific notes for various phases
INSERT INTO note (phase_id, note_details, created_by)
VALUES
    (1, 'Encountered unforeseen rock during excavation - may need additional equipment', 
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    (6, 'Concrete mix design approved by structural engineer - maintain 28-day strength logs',
        (SELECT user_id FROM app_user WHERE user_email = 'william.t@icc.com')),
    (12, 'Soils engineer requires additional compaction testing for building pad',
        (SELECT user_id FROM app_user WHERE user_email = 'emma.d@icc.com')),
    (16, 'Discovered existing structural steel requires fireproofing update',
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    (21, 'Deep foundation test pile program completed - results meet specifications',
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com'));

-- Assign users to construction tasks
INSERT INTO user_task (user_id, task_id, assigned_by)
VALUES
    ((SELECT user_id FROM app_user WHERE user_email = 'james.b@icc.com'), 1,
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    ((SELECT user_id FROM app_user WHERE user_email = 'maria.g@icc.com'), 2,
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    ((SELECT user_id FROM app_user WHERE user_email = 'william.t@icc.com'), 3,
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    ((SELECT user_id FROM app_user WHERE user_email = 'emma.d@icc.com'), 4,
        (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com'));

-- Assign users to materials management
INSERT INTO user_material (user_id, material_id, assigned_by)
VALUES
    ((SELECT user_id FROM app_user WHERE user_email = 'james.b@icc.com'), 1,
        (SELECT user_id FROM app_user WHERE user_email = 'michael.c@icc.com')),
    ((SELECT user_id FROM app_user WHERE user_email = 'william.t@icc.com'), 2,
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    ((SELECT user_id FROM app_user WHERE user_email = 'emma.d@icc.com'), 3,
        (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com'));

-- Tasks for University Science Building - Structural Frame Phase
INSERT INTO task (phase_id, task_title, task_startdate, task_duration, task_description, task_status, created_by)
VALUES
    ((SELECT phase_id FROM phase WHERE job_id = 5 AND phase_title = 'Structural Frame'), 
     'Steel Erection', '2024-12-14', 30, 'Erect structural steel frame and connections', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    ((SELECT phase_id FROM phase WHERE job_id = 5 AND phase_title = 'Structural Frame'), 
     'Deck Installation', '2025-01-13', 20, 'Install metal deck and concrete floor systems', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com'));

-- Tasks for Medical Office Building - MEP Systems Phase
INSERT INTO task (phase_id, task_title, task_startdate, task_duration, task_description, task_status, created_by)
VALUES
    ((SELECT phase_id FROM phase WHERE job_id = 6 AND phase_title = 'MEP Systems'),
     'Medical Gas System', '2025-01-15', 20, 'Install medical gas piping and outlets', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'sofia.p@icc.com')),
    ((SELECT phase_id FROM phase WHERE job_id = 6 AND phase_title = 'MEP Systems'),
     'HVAC Installation', '2025-02-04', 25, 'Install specialized HVAC for surgery center', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'sofia.p@icc.com'));

-- Materials for University Science Building - Laboratory Phase
INSERT INTO material (phase_id, material_title, material_duedate, material_description, material_status, created_by)
VALUES
    ((SELECT phase_id FROM phase WHERE job_id = 5 AND phase_title = 'Laboratory Build-Out'),
     'Lab Casework', '2025-01-15', 'Laboratory grade cabinets and countertops - 200 LF', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com')),
    ((SELECT phase_id FROM phase WHERE job_id = 5 AND phase_title = 'Laboratory Build-Out'),
     'Fume Hoods', '2025-02-01', 'Chemical fume hoods with ductwork - 12 units', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'lisa.r@icc.com'));

-- Materials for Medical Office Building - MEP Systems
INSERT INTO material (phase_id, material_title, material_duedate, material_description, material_status, created_by)
VALUES
    ((SELECT phase_id FROM phase WHERE job_id = 6 AND phase_title = 'MEP Systems'),
     'Medical Gas', '2025-01-10', 'Medical gas piping and outlets for surgery center', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com')),
    ((SELECT phase_id FROM phase WHERE job_id = 6 AND phase_title = 'MEP Systems'),
     'HVAC Equipment', '2025-01-20', 'Specialized HVAC units with HEPA filtration', 'Incomplete',
        (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com'));

-- Additional critical user assignments
INSERT INTO user_task (user_id, task_id, assigned_by)
VALUES
    ((SELECT user_id FROM app_user WHERE user_email = 'sofia.p@icc.com'), 
     (SELECT task_id FROM task WHERE task_title = 'Medical Gas System'),
     (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com'));

INSERT INTO user_material (user_id, material_id, assigned_by)
VALUES
    ((SELECT user_id FROM app_user WHERE user_email = 'sofia.p@icc.com'),
     (SELECT material_id FROM material WHERE material_title = 'Medical Gas'),
     (SELECT user_id FROM app_user WHERE user_email = 'david.w@icc.com'));