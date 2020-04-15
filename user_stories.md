# User Stories 

## A1 - Main Menu (main loop)
This is the root loop for the application. 
## Steps 
1. Display options as follows: 
  ```
  Please select an option (1-3): 
  [1] Create new user 
  [2] Create new task 
  [3] Create new project  
  [4] View all tasks 
  [5] View tasks by Project
  [6] View list of users 

  ** At any time you can type: "exit" to exit the application or "back" to go back to the previous menu ** 
  ```
2. Uses `gets.chomp` to read in user-input and parse to integer. 
3. Via switch statement, evaluates if 1) should prompt to create new user, 2) should prompt to create new task, 3) prompt to create new project. 
4. See appropriate user story: 
  * `[1] Create new user` - [A2]
  * `[2] Create new task` - [A3]
  * `[3] Create new project`  

## A2 - Prompt User Creation 
### Steps 
1. Display prompt in CLI as follows: `Please enter a first name:`
2. Uses `gets.chomp` to read text from CLI. 
  * Validates: 
    * Is longer than 3 characters 
    * Does not contain spaces 
3. Displays prompt for last name: `Please enter last name:` 
4. Uses `gets.chomp` to read text from CLI. 
  * Validates: 
    * Is longer than 3 characters 
    * Does not contain spaces 
5. Displays prompt in CLI for user email: `Please enter an email for #{first_name} #{last_name} (optional):` 
  * If nothing is entered, that's ok - proceed to next prompt 
  * If text is entered, validates that: 
    * Email string is longer (`str.length`) than 5 characters 
    * Email string contains `@` character 
    * Email string contains `.` character
6. User object is created, record is saved to database. 
### Pre-requisites:
1. That user selected `[1] Create new user` or (`1`) in the main-menu (See story `A2`)




## A3 - Prompt Task Creation 
CLI prompt to input a new task 
### Steps 
1. Prompts User to Enter Task: `Please enter task name: ` 
2. Uses `gets.chomp` to retrieve string placed by user 
  * Validates: 
    * Name does not already exist in `Tasks` table 
3. Prompts User to enter task due date: `Please enter when this task is due [MM-DD-YYYY]:` 
  * Validates
    * Day - That characters with indicies (0...2) create valid integer, and is an integer has a value betweeen 1 and 12 (inclusive)
    * Month - That characters with indicies (3,5) create a valid integer, and is an integer that has values between 1 and 31 (inclusive)
    * Year - That characters with indicies (6,9) create a valid integer, and is an integer `<=` 2020 (must be a date from current date forward)
    * That the `Day`, `Month` and `Year` creates a valid date object  
4. Prompts user to see if they would like to add a `description` to the task: `Would you like to add a description (Y/N):` 
5. Uses `gets.chomp` to read user-input. 
  * Validates 
    * that the user-input is a single-character 
    * that the character input by the user is `Y` (yes) or `N` (no), ignoring case. 
5. If user selected `Y` (yes), displays prompt: `Please enter description for task (#{task_name}) (hit "Return" when finished):` 
  * No validation will be performed on the description. 
6. Prompts the user to determine if new Task should be added to a project: `Would you like to add #{task_name} to a project (Y/N):` 
7. Users `gets.chomp` to read in user-input. 
  * Validates 
    * that the user-input is a single-character 
    * that the character input by the user is `Y` (yes) or `N` (no), ignoring case. 
8. If User selects `Y` - Display Projects (See Story: `Display Projects`), otherwise, 
### Pre-requisites:
1. That user selected `[2] Create new task` or (`2`) in the main-menu (See story `A2`)






## B1 - Display Projects 
User story for displaying projects via the CLI. 
### Steps
1. Grabs all the Projects from the Database using `Projects.all` 
2. Maps the proejcts name and number of tasks to a string in the following format: `"[#{index}] #{project_name}: #{tasks.count}"`
3. Loops through the returned string array, writing the name of each project to the console. 
4. Displays prompt: `"Enter number (e.g. '1') or project name to see more details about the project:"`
5. Uses `gets.chomp` to read user input: 
  * Validates:
    * that the entered string can either: 
      1. Be parsed into a number, and is a number between 1 and `Projects.all.count` 
      2. Matches (case-insensitive) one of the project names displayed


### Prerequisites 

### Prerequisites
1. From main-menu, user selected option `[2] Create new task` (Option 2): 
### Required Modules
1. `require 'date'` 


## A3 Prompt Project Creation 





















## Task Creation 
How tasks are created: 
### Task Creation - A 
1. User creates `Task`, by default, goes into default project `uncategorized` 
#### Steps 
1. User enters `email`, database checks to see if it exists
2. If `email` is confirmed, `user` is pulled; else, engage the creation prompt
#### Prerequisites 

### Task Creation - B 
1. User creates a `Task` and assigns to project `CoolBeans` 
#### Steps 
1. User creates `Task`, and adds task to project 
#### Pre-requisites 
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