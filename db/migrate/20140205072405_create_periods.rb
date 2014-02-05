class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :period
      t.time :startTime

      t.timestamps
    end
  end
end
