class CreateTracks < ActiveRecord::Migration[7.1]
  def change
    create_table :tracks do |t|
      t.references :album, null: false, foreign_key: true, comment: 'トラックが収録されているアルバム'
      t.string :id_str, null: false, comment: 'Spotify のトラックID'
      t.string :isrc, null: false, comment: 'トラックのISRC'
      t.string :name, null: false, comment: 'トラック名'
      t.integer :popularity, null: false, comment: 'トラックの"人気度"'
      t.integer :duration_ms, null: false, comment: 'トラックの長さ（ミリ秒）'
      t.integer :disc_number, null: false, comment: 'トラックのディスク番号'
      t.integer :track_number, null: false, comment: 'トラックのトラック番号'
      t.string :spotify_external_url, null: false, comment: 'トラックのSpotifyのURL'
      t.string :preview_url, null: false, comment: 'トラックのプレビューURL'
      t.string :api_href, null: false, comment: 'トラックのAPIのURL'

      t.timestamps
    end

    add_index :tracks, :id_str, unique: true
    add_index :tracks, :isrc, unique: true
    add_index :tracks, :spotify_external_url, unique: true
    add_index :tracks, :preview_url, unique: true
    add_index :tracks, :api_href, unique: true
  end
end
