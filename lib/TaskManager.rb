require 'tty-prompt'

class TaskManager 
  attr_reader :prompt 
  def initialize 
    @prompt = TTY::Prompt.new 
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
    menu_main 
  end 

  def menu_main  
    response = prompt.select("Please select an option (1-8): ", MAIN_MENU_CHOICES.clone.concat(DEFAULT_MENU_OPTIONS)) 
    case response
    when MAIN_MENU_CHOICES[0] then # Create new user 
      menu_create_new_user
    when MAIN_MENU_CHOICES[1] then # Create new project  
      menu_create_new_project 
    when MAIN_MENU_CHOICES[2] then # Create new task 
      menu_create_new_task 
    when MAIN_MENU_CHOICES[3] then # View all tasks
      menu_view_all_tasks 
    when MAIN_MENU_CHOICES[4] then # View all users
      menu_view_all_users 
    when MAIN_MENU_CHOICES[5] then # View all projects 
      menu_view_all_projects 
    when MAIN_MENU_CHOICES[6] then # View tasks by user
      menu_view_tasks_by_user 
    when MAIN_MENU_CHOICES[7] then # View tasks by project 
      menu_view_tasks_by_project 
    when DEFAULT_MENU_OPTIONS[0] then # EXIT 
      exit # end application 
    else 
      system("clear")
      menu_main # User selected 'BACK', or an invalid option. 
    end
  end

  def menu_create_new_user
  end 

  def menu_create_new_project
  end 

  def menu_create_new_task
  end 

  def menu_view_all_tasks
  end 

  def menu_view_all_users
  end 

  def menu_view_all_projects
  end 

  def menu_view_tasks_by_user
  end 

  def menu_view_tasks_by_project
  end 

  # #endregion 
end





















