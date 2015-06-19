class Loyal < ActiveRecord::Base
	def self.abc
	    query = <<-SQL
	    	SELECT count(*) AS allOrder  FROM a05b01_paxdata WHERE Pax_Gender='女' AND Pax_Age>30 AND Pax_Age<60 AND Tour_Date LIKE '2012%';
	    SQL

	     data=Order.find_by_sql(query)

	     #.pluck("Service_id")

	    #Client.where("orders_count = ? AND locked = ?", params[:orders], false)
  	end


  	def self.def
	    query = <<-SQL
	    	SELECT count(*)AS allOrder FROM a05b01_paxdata WHERE Pax_Gender='女' AND Pax_Age>30 AND Pax_Age<60 AND Tour_Code LIKE 'A%' AND Tour_Date LIKE '2012%'
	    SQL

	    data=Order.find_by_sql(query)#.pluck("Service_id")
  	end



  	def self.generate_result(gender,agebegin,agelast,year,region)

  		data=Order.where("Pax_Gender = ? AND Pax_Age > ? AND Pax_Age < ? AND Tour_Date LIKE '?%' AND Tour_Code LIKE ?", gender, agebegin,agelast,year,region).count
  	end




end
