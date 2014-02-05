class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :deptCode
      t.string :courseNumber
      t.string :sectionNumber
      t.string :credits
      t.string :instructor
      t.string :courseTitle

      t.timestamps
    end
  end
end
