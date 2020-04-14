class User < ActiveRecord::Base 
  has_many :tasks, :class_name => "Task"
  has_many :projects, :class_name => "Project"
end