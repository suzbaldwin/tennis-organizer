class CreateRacquets < ActiveRecord::Migration
  def change
    create_table :racquets do |t|
      t.string :name
      t.string :manufacturer
      t.integer :user_id
      t.integer :tennis_bag_id
    end
  end
end
