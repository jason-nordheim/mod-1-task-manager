

# User Stories 

## User creation 
1. User enters `first_name`(string), `last_name`(string), `phone`(string), `email` (string)
2. User is saved to database. 

## User Verification
1. User enters `email`, database checks to see if it exists
2. If `email` is confirmed, `user` is pulled; else, engage the creation prompt

## Task Creation - A 
1. User creates `Task`, by default, goes into default project `uncategorized` 

## Task Creation - B 

### Steps 
1. User creates `Task`, and adds task to project 

### Pre-requisites 
1. The tasks that the project is being added to must already exist 

## Project default tasks
1. During `Task` creation, option to make task `default` (used on all created `Projects`)

## User tasks
1. `Task` on creation have status `Not Started`
2. `Task` when assigned to `User` will have status `In Progress`
3. User will confirm task completion, giving status `Task Complete`


## Project creation

1. User creates `Project`(`name`), and saves it to database

2. User chooses to add `tasks` or use defaults for `Project`

## Project tasks

### Method 1: No tasks added

1. User pulls tasks from table, individually adding them to the project

### Method 2: 

1. While creating the project, select tasks as `default` (adds default tasks to project)

## Project completion
1. When all `Tasks` have status `Task Complete`, the User who created `Project` will confirm completion
2. If completed, `Project` will be removed; else, User will determine which task is incomplete, and reset it to `In Progress`