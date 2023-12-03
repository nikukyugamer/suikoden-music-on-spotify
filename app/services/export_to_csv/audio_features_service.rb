require 'csv'

module ExportToCsv
  class AudioFeaturesService
    # FIXME: yaml から ALBUM_NAMES を読み込むようにする
    ALBUM_NAMES = [
      '幻想水滸伝 ORIGINAL GAME SOUNDTRACK',
      '幻想水滸伝II ORIGINAL GAME SOUNDTRACK Vol.1',
      '幻想水滸伝II ORIGINAL GAME SOUNDTRACK Vol.2',
      '幻想水滸伝III ORIGINAL SOUNDTRACK SELECTION',
      '幻想水滸伝IV ORIGINAL SOUNDTRACK SELECTION',
      '幻想水滸伝V ORIGINAL SOUNDTRACK SELECTION',
      '幻想水滸伝ティアクライス ORIGINAL SOUNDTRACK',
      '幻想水滸伝 紡がれし百年の時 オリジナルサウンドトラック',
    ].freeze

    def execute
      ALBUM_NAMES.each do |album_name|
        album = album(album_name)
        track_ids = track_ids(album)
        rows = rows(album, track_ids)

        exported_file_path = album_names_to_csv_filenames[album_name]

        CSV.open(exported_file_path, 'w', force_quotes: true) do |csv|
          csv << headers

          rows.each do |row|
            csv << row.values
          end
        end
      end

      nil
    end

    def album(album_name)
      Spotify::FetchAlbumService.new.execute(album_name)
    end

    def track_ids(album)
      # 一度に取得できるのは 50曲 なのでオフセットを設定する必要がある
      total_tracks = album.total_tracks
      number_of_offset_units = (total_tracks / 50) + 1

      number_of_offset_units.times.map do |i|
        album.tracks(limit: 50, offset: i * 50).map(&:id)
      end.flatten
    end

    def headers
      %w[
        id
        album_id
        duration_ms
        tempo
        time_signature
        key
        mode
        acousticness
        danceability
        energy
        instrumentalness
        liveness
        loudness
        speechiness
        valence
        api_analysis_url
        api_track_href
      ]
    end

    def rows(album, track_ids)
      rows = []

      track_ids.each do |track_id|
        features = Spotify::FetchAudioFeaturesService.new.execute(track_id)

        acousticness = features.acousticness
        api_analysis_url = features.analysis_url
        danceability = features.danceability
        duration_ms = features.duration_ms
        energy = features.energy
        id = features.id
        instrumentalness = features.instrumentalness
        key = features.key
        liveness = features.liveness
        loudness = features.loudness
        mode = features.mode
        speechiness = features.speechiness
        tempo = features.tempo
        time_signature = features.time_signature
        api_track_href = features.track_href
        valence = features.valence

        album_id = album.id

        rows << {
          id:,
          album_id:,
          duration_ms:,
          tempo:,
          time_signature:,
          key:,
          mode:,
          acousticness:,
          danceability:,
          energy:,
          instrumentalness:,
          liveness:,
          loudness:,
          speechiness:,
          valence:,
          api_analysis_url:,
          api_track_href:
        }
      end

      rows
    end

    private

    def album_names_to_csv_filenames
      base_path = Rails.root.join('db/csv_files')

      {
        '幻想水滸伝 ORIGINAL GAME SOUNDTRACK' => "#{base_path}/features_s1.csv",
        '幻想水滸伝II ORIGINAL GAME SOUNDTRACK Vol.1' => "#{base_path}/features_s2_1.csv",
        '幻想水滸伝II ORIGINAL GAME SOUNDTRACK Vol.2' => "#{base_path}/features_s2_2.csv",
        '幻想水滸伝III ORIGINAL SOUNDTRACK SELECTION' => "#{base_path}/features_s3.csv",
        '幻想水滸伝IV ORIGINAL SOUNDTRACK SELECTION' => "#{base_path}/features_s4.csv",
        '幻想水滸伝V ORIGINAL SOUNDTRACK SELECTION' => "#{base_path}/features_s5.csv",
        '幻想水滸伝ティアクライス ORIGINAL SOUNDTRACK' => "#{base_path}/features_tk.csv",
        '幻想水滸伝 紡がれし百年の時 オリジナルサウンドトラック' => "#{base_path}/features_tsumutoki.csv"
      }
    end
  end
end
