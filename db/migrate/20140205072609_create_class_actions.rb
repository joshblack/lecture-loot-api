class CreateClassActions < ActiveRecord::Migration
  def change
    create_table :class_actions do |t|
      t.string :sectionNumber
      t.integer :userId
      t.string :meetingDay
      t.string :period
      t.boolean :checkedIn
      t.boolean :cancelled

      t.timestamps
    end
  end
end
