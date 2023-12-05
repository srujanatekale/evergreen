class CreateCustomers < ActiveRecord::Migration[5.1]
    def change
        create_table :customers do |t|
           t.string :name, :null => false
           t.string :email, :null => false
           t.string :contact, :null => false
        end
    end
end
