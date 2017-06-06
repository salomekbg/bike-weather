class CreateWeathers < ActiveRecord::Migration[5.0]
  def change
    create_table :weathers do |t|
      t.string :date
      t.integer :precipitation
      t.integer :tmax
      t.integer :tmin

      t.timestamps
    end
  end
end
