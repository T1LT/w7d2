class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.references :band, null: false, foreign_key: true, index: false
      t.index [:band_id, :title], unique: true
      t.boolean :album_type, null: false, default: true
      t.timestamps
    end
  end
end
