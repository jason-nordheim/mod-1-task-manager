class CreateTasksTable < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t| 
      t.string    :name    
      t.text      :description
      t.datetime  :due

      # created_at, updated_at 
      t.timestamps  
      t.references :project # <=== a task belongs to one project 
      t.references :user # <=== a task belongs to one user
    end
  end 
end
