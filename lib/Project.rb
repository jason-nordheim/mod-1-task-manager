class Project < ActiveRecord::Base 
  has_many :tasks # establish relationship to tasks table 
  has_many :users, through: :tasks # a project can have many users based upon the tasks 
end