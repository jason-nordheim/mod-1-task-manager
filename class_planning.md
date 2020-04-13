# Default Setup 
This section describes how the application will function at launch without any configuration from the end-user. 


# Brainstorming 

## The Project Class 
Class representing a Project, or a large deliverable comprised of a collection of related tasks. 
```rb
class Project 
  def initialize tasks=[] 
    @tasks = tasks 
  end 
end 
```
### Properties 
### What will exist at initial launch 
* General: `unassigned` project - recieves tasks that have not been delegated to a specific project 
### Required Parameters for Initialization 
* `title` - (string) The title that will serve as the descriptor for the the project 
### Optional Parameters 
* `due_date` - (date) A end-date for when the project must be completed. 
* `tasks` - (array<Tasks>) - any tasks that should be associated with the project 
### Properties 
### Methods 

## The `task` Class 
```rb 
class Task
  # read-only properites 
  attr_reader 
  # read/write properties 
  attr_accessor :title 
  def initialize title, due_date, assignee = nill, description=nil, status=nil, notes=nil
    @title=title 
    @description = description
    @due_date = due_date 
    @status = :no_started if status == nil else @status = status 
    @notes = notes 
    @create_date = nil #todo: datetime.now 
  end

end
```
### Properties 
* `status` - the status of the task (`:not_started`, `:in_progress`, `:complete`)
* `title` - the verbose name of the task 
* `assignee` - a list/array of users assigned to the task 
* `notes` - string field containing optional notes/details regarding the task. 

### What will exist at initial launch 
No tasks will exist at initial launch. By default, tasks will be created with the status of `not_started`

### Required Parameters for Initialization 
* `name` - (string) the verbose name of the deliverable. 
* `assignee` - (array<User>) the user to which the task belows. The array must contain at least one `User` object 
 
### Optional Parameters for Intialization 
* `due_date` - (date/time) - the date/time that the task must be completed by 

### Methods 
#### Instance Methods 
* `.add_assignee(user)` - Adds a user to the assignee list for the task 
* `.mark_complete()` - marks a tasks as complete 
* `.mark_in_progress()` - marks a tasks as started 

#### Class Methods 
* `self.get_tasks_by_user(user)` - (class method) selects the tasks assigned to the user provided. If no user match is found, returns `nil`



## The `User` Class 
```rb 
class User
  def initialize first_name, last_name, email=nil, phone=nil
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone = phone 
  end
end
```
### Properties 
* 
### What will exist at initial launch 
* General: `unassigned` user - recieves tasks that have not been delegated to a specific user. 
### Required Parameters for Initialization 
* `first_name` - the first name of the end-user 
* `last_name` - the family/last name of the end-user 
### Optional Parameters for Intialization 
* `email` - the email address of the end-user 
* `phone` - the phone number of the end-user 
### Methods 
* `.add_task(task_name, due_date=nil)` adds a tasks for the user instance on which the method was called. 
### Properties 
### Methods 




# Relationships 
* User (0+) Tasks (1=>many) - A user will have 0 or more tasks 
* Task (1+) Users (1=>many) - A task will be assigned to at least 1 user 
* Project (1+) Tasks (1=>many) - A project will contain at least 1 task 
* Project (1+) Users (1=>many) - A project will have at least one user involved (assigned via tasks)



## Projects



## Users 
 

## Tasks 
 