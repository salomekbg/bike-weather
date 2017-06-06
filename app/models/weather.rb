class Weather < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      weather_hash = row.to_h
      Weather.create!(weather_hash)
    end
  end
end
