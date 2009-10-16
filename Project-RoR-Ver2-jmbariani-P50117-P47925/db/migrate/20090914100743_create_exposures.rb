class CreateExposures < ActiveRecord::Migration
  def self.up
    create_table :exposures do |t|
      t.string :media_name
      t.string :img_url

      t.timestamps
    end
  end

  def self.down
    drop_table :exposures
  end
end
