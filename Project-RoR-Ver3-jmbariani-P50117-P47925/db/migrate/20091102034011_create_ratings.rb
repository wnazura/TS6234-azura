class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :rating
      t.string :rateable_type
      t.integer :menu_id
      t.string :ip_address

      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
