class Menu 
  attr_reader :prompt, :user_menu 
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

  def prompt_optional field_name 
    prompt.yes?("Would you like to add a/an #{field_name}?", required: true)
  end   
  
  def main  
    response = prompt.select("Please select an option (1-8): ", MAIN_MENU_CHOICES.clone.concat(DEFAULT_MENU_OPTIONS)) 
    case response
    when MAIN_MENU_CHOICES[0] then # Create new user 
      create_new_user
    when MAIN_MENU_CHOICES[1] then # Create new task  
      create_new_task
    when MAIN_MENU_CHOICES[2] then # Create new project  
      create_new_project
    when MAIN_MENU_CHOICES[3] then # View all tasks
      view_all_tasks 
    when MAIN_MENU_CHOICES[4] then # View all users
      view_all_users 
    when MAIN_MENU_CHOICES[5] then # View all projects 
      view_all_projects 
    when MAIN_MENU_CHOICES[6] then # View tasks by user
      view_tasks_by_user 
    when MAIN_MENU_CHOICES[7] then # View tasks by project 
      view_tasks_by_project 
    when DEFAULT_MENU_OPTIONS[0] then # EXIT 
      exit # end application 
    else 
      system("clear")
      menu_main # User selected 'BACK', or an invalid option. 
    end
  end
  def create_new_user
    first_name = get_name("first")
    last_name = get_name("last")
    email = get_email() 
    phone = get_phone() 
    # Create and save user instance 
    new_user = User.create(firstname: first_name, lastname: last_name, email: email, phone: phone) 
    # return to main menu 
    main
  end 
  def get_phone
    if prompt_optional("phone number")
      phone = ""
      loop do 
        phone = prompt.ask("What is your phone number (###-###-####)?")
        # require '@' and '.' characters
        if phone.chars.count != "###-###-####".chars.count 
          puts 'Invalid phone number'
        else 
          break 
        end 
      end 
      phone
    end 
  end 

  # gets the users email address using tty-prompt 
  def get_email
    if prompt_optional("email")
      prompt.ask('What is your email?') { |q| q.validate :email }
    end 
  end 
  def get_name name_description 
    name = ""
    loop do 
      name = prompt.ask("What is your #{name_description} name?")
      if name.chars.count < 2 
        puts "Invalid #{name_description} name: too short"
      else 
        return name 
      end 
    end 
  end 

  def create_new_project
  end 

  def create_new_task
    t_name = get_task_name() 
    t_description = get_task_description()
    t_due_date = get_due_date()
    t_user = get_user_assignment()
    
    # t_project = get_project_assignment() 
    # main  
  end 

  def get_user_assignment
    selected_user = nil 
    if prompt_optional("user to this task")
      loop do 
        first_name = get_name("first")
        last_name = get_name("last")
        selected_user = User.find { |user| user.firstname == first_name && user.lastname == last_name } 
        if selected_user == nil 
          puts 'User not found'
        else
          return selected_user 
        end 
      end 
    end 
    selected_user 
  end 

  def get_project_assignment
  end 

  def get_due_date
    dd_string = prompt.ask("Please enter a due date (YYYY-MM-DD):", validate: /^\d{4}-\d{2}-\d{2}\z/)
    due_date = Date.parse(dd_string)
  end 

  def get_task_description
    desc = ""
    if prompt_optional("task description")
      loop do 
        desc = prompt.ask("Please enter a description of your task, and hit return when finished.")
        if desc.chars.count < 10 
          puts "Invalid Description: too short"
        else 
          break 
        end 
      end 
    else 
      nil 
    end 
  end 

  def get_task_name 
    name = "" 
    loop do 
      name = prompt.ask("Please enter a name for this task:")
      if name.chars.count < 2 
        puts 'Invalid task name: Too short'
      else 
        break
      end 
    end 
    name 
  end 

  def menu_view_all_tasks
  end 

  def menu_view_all_users
  end 

  def menu_view_all_projects
  end 

  def menu_view_tasks_by_user 
  end 

  def view_tasks_by_user user 
    array_tasks = Tasks.all.select { | task | task.user_id == user.user_id } 
  end 

  def menu_view_tasks_by_project
  end 
end 