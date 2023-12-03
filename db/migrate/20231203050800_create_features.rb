class CreateFeatures < ActiveRecord::Migration[7.1]
  def change
    # 各カラムの具体的な説明は https://python-muda.com/python/spotify-api-ep-2/ や公式ドキュメントを参照すること
    create_table :features do |t|
      t.references :album, null: false, foreign_key: true, comment: 'トラックが収録されているアルバム'
      t.string :id_str, null: false, comment: 'Spotify のトラックID'
      t.integer :duration_ms, null: false, comment: 'トラックの長さ（ミリ秒）'
      t.float :tempo, null: false, comment: 'トラックのテンポ (bpm)'
      t.integer :time_signature, null: false, comment: 'トラックの拍子（各小節に含まれる拍数）'
      # ピッチクラス: https://ja.wikipedia.org/wiki/%E3%83%94%E3%83%83%E3%83%81%E3%82%AF%E3%83%A9%E3%82%B9
      t.integer :key, null: false, comment: 'トラックのキー（ピッチクラスで表現され、0 = C、2 = D など）'
      t.integer :mode, null: false, comment: 'トラックのモード（メジャーは1、マイナーは0）'
      t.float :acousticness, null: false, comment: 'トラックのアコースティック度（0～1）'
      t.float :danceability, null: false, comment: 'トラックのダンス性（0～1）'
      t.float :energy, null: false, comment: 'トラックのエネルギッシュさ（0～1）'
      t.float :instrumentalness, null: false, comment: 'トラックのインスト度（0～1）'
      t.float :liveness, null: false, comment: 'トラックのライブ感（0～1）'
      t.float :loudness, null: false, comment: 'トラックの音圧のデシベル値の平均'
      t.float :speechiness, null: false, comment: 'トラックの話し声度（0～1）'
      t.float :valence, null: false, comment: 'トラックのポジティブ度（0～1）'
      t.string :api_analysis_url, null: false, comment: 'トラックの解析APIのURL'
      t.string :api_track_href, null: false, comment: 'トラックのAPIのURL'

      t.timestamps
    end

    add_index :features, :id_str, unique: true
    add_index :features, :api_analysis_url, unique: true
    add_index :features, :api_track_href, unique: true
  end
end
