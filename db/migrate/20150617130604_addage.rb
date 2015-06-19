class Addage < ActiveRecord::Migration
  def change
  	rename_column :loyals, :age, :agebegin
  	add_column :loyals, :agelast, :integer
  end
end
