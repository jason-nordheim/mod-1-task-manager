class Menu 
  attr_reader :prompt, :user_menu 
  def initialize 
    @prompt = TTY::Prompt.new 
  end 
  DEFAULT_MENU_OPTIONS = [
    "EXIT", "BACK"
  ]
  MAIN_MENU_CHOICES = [
    "Create new user",        # 0 
    "Create new task",        # 1 
    "Create new project",     # 2 
    "View all users",         # 3 
    "View all tasks",         # 4 
    "View all projects",      # 5 
    "View tasks by user",     # 6
    "View tasks by project",  # 7
    "Remove a user",          # 8
    "Remove a task",          # 9
    "Remove a project"        # 10 
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
      view_all_users
    when MAIN_MENU_CHOICES[4] then # View all users
      view_all_tasks 
    when MAIN_MENU_CHOICES[5] then # View all projects 
      view_all_projects 
    when MAIN_MENU_CHOICES[6] then # View tasks by user
      view_tasks_by_user 
    when MAIN_MENU_CHOICES[7] then # View tasks by project 
      view_tasks_by_project 
    when MAIN_MENU_CHOICES[8] then # Update User 
      remove_user 
    when MAIN_MENU_CHOICES[9] then # Remove project
      remove_task 
    when MAIN_MENU_CHOICES[10] then # Remove Project 
      remove_project
    when DEFAULT_MENU_OPTIONS[0] then # EXIT 
      exit # end application 
    else 
      system("clear")
      main # User selected 'BACK', or an invalid option. 
    end
    main() 
  end

  def remove_user 
    s_user = search_user() 
    User.delete(s_user.id)
    "User: '#{s_user.full_name}' deleted"
  end 

  def remove_task   
    s_task = prompt.ask("What task would you like to remove? (Enter part or all of task name") {|q| q.required(true)}
    s_task_obj = Task.find {|t| t.name.match?("^*(#{s_task})")}
    if s_task_obj == nil 
      puts "No task matched search critirea. Please try again"
      remove_task
    else 
      Task.delete(s_task.id)
      Puts "Task: '#{s_task.name}' deleted"
    end 
  end 
  
  def remove_project 
    search_p = prompt.ask("What project would you like to remove? (Enter part or all of project name") {|q| q.required(true)}
    search_p_result = Project.find {|p| p.name.match?("^*(#{search_p})")}
    if search_p_result == nil 
      puts "No task matched search critirea. Please try again"
      remove_project
    else 
      Project.delete(search_p_result.id)
      Puts "Project: '#{search_p_result.name}' deleted"
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
    p_name = get_project_name() 
    Project.create(name: p_name)
    main() 
  end 

  def get_project_name
    project_name = prompt.ask("Please enter a name for your project: ") do |q| 
      # todo: q.validate()
      q.required(true) 
    end 
  end 

  def create_new_task
    t_name = get_task_name() 
    t_description = get_task_description()
    t_due_date = get_due_date()
    t_user = search_user?()
    t_project = find_project() 
    
    Task.create(name: t_name, description: t_description, due: t_due_date, user_id: t_user.id, project_id: t_project.id)
  end 

  def search_user? 
    if prompt_optional("user to this task")
      return search_user() 
    end 
  end 

  def search_user 
    selected_user = nil 
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
    selected_user 
  end 

  def find_project 
    search = prompt.ask("Please enter the project name") {|q| q.required(true) }
    Project.find do |proj|
      proj.name.match?("^*[#{search}]*$")
    end 
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

  def view_all_tasks
    display_tasks(Task.all) 
    main() 
  end 

  def view_all_users
    display_users(User.all)
    main() 
  end

  def view_tasks_by_user 
    user = search_user() 
    tasks = Task.select {|t| t.user_id == user.id }
    display_tasks(tasks)
  end 

  def standardize(input_string, chars_to_display)
    if input_string == nil 
      return "".ljust(chars_to_display, " ")
    elsif input_string.chars.count < chars_to_display
      return input_string.ljust(chars_to_display, " ")
    else 
      return input_string.slice(0, chars_to_display)
    end 
  end 


  def view_tasks_by_project
    # prompt for project 
    proj = find_project()
    # display all tasks associated with project 
    related_tasks = Task.select {|t| t.project_id == proj.id} 
    display_tasks(related_tasks)
    main() 
  end 

  def view_all_projects
    display_projects(Project.all)
  end 

  def display_users user_list 
    # | id | first | last | email | phone     \t| 
    str_user = user_list.map {|u| "| #{u.id} \t| #{standardize(u.firstname,10)}\t| #{standardize(u.lastname,15)}\t| #{standardize(u.email,20)}\t| #{standardize(u.phone,10)}\t|"}
    header = "| id \t| first    \t| last            \t| email               \t| phone      \t|"
    puts header  
    puts "-----------------------------------------------------------------------------------------"
    str_user.each { |u| puts u}
    puts "-----------------------------------------------------------------------------------------"
  end 

  def display_projects(projects)
    str_projects = projects.map do |pr|
       "| #{pr.id}\t| #{standardize(pr.name, 20)}\t| #{ standardize(Task.select {|t| t.project_id == pr.id}.count.to_s, 10)}\t|" 
    end 
    header = "| id \t| name                \t| No. Tasks \t|"
    puts header 
    puts "-------------------------------------------------"
    str_projects.each{ |pr| puts pr }
    puts "-------------------------------------------------"
  end 

  def display_tasks(tasks)
    tasks_str = tasks.mapcl{ |t| "| #{t.id}\t| #{t.name}\t| #{t.due} \t|" }
    puts "| id\t| name \t\t| due\t\t\t\t|"
    puts "---------------------------------------------------------"
    tasks_str.each {|t| puts t }
    puts "---------------------------------------------------------"
  end 
end 