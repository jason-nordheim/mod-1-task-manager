# Default Setup 
This section describes how the application will function at launch without any configuration from the end-user. 

## Projects
### What will exist at initial launch 
* General: `unassigned` project - recieves tasks that have not been delegated to a specific project 
### Required Parameters for Initialization 
* `title` - (string) The title that will serve as the descriptor for the the project 
### Optional Parameters 
* `due_date` - (date) A end-date for when the project must be completed. 
* `tasks` - (array<Tasks>) - any tasks that should be associated with the project 


## Users 
### What will exist at initial launch 
* General: `unassigned` user - recieves tasks that have not been delegated to a specific user. 
### Required Parameters for Initialization 
* `first_name` - the first name of the end-user 
* `last_name` - the family/last name of the end-user 
### Optional Parameters for Intialization 
* `email` - the email address of the end-user 
* `phone` - the phone number of the end-user 
### Methods 

## Tasks 
### What will exist at initial launch 
No tasks will exist at initial launch 

### Required Parameters for Initialization 
* `name` - (string) the verbose name of the deliverable. 
* `assignee` - (array<User>) the user to which the task belows. The array must contain at least one `User` object 
 
### Optional Parameters for Intialization 
* `due_date` - (date/time) - the date/time that the task must be completed by 

### Methods 
#### Instance Methods 
* `.add_assignee(user)` - Adds a user to the assignee list for the task 
#### Class Methods 
* `self.get_tasks_by_user(user)` - (class method) selects the tasks assigned to the user provided. If no user match is found, returns `nil` 