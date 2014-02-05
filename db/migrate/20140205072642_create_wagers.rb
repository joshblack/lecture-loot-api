class CreateWagers < ActiveRecord::Migration
  def change
    create_table :wagers do |t|
      t.integer :userId
      t.integer :sessionId
      t.integer :wagerUnitValue
      t.integer :wagerTotalValue
      t.integer :pointsLost

      t.timestamps
    end
  end
end
