class CreateTennisBags < ActiveRecord::Migration
  def change
    create_table :tennis_bags do |t|
      t.string :name
      t.integer :capacity
      t.integer :user_id
    end
  end
end
