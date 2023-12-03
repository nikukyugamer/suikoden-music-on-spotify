module ExportToDistCsv
  class FeaturesInAlbumBaseValuesService
    def self.headers
      %w[
        アルバム名
        曲名
        ディスク番号
        曲番号
        人気度
        長さ
        テンポ
        拍子
        キー
        モード
        アコースティック度
        ダンス性
        エネルギッシュさ
        インスト度
        ライブ感
        音圧のデシベル値の平均
        話し声度
        ポジティブ度
      ]
    end

    def self.row_values(feature)
      [
        feature.album.name,
        feature.track_name,
        feature.disc_number,
        feature.track_number,
        feature.popularity,
        feature.duration_ms,
        feature.tempo,
        feature.time_signature,
        feature.key,
        feature.mode,
        feature.acousticness,
        feature.danceability,
        feature.energy,
        feature.instrumentalness,
        feature.liveness,
        feature.loudness,
        feature.speechiness,
        feature.valence,
      ]
    end
  end
end
