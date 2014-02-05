class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :sessionId
      t.date :startDate
      t.date :endDate

      t.timestamps
    end
  end
end
