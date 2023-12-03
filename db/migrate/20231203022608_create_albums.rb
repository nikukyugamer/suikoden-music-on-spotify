class CreateAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :albums do |t|
      t.references :artist, null: false, foreign_key: true, comment: 'アルバムのアーティスト'
      t.string :id_str, null: false, comment: 'Spotify のアルバムID'
      t.integer :upc, null: false, comment: 'アルバムのUPC'
      t.string :name, null: false, comment: 'アルバム名'
      t.string :label, null: false, comment: 'アルバムのレーベル'
      t.integer :popularity, null: false, comment: 'アルバムの"人気度"'
      t.integer :total_tracks, null: false, comment: 'アルバムのトラック数'
      t.string :url, null: false, comment: 'アルバムのURL'
      t.string :image_url, null: false, comment: 'アルバムの画像URL'
      t.integer :image_height, null: false, comment: 'アルバムの画像の高さ'
      t.string :release_date, null: false, comment: 'アルバムのリリース年または日'
      t.string :release_date_precision, null: false, comment: 'アルバムのリリース日単位（年または日）'
      t.string :api_href, null: false, comment: 'アルバムのAPIのURL'

      t.timestamps
    end

    add_index :albums, :id_str, unique: true
    add_index :albums, :upc, unique: true
    add_index :albums, :url, unique: true
    add_index :albums, :image_url, unique: true
    add_index :albums, :api_href, unique: true
  end
end
