class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :buildingCode
      t.decimal :gpsLongitude
      t.decimal :gpsLatitude

      t.timestamps
    end
  end
end
