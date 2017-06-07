class Weather < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      weather_hash = row.to_h
      new_date = weather_hash["DATE"][4..5] + "/" + weather_hash["DATE"][6..7] + "/" + weather_hash["DATE"][0..3]
      weather_hash["DATE"] = new_date
      if Weather.exists?(date: weather_hash["DATE"])
        Weather.where(date: weather_hash["DATE"]).update(precipitation: weather_hash["PRCP"], tmax: weather_hash["TMAX"], tmin: weather_hash["TMIN"])
      else
        Weather.create(date: weather_hash["DATE"], precipitation: weather_hash["PRCP"], tmax: weather_hash["TMAX"], tmin: weather_hash["TMIN"])
      end
    end
  end

  def self.search(date)
    where("date LIKE ?", "%#{date}%")
  end

  def self.delete
    Weather.all.delete_all
  end
end
