# ICC Construction Project Management Database

## Overview
A comprehensive MySQL database system designed for managing construction projects, tracking tasks, materials, and team assignments. The system supports multiple construction projects with detailed phase tracking, task management, and material procurement workflows.

## Database Schema

### Core Tables
- `app_user`: User management with role-based access (Owner, Admin, User, Client)
- `job`: Construction project details including location and client information
- `phase`: Project phases with duration and descriptions
- `task`: Individual tasks with start dates, durations, and status tracking
- `material`: Construction materials with due dates and status tracking
- `note`: Project-related notes and documentation
- `user_task`: Task assignments linking users to specific tasks
- `user_material`: Material assignments linking users to material management

### Key Features
- Role-based user management system
- Hierarchical project organization (Job → Phase → Task/Material)
- Detailed tracking of construction tasks and materials
- Assignment management for both tasks and materials
- Comprehensive timestamp tracking for all records
- Status tracking for tasks and materials
- Project phase management with duration tracking
- Note-taking system for project documentation

## Technical Details

### User Types
- Owner: Company principals
- Admin: Project managers and superintendents
- User: Field staff and specialists
- Client: Property developers and owners

### Status Tracking
- Tasks: Incomplete/Complete
- Materials: Incomplete/Complete

### Timestamps
- All tables include `created_at` timestamps
- Most tables include `updated_at` timestamps that auto-update

## Database Views

### Available Views
- Detailed user role listings
- Comprehensive job information with client details
- Phase listings with associated job information
- Task listings with phase and creator details
- Material listings with phase and creator information
- Note listings with phase and creator details
- Task assignment details
- Material assignment details
- Summary statistics for database entities

## Installation

1. Create the database:
   ```sql
   CREATE DATABASE IF NOT EXISTS icc;
   ```
2. Run the scripts in the following order:
create.sql (Creates database schema)
insert.sql (Populates with initial data)
view.sql (Creates basic views)