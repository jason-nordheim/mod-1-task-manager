# User Stories 


## A1 - Main Menu (main loop)
This is the root loop for the application. 
### Steps 
1. Display options as follows: 
  ```
  Please select an option (1-3): 
  [1] Create new user 
  [2] Create new task 
  [3] Create new project  
  [4] View all tasks 
  [5] View tasks by project
  [6] View list of users 
  [7] View a list of projects 
  [8] View tasks by user
  [9] Remove a user
  [10] Remove a task
  [11] Remove a project
  ** At any time you can type: "exit" to exit the application or "back" to go back to the previous menu ** 
  ```
2. Via switch statement, evaluates if 
  1. should prompt to create new user 
  2. should prompt to create new task
  3. prompt to create new project. 
3. See appropriate user story: 
  * `[1] Create new user` - [A2] 
  * `[2] Create new task` - [A3] 
  * `[3] Create new project` - [A4] 
  * `[4] View all tasks` - [B2] 
  * `[5] View all projects` - [B1] 
  * `[6] View all users` - [B3] 
  * `[7] View tasks by project` - [C1] 
  * `[8] View tasks by user` - [C2] 
  * `[9] Remove a user` - [D1]
  * `[10] Remove a task` - [D2]
  * `[11] Remove a project` - [D3]

## A2 - Prompt User Creation (new)
### Steps 
1. Display prompt in CLI as follows: `Please enter a first name:`
  * Validates:
    * Is longer than 3 characters 
    * Does not contain spaces 
2. Displays prompt for last name: `Please enter last name:` 
  * Validates: 
    * Is longer than 3 characters 
    * Does not contain spaces 
3. Displays prompt in CLI for user email: `Please enter an email for #{first_name} #{last_name} (optional):` 
  * If nothing is entered, that's ok - proceed to next prompt 
  * If text is entered, validates that: 
    * Email string is longer (`str.length`) than 5 characters 
    * Email string contains `@` character 
    * Email string contains `.` character
4. User object is created, record is saved to database. 
### Pre-requisites:
1. That user selected `[1] Create new user` or (`1`) in the main-menu (See story `A2`)




## A3 - Prompt Task Creation (new)
CLI prompt to input a new task 
### Steps 
1. Prompts User to Enter Task: `Please enter task name: ` 
  * Validates: 
    * Name does not already exist in `Tasks` table 
2. Prompts User to enter task due date: `Please enter when this task is due [MM-DD-YYYY]:` 
  * Validates
    * Day - That characters with indicies (0...2) create valid integer, and is an integer has a value betweeen 1 and 12 (inclusive)
    * Month - That characters with indicies (3,5) create a valid integer, and is an integer that has values between 1 and 31 (inclusive)
    * Year - That characters with indicies (6,9) create a valid integer, and is an integer `<=` 2020 (must be a date from current date forward)
    * That the `Day`, `Month` and `Year` creates a valid date object  
3. Prompts user to see if they would like to add a `description` to the task: `Would you like to add a description (Y/N):` 
  * Validates 
    * that the user-input is a single-character 
    * that the character input by the user is `Y` (yes) or `N` (no), ignoring case. 
4. If user selected `Y` (yes), displays prompt: `Please enter description for task (#{task_name}) (hit "Return" when finished):` 
  * No validation will be performed on the description. 
5. Prompts the user to determine if new Task should be added to a project: `Would you like to add #{task_name} to a project (Y/N):`  
  * Validates 
    * that the user-input is a single-character 
    * that the character input by the user is `Y` (yes) or `N` (no), ignoring case. 
6. If User selects `Y` - Display Projects (See Story: `Display Projects`), otherwise, 
### Pre-requisites:
1. That user selected `[2] Create new task` or (`2`) in the main-menu (See story `A3`)




## A4 - Prompt Project Creation (new)
CLI prompt for creating a new project. 
### Steps 
1. Prompts user to enter new project: `Please give the project a title: `
  * Validates 
    * Project name does not exist in table `Project`; if exists; displays `"Project name taken, please enter a different project name"`, and returns to begining of `A4` prompt. 
