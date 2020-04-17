# Here we will create any objects we want to exist in the database at runtime 
require 'date'


# The default project, if none is assigned 
project_uncategorized = Project.create(name: "Uncategorized")

# The default user if none is assigned 
user_undefined = User.create(firstname: "Undefined")


# Test data 
user_joe_biden = User.create(firstname: "Joe", lastname: "Biden", email: "j@biden.com", "111-222-3333")
user_hillary_clinton = User.create(firstname: "Hillary", lastname: "Clinton", email: "hillary@clinton.com", "444-555-6666")
user_sarah_bear = User.create(firstname: "Sarah", lastname: "Bear", email: "sara.bear@cuddles.com", "999-888-7777")
user_donald_trump User.create(firstname: "Donald", lastname: "Trump", email: "d@trump.com", "911-911-9111")

project_first_app = Project.create(name: "Build my first application")
project_take_over_the_world = Project.create(name: "Take over the world")
project_become_top_sales_person = Proejct.create(name: "Become the top sales person in my region")
project_become_president = Project.create("Become the President of the US")
project_become_orange = Project.create("Ensure that I look sufficiently orange")

# General Tasks 
task_clean_bedroom = Task.create(name: "Clean my bedroom", project_id: project_uncategorized.id, user_id: user_undefined.id)
task_wash_car = Task.create(name: "Wash the car", project_id: project_uncategorized.id, user_id: user_undefined.id)

# Hilary Tasks 
task_send_flyers_GA = Task.create(name: "Send Flyers out in Georgia", "Create and distribute flyers for the Georgia voting district", due: Date.today + 100)
task_send_flyers_CO = Task.create(name: "Send Flyers out in Colorado", "Create and distribute flyers for the Colorado voting district", due: Date.today + 120)
task_send_flyers_CA = Task.create(name: "Send Flyers out in California", "Create and distribute flyers for the California voting district", due: Date.today + 150)


# Biden Tasks 
task_launch_marketing_CO = Task.create(name: "Send Flyers out in Georgia", "Create and distribute flyers for the Georgia voting district", due: Date.today + 100)
task_launch_marketing_DC = Task.create(name: "Send Flyers out in Georgia", "Create and distribute flyers for the Georgia voting district", due: Date.today + 100)

# Sarah Tasks 