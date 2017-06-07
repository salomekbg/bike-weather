class Citibike < ApplicationRecord
  require 'csv'
  require 'byebug'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      citibike_hash = row.to_h
      citibike_date_array = citibike_hash["date"].split('/')
      citibike_date_array[0].length == 1 ? citibike_date_array[0].insert(0, "0") : nil
      citibike_date_array[1].length == 1 ? citibike_date_array[1].insert(0, "0") : nil
      citibike_date_array[2].insert(0, "20")
      citibike_hash["date"] = citibike_date_array.join('/')
      Citibike.create!(citibike_hash)
    end
  end

  def self.search(date)
    where("date LIKE ?", "%#{date}%")
  end
  
end
