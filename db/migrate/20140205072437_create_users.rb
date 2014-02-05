class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :emailAddress
      t.string :password
      t.string :display
      t.string :firstName
      t.string :lastName
      t.integer :pointBalance

      t.timestamps
    end
  end
end
