class Removeloyalty < ActiveRecord::Migration
  def change
  	drop_table :loyalties
  end
end
