class CreateArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :artists do |t|
      t.string :spotify_id, null: false, comment: 'Spotify のアーティストID'
      t.string :name, null: false, comment: 'アーティスト名'
      t.integer :popularity, null: false, comment: 'アーティストの"人気度"'
      t.string :url, null: false, comment: 'アーティストのURL'
      t.string :image_url, null: false, comment: 'アーティストの画像URL'
      t.integer :image_height, null: false, comment: 'アーティストの画像の高さ'
      t.string :api_href, null: false, comment: 'アーティストのAPIのURL'

      t.timestamps
    end

    add_index :artists, :spotify_id, unique: true
    add_index :artists, :url, unique: true
    add_index :artists, :image_url, unique: true
    add_index :artists, :api_href, unique: true
  end
end
