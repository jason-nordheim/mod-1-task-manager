class CreateUserTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t| 
      t.string    :firtname
      t.string    :lastname    
      t.string    :email
      t.string    :phone 

      # created_at, updated_at 
      t.timestamps  
    end
  end 
end
