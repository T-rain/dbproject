class Changeyeartype < ActiveRecord::Migration
  def change
  	remove_column :loyals, :year
  	add_column :loyals, :year, :integer
  end
end
