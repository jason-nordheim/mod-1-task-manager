class Task < ActiveRecord::Base 
  belongs_to :user, :polymorphic => true, :class_name => "User"
  belongs_to :project, :polymorphic => true, :class_name => "Project"
end