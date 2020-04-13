class CreateTasksTable < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t| 
      t.string    :name    
      t.text      :description
      t.datetime  :due

      # created_at, updated_at 
      t.timestamps  
    end
  end 
end
