USE icc;
GO

-- View all users with their roles
SELECT user_id, user_type, user_name, user_phone, user_email, created_at, updated_at
FROM app_user
ORDER BY user_type, user_name;

-- View all jobs with client and creator information
SELECT j.job_id, j.job_title, j.job_startdate, j.job_location, 
       c.user_name as client_name, o.user_name as created_by_name,
       j.job_description, j.created_at, j.updated_at
FROM job j
JOIN app_user c ON j.client_id = c.user_id
JOIN app_user o ON j.created_by = o.user_id
ORDER BY j.job_startdate;

-- View all phases with job and creator information
SELECT p.phase_id, j.job_title, p.phase_title, p.phase_duration,
       p.phase_description, u.user_name as created_by_name,
       p.created_at, p.updated_at
FROM phase p
JOIN job j ON p.job_id = j.job_id
JOIN app_user u ON p.created_by = u.user_id
ORDER BY j.job_title, p.phase_title;

-- View all tasks with phase and creator information
SELECT t.task_id, j.job_title, p.phase_title, t.task_title,
       t.task_startdate, t.task_duration, t.task_description,
       t.task_status, u.user_name as created_by_name,
       t.created_at, t.updated_at
FROM task t
JOIN phase p ON t.phase_id = p.phase_id
JOIN job j ON p.job_id = j.job_id
JOIN app_user u ON t.created_by = u.user_id
ORDER BY j.job_title, p.phase_title, t.task_startdate;

-- View all materials with phase and creator information
SELECT m.material_id, j.job_title, p.phase_title, m.material_title,
       m.material_duedate, m.material_description, m.material_status,
       u.user_name as created_by_name,
       m.created_at, m.updated_at
FROM material m
JOIN phase p ON m.phase_id = p.phase_id
JOIN job j ON p.job_id = j.job_id
JOIN app_user u ON m.created_by = u.user_id
ORDER BY j.job_title, p.phase_title, m.material_duedate;

-- View all notes with phase and creator information
SELECT n.note_id, j.job_title, p.phase_title,
       n.note_details, u.user_name as created_by_name,
       n.created_at, n.updated_at
FROM note n
JOIN phase p ON n.phase_id = p.phase_id
JOIN job j ON p.job_id = j.job_id
JOIN app_user u ON n.created_by = u.user_id
ORDER BY j.job_title, p.phase_title, n.created_at;

-- View task assignments
SELECT j.job_title, p.phase_title, t.task_title,
       u.user_name as assigned_to,
       a.user_name as assigned_by,
       ut.created_at as assignment_date
FROM user_task ut
JOIN app_user u ON ut.user_id = u.user_id
JOIN app_user a ON ut.assigned_by = a.user_id
JOIN task t ON ut.task_id = t.task_id
JOIN phase p ON t.phase_id = p.phase_id
JOIN job j ON p.job_id = j.job_id
ORDER BY j.job_title, p.phase_title, t.task_title;

-- View material assignments
SELECT j.job_title, p.phase_title, m.material_title,
       u.user_name as assigned_to,
       a.user_name as assigned_by,
       um.created_at as assignment_date
FROM user_material um
JOIN app_user u ON um.user_id = u.user_id
JOIN app_user a ON um.assigned_by = a.user_id
JOIN material m ON um.material_id = m.material_id
JOIN phase p ON m.phase_id = p.phase_id
JOIN job j ON p.job_id = j.job_id
ORDER BY j.job_title, p.phase_title, m.material_title;

-- Summary counts
SELECT 
    (SELECT COUNT(*) FROM app_user) as total_users,
    (SELECT COUNT(*) FROM job) as total_jobs,
    (SELECT COUNT(*) FROM phase) as total_phases,
    (SELECT COUNT(*) FROM task) as total_tasks,
    (SELECT COUNT(*) FROM material) as total_materials,
    (SELECT COUNT(*) FROM note) as total_notes,
    (SELECT COUNT(*) FROM user_task) as total_task_assignments,
    (SELECT COUNT(*) FROM user_material) as total_material_assignments;