class CreateCurrentSessions < ActiveRecord::Migration
  def change
    create_table :current_sessions do |t|
      t.integer :userId
      t.integer :sessionId
      t.integer :wagerUnitValue
      t.integer :wagerTotalValue
      t.integer :pointsLost

      t.timestamps
    end
  end
end