2. New `Project` object and saved to the database. 
### Pre-Requisites 
1. That user selected `[3] Create new project` or (`3`) in the main-menu (See story `A4`)



## B1 - View All Projects 
User story for displaying projects via the CLI. 
### Steps
1. Grabs all the Projects from the Database using `Projects.all` 
2. If no projects are found, displays `No projects exist`
3. If projects exist, maps the proejcts name and number of tasks to a string in the following format: `"[#{index}] #{project_name}: #{tasks.count}"`
4. Loops through the returned string array, writing the name of each project to the console. 
5. Displays prompt: `"Enter number (e.g. '1') or project name to see more details about the project:"`
  * Validates:
    * that the entered string can either: 
      1. Be parsed into a number, and is a number between 1 and `Projects.all.count` 
      2. Matches (case-insensitive) one of the project names displayed
### Prerequisites 
1. Pull list of projects from the `Projects` table
2. Prompts user to select a project to add the task to it.
* Validates
  * Input must be a valid name from the table
3. Adds task to selected `Project` object

### Prerequisites
1. From main-menu, user selected option `[2] Create new task` (Option 2): 
### Required Modules
1. `require 'date'` 



## B2 - View All Tasks  
User story for displaying **all** tasks via the CLI. 
### Steps
1. Grabs all the Tasks from the Database using `Task.all` 
2. If no tasks are found, displays `No tasks exist`
3. If tasks exist, maps the task name and assignee of tasks to a string in the following format: `"[#{index}] #{task_name}: #{task.assignee}"`
4. Loops through the returned string array, writing the name of each project to the console. 
5. Displays prompt: `"Enter number (e.g. '1') or task name to see more details about the task:"` 
  * Validates:
    * that the entered string can either: 
      1. Be parsed into a number, and is a number between 1 and `Projects.all.count` 
      2. Matches (case-insensitive) one of the project names displayed
### Prerequisites 
1. User selected `[4] View all tasks` in main-menu (option: `4`)



## B3 View all Users
User story for displaying **all** users via the CLI. 
### Steps
1. Grabs all the Tasks from the Database using `User.all` 
2. If only 1 user is found, displays `No users exist`
3. If `>1` tasks exist, maps the task name and assignee of tasks to a string in the following format: `"[#{index}] #{user_full_name}"`. 
4. Loops through the returned string array, writing the name of each project to the console. 
5. Displays prompt: `"Enter number (e.g. '1') to see more details about the user:"`
  * Validates:
    1. Be parsed into a number, and is a number between 1 and `Task.all.count` 
### Prerequisites 
1. User selected `[6] View all users` in main-menu (option: `6`)


## C1 - View Tasks by Project 
User story for dislpaying a task information 

### Steps
1. Prompts user to select a `Project`
2. Displays all `Tasks` related to `Project`

### Prerequisites 
1. User selected `[7] View Tasks by Project` in main menu


## C2 - View Tasks by User 
User story for displaying all the tasks belonging to a specified user. 

### Steps
1. Prompts user to give `first_name` and `last_name`
2. If `first_name` and `last_name` match `User` first and last names, display tasks associated with `User`

### Prerequisites 
1. User selected `[8] View Tasks by User` in main manu


## D1 - Remove User
User story for removing a user

### Steps
1. Prompts user to select a user to delete (`name`)
2. Deletes chosen user

### Prerequisites 
1. User selected `[9] Remove a user` in main menu

## D2 - Remove Task
User story for removing a task

### Steps
1. Prompts user to select a task to delete (`Title`)
2. Deletes selected task

### Prerequisites 
1. User seleced `[10] Remove a task` in main menu

## D3 - Remove Project
User story for removing a project

### Steps
1. Prompts user to select a project to delete (`Title`)
2. Deletes selected project

### Prerequisites 
1. User selected `[11] Remove a project` in main menu