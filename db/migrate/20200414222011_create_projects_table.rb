class CreateProjectsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t| 
      t.string    :name
      # created_at, updated_at 
      t.timestamps  
    end
  end 
end
