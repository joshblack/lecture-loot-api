class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :userId
      t.string :deptCode
      t.string :courseNumber
      t.string :sectionNumber

      t.timestamps
    end
  end
end
