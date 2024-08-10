# Project Management Database Structure

This document provides an overview of the database structure for a project management system. The database is designed to track jobs, their phases, associated tasks and materials, as well as user assignments and notes.

## Tables and Relationships

### Job Table
- Primary Key: `job_id`
- Stores information about individual jobs/projects
- Fields include job title, client details, start date, location, and description

### Phase Table
- Primary Key: `phase_id`
- Foreign Key: `job_id` (references Job table)
- Represents different phases of a job
- Each job can have multiple phases

### Task Table
- Primary Key: `task_id`
- Foreign Key: `phase_id` (references Phase table)
- Contains details about specific tasks within a phase
- Includes task title, start date, duration, details, and status

### Material Table
- Primary Key: `mat_id`
- Foreign Key: `phase_id` (references Phase table)
- Tracks materials or resources associated with a phase
- Includes material title, start date, duration, details, and status

### Note Table
- Primary Key: `note_id`
- Foreign Key: `phase_id` (references Phase table)
- Stores additional notes or comments related to a phase

### User Table
- Primary Key: `user_id`
- Contains information about users in the system
- Includes user name, phone, and email

### User_Task Table
- Composite Primary Key: `user_id`, `task_id`
- Foreign Keys: 
  - `user_id` (references User table)
  - `task_id` (references Task table)
- Represents the assignment of users to specific tasks

### User_Material Table
- Composite Primary Key: `user_id`, `mat_id`
- Foreign Keys:
  - `user_id` (references User table)
  - `mat_id` (references Material table)
- Represents the assignment of users to specific materials

## Relationships

1. A Job can have multiple Phases (one-to-many)
2. A Phase can have multiple Tasks (one-to-many)
3. A Phase can have multiple Materials (one-to-many)
4. A Phase can have multiple Notes (one-to-many)
5. Users can be assigned to multiple Tasks, and Tasks can be assigned to multiple Users (many-to-many, through User_Task table)
6. Users can be assigned to multiple Materials, and Materials can be assigned to multiple Users (many-to-many, through User_Material table)

This structure allows for flexible project management, tracking various aspects of jobs, their phases, and associated tasks and materials, while also managing user assignments and additional notes.
