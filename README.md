# mod-1-task-manager
A simple task manager application written in Ruby 


```rb
class Project 
  def initialize tasks=[] 
    @tasks = tasks 
  end 
end 


class Task
  def initialize title=nil, description=nil, due_date
    @title=title 
    @description = description
    @due_date = due_date 
  end
end


class User
  def initialize first_name, last_name, email=nil, phone=nil
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone = phone 
  end
end


# Relationships 

# User (0+) Tasks (1=>many) - A user will have 0 or more tasks 
# Task (1+) Users (1=>many) - A task will be assigned to at least 1 user 
# Project (1+) Tasks (1=>many) - A project will contain at least 1 task 
# Project (1+) Users (1=>many) - A project will have at least one user involved (assigned via tasks)

# many-to-many 
``` 
