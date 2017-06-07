class Weather < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      weather_hash = row.to_h
      new_date = weather_hash["date"][4..5] + "/" + weather_hash["date"][6..7] + "/" + weather_hash["date"][0..3]
      date_array = new_date.split('/')
      weather_hash["date"] = date_array.join('/')
      Weather.create!(weather_hash)
    end
  end

  def self.search(date)
    where("date LIKE ?", "%#{date}%")
  end

  def self.delete
    Weather.all.delete_all
  end
end
