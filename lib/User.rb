class User < ActiveRecord::Base 
  # first we need to establish which table they are being joined through 
  has_many :tasks  # <== A user has many tasks 
  has_many :projects, through: :tasks  # <== a user has many projects, based on tasks 

  def full_name 
    return "#{firstname} #{lastname}"
  end 
end