# EXAMPLE: 
# class CreateJoinTableCustomerProduct < ActiveRecord::Migration[5.0]
#   def change
#     create_join_table :customers, :products do |t|
#       # t.index [:customer_id, :product_id]
#       # t.index [:product_id, :customer_id]
#     end
#   end
# end

class AddJoinBetweenProjectsAndTasks < ActiveRecord::Migration[6.0]
  def change
    create_join_table :projects, :tasks 
  end
end
