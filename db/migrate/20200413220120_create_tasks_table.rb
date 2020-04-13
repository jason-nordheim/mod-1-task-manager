class CreateTasksTable < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t| 
      t.string    :name           null: false # name field should never be false 
      t.text      :description    null: true  # description can be empty 
      t.datetime  :due            null: true  # due date can be null 

      # created_at, updated_at 
      t.timestamps  
    end
end
