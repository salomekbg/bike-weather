class Citibike < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      citibike_hash = row.to_h
      citibike_date_array = citibike_hash["Date"].split('/')
      citibike_date_array[0].length == 1 ? citibike_date_array[0].insert(0, "0") : nil
      citibike_date_array[1].length == 1 ? citibike_date_array[1].insert(0, "0") : nil
      citibike_date_array[2].length == 2 ? citibike_date_array[2].insert(0, "20") : nil
      citibike_hash["Date"] = citibike_date_array.join('/')
      if Citibike.exists?(date: citibike_hash["Date"])
        Citibike.where(date: citibike_hash["Date"]).update(trips: citibike_hash["Trips over the past 24-hours (midnight to 11:59pm)"], miles: citibike_hash["Miles traveled today (midnight to 11:59 pm)"])
      else
        Citibike.create(date: citibike_hash["Date"], trips: citibike_hash["Trips over the past 24-hours (midnight to 11:59pm)"], miles: citibike_hash["Miles traveled today (midnight to 11:59 pm)"])
      end
    end
  end

  def self.search(date)
    where("date LIKE ?", "%#{date}%")
  end

  def self.delete
    Citibike.all.delete_all
  end
end
