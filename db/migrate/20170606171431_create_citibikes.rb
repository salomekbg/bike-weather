class CreateCitibikes < ActiveRecord::Migration[5.0]
  def change
    create_table :citibikes do |t|
      t.string :date
      t.integer :trips
      t.integer :miles

      t.timestamps
    end
  end
end
