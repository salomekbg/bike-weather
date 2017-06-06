class Citibike < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      citibike_hash = row.to_h
      citibike_hash["date"].insert(-3, "20")
      Citibike.create!(citibike_hash)
    end
  end
end
