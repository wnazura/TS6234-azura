class CreateOutlets < ActiveRecord::Migration
  def self.up
    create_table :outlets do |t|
      t.string :title
      t.string :address

      t.timestamps
    end
  end

  def self.down
    drop_table :outlets
  end
end
