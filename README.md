# Task Manager CLI Application 
## Overview 
A simple task manager application written in Ruby that allows for tracking of tasks and projects. This project is structured so that it serves as the skeleton for creating more elaborate task manager. 

## Current Features 
1. Ability to create different user accounts 
  * User's can have `first_name`, `last_name`, `phone`, and `email` attributes 
2. Ability to create tasks  
  * Tasks (optionally) belong to user's and project's 
    * User can have many tasks 
    * Project can have many tasks 
  * Tasks have attributes including: 
    * A name (required)
    * A description (optional)
    * A due date (optional)
    * An assigned user (optional)
    * An assinged project (optional)
3. Ability to create projects 
  * Projects just have a name. This serves to group related tasks. 
4. Viewing data: 
  1. Tasks can be viewed as `all` 
  2. Tasks can be viewed as a filtered list by Project 
  3. Tasks can be viewed as a filtered list by the assigned user. 
5. Users can be deleted 
  * Note: When users are deleted, any associated tasks are deleted. 
6. Tasks can be deleted 
7. Projects can be deleted 
  * Note: When projects are deleted, any associated tasks are deleted. 

## Setup Instructions 

### Standard Setup 
1. clone the repository 
2. In Terminal, navigate to the cloned repository's directory 
3. In Terminal, run the command `bundle install` 
4. In a code editor, open the `db/seeds.rb` file, and delete any data you do not want added to the database. 
5. In Terminal, run the command `rake db:migrate`. This will create the database based on the migration instructions. 
6. In Terminal, run the command `rake db:seed`. This will create the sample database records
7. In Terminal, run the command `ruby runner.rb` to start the application


## Authors 
Jason Nordheim & Jeremy Hart 

## Project Requirements 
### Technologies Used 
* Ruby
  * Enumerable methods 
  * Gems: (All installed using `bundle`)
    * `sinatra-activerecord`
    * `activerecord`
    * `rake` 
    * `sqlite3` 
    * `require_all` 
    * `tty-prompt` 
    * `pry`
* Object Orientation
* Relationships (via ActiveRecord)
  * many-to-many 
  * belongs to
* Problem Solving (via creating a Command Line Interface (CLI))
  * Invalid entry handling 
  * Data validation 
  * Type conversion 

### Minumum Requirements 
1. Contains at least three (3) models with corresponding tables, including a join table.
2. Accesses a `Sqlite3` database using ActiveRecord.
3. Has a CLI that allows users to interact with your database as defined by your user stories (minimum of four; one for each CRUD action).
4. Uses good OO design patterns. You should have separate models for your runner and CLI interface.


## License 
This code is considered public domain. You are free to copy it, but you may not monetize it. Attribution is always appreciated. 

