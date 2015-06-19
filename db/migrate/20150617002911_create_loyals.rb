class CreateLoyals < ActiveRecord::Migration
  def change
    create_table :loyals do |t|
      t.string :gender
      t.integer :age
      t.string :region
      t.string :year

      t.timestamps null: false
    end
  end
end
