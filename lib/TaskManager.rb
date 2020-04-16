require 'tty-prompt'

class TaskManager 
  attr_reader :menu  
  def initialize 
    @menu = Menu.new 
  end 
  DEFAULT_MENU_OPTIONS = [
    "EXIT", "BACK"
  ]
  MAIN_MENU_CHOICES = [
    "Create new user", 
    "Create new task", 
    "Create new project", 
    "View all users",
    "View all tasks", 
    "View all projects", 
    "View tasks by user",
    "View tasks by project"
  ] 

  def start
    menu.main  
  end 

end


