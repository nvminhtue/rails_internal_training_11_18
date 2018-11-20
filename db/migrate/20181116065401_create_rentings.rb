class CreateRentings < ActiveRecord::Migration[5.2]
  def change
    create_table :rentings do |t|
      t.datetime :return_day_at
      t.datetime :actual_day_at
      t.references :user
      t.references :book

      t.timestamps
    end
  end
end
