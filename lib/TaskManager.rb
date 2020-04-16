require 'tty-prompt'

class TaskManager 
  MAIN_MENU_CHOICES = ["Create new user", 
    "Create new task", 
    "Create new project", 
    "View all tasks", 
    "View tasks by project",
    "View list of users",
    "View a list of projects", 
    "View tasks by user"] 
    
  def initialize
  end

  def start
    display_main_menu 
  end 

  def display_main_menu 
    prompt = TTY::Prmpt.new 
    response = prompt.select("Please select an option (1-8): ", MAIN_MENU_CHOICES) 

  end
end
