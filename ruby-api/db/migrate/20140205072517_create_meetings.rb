class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :deptCode
      t.string :courseNumber
      t.string :sectionNumber
      t.string :buildingCode
      t.string :roomNumber
      t.string :meetingDay
      t.string :period

      t.timestamps
    end
  end
end
