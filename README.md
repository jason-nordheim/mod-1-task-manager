# Flatiron School - Module 1 - Task Manager Application 
A simple task manager application written in Ruby 


## Authors 
Jason Nordheim & Jeremy Hart 

## Requirements 
### Utilizes 
* Ruby
* Object Orientation
* Relationships (via ActiveRecord)
* Problem Solving (via creating a Command Line Interface (CLI))

### Minumum Requirements 
1. Contains at least three (3) models with corresponding tables, including a join table.
2. Accesses a `Sqlite3` database using ActiveRecord.
3. Has a CLI that allows users to interact with your database as defined by your user stories (minimum of four; one for each CRUD action).
4. Uses good OO design patterns. You should have separate models for your runner and CLI interface.


# Brainstorming 

## The Project Class 
Class representing a Project, or a large deliverable comprised of a collection of related tasks. 

### Properties 
### Methods 
```rb
class Project 
  def initialize tasks=[] 
    @tasks = tasks 
  end 
end 
```

## The `task` Class 

### Properties 
### Methods 
```rb 
class Task
  def initialize title=nil, description=nil, due_date
    @title=title 
    @description = description
    @due_date = due_date 
  end
end
```
## The `User` Class 

### Properties 
### Methods 

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


# Relationships 
* User (0+) Tasks (1=>many) - A user will have 0 or more tasks 
* Task (1+) Users (1=>many) - A task will be assigned to at least 1 user 
* Project (1+) Tasks (1=>many) - A project will contain at least 1 task 
* Project (1+) Users (1=>many) - A project will have at least one user involved (assigned via tasks)

