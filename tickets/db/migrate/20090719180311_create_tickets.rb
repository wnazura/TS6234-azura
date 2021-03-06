class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :name
      t.string :seat_id
      t.string :address
      t.string :price
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
