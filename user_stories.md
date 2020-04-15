# User Stories 

## Main Menu (main loop)
This is the root loop for the application. 
## Steps 
1. Display options as follows: 
  ```
  Please select an option (1-3): 
  [1] Create new user 
  [2] Create new task 
  [3] Create new project  
  ```
2. Uses `gets.chomp` to read in user-input and parse to integer. 
3. Via switch statement, evaluates if 1) should prompt to create new user, 2) should prompt to create new task, 3) prompt to create new project. 
4. See appropriate user story (1-3)


## Prompt User Creation 
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
### Pre-requisites:
1. That user selected "User Creation" or (1) in the main-menu 


## Prompt Task Creation 
## Prompt Project Creation 



## User creation 
The process for adding a new user. 
### Steps 
1. User enters `first_name`(string), `last_name`(string), `phone`(string), `email` (string)
2. User is saved to database
### Prerequisites 
None 



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