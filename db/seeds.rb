# Here we will create any objects we want to exist in the database at runtime 
require 'date'

# Start date 
d = Date.parse("2020-04-17")

# The default project, if none is assigned 
project_uncategorized = Project.create(name: "Uncategorized")

# The default user if none is assigned 
user_undefined = User.create(firstname: "Undefined")


# Test data 
user_joe_biden = User.create(firstname: "Joe", lastname: "Biden", email: "j@biden.com", phone: "111-222-3333")
user_hillary_clinton = User.create(firstname: "Hillary", lastname: "Clinton", email: "hillary@clinton.com", phone: "444-555-6666")
user_sarah_bear = User.create(firstname: "Sarah", lastname: "Bear", email: "sara.bear@cuddles.com", phone: "999-888-7777")
user_donald_trump = User.create(firstname: "Donald", lastname: "Trump", email: "d@trump.com", phone: "911-911-9111")

project_first_app = Project.create(name: "Build my first application")
project_take_over_the_world = Project.create(name: "Take over the world")
project_become_top_sales_person = Project.create(name: "Become the top sales person in my region")
project_become_president = Project.create(name: "Become the President of the US")
project_become_orange = Project.create(name: "Ensure that I look sufficiently orange")
project_save_the_nation = Project.create(name: "Save the Nation") 

# General Tasks 
task_wash_car = Task.create(name: "Wash the car", project_id: project_uncategorized.id, user_id: user_undefined.id)

# Hilary Tasks 
task_send_flyers_GA = Task.create(name: "Send Flyers out in Georgia", description: "Create and distribute flyers for the Georgia voting district", due: d + 30, user_id: user_hillary_clinton.id)
task_send_flyers_CO = Task.create(name: "Send Flyers out in Colorado", description: "Create and distribute flyers for the Colorado voting district", due: d + 45, user_id: user_hillary_clinton.id)
task_send_flyers_CA = Task.create(name: "Send Flyers out in California", description: "Create and distribute flyers for the California voting district", due: d + 60, user_id: user_hillary_clinton.id)
task_increase_tech_security = Task.create(name: "Hire better IT Peopel", description: "We do not need another email breach", due: d + 5, user_id: user_hillary_clinton.id)

# Biden Tasks 
task_launch_marketing_CO = Task.create(name: "Record marketing video for Colorado", due: Date.today + 90, user_id: user_joe_biden.id)
task_launch_marketing_DC = Task.create(name: "Send Flyers out in Georgia", description: "Create and distribute flyers for the Georgia voting district", due: d + 100, user_id: user_joe_biden.id )

# Donal Tasks 
task_sun_tan = Task.create(name: "Get orange spray tan", due: Date.today + 100, project_id: project_become_orange.id )
task_incease_mask_production = Task.create(name: "Work with manufacturer's to increase mask production", due: d + 5, project_id: project_save_the_nation.id, user_id: user_donald_trump.id )
task_develop_vaccine = Task.create(name: "Develop vaccine", due: d + 5, project_id: project_save_the_nation.id, user_id: user_donald_trump.id )
task_build_hospitals = Task.create(name: "Build more hospitals", due: d + 30, project_id: project_save_the_nation.id, user_id: user_donald_trump.id  )

# Sarah Tasks 
task_clean_bedroom = Task.create(name: "Clean my bedroom", project_id: project_uncategorized.id, user_id: user_sarah_bear.id)
task_make_friends = Task.create(name: "Go to virtual meetups", project_id: project_uncategorized.id, user_id: user_sarah_bear.id)
task_learn_about_CLI = Task.create(name: "Watch Intro to CLI Video", project_id: project_first_app.id, user_id: user_sarah_bear.id)
task_learn_tty_prompt  = Task.create(name: "Read TTY Prompt Documentation on github", project_id: project_first_app.id, user_id: user_sarah_bear.id)
task_learn_ruby_map = Task.create(name: "Practice using ruby map function", project_id: project_first_app.id, user_id: user_sarah_bear.id)
task_learn_ruby_collect  = Task.create(name: "Practice using ruby collect function", project_id: project_first_app.id, user_id: user_sarah_bear.id)
task_learn_ruby_select  = Task.create(name: "Practice using ruby select function", project_id: project_first_app.id, user_id: user_sarah_bear.id)