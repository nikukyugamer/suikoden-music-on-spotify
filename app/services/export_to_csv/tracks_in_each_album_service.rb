require 'csv'

module ExportToCsv
  class TracksInEachAlbumService
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

        exported_file_path = album_name_to_csv_filename[album_name]

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
        isrc
        name
        popularity
        duration_ms
        disc_number
        track_number
        spotify_external_url
        preview_url
        api_href
      ]
    end

    def rows(album, track_ids)
      rows = []

      # Spotify::FetchTracksService.new.execute では一度に取得できる上限が 50 なのでループする必要がある
      track_ids.each_slice(50) do |track_50_ids|
        tracks = Spotify::FetchTracksService.new.execute(track_50_ids)

        tracks.each do |track|
          disc_number = track.disc_number
          duration_ms = track.duration_ms
          isrc = track.external_ids['isrc']
          api_href = track.href
          spotify_external_url = track.external_urls['spotify']
          id = track.id
          name = track.name
          popularity = track.popularity
          preview_url = track.preview_url
          track_number = track.track_number

          album_id = album.id

          rows << {
            id:,
            album_id:,
            isrc:,
            name:,
            popularity:,
            duration_ms:,
            disc_number:,
            track_number:,
            spotify_external_url:,
            preview_url:,
            api_href:
          }
        end
      end

      rows
    end

    private

    def album_name_to_csv_filename
      base_path = Rails.root.join('db/csv_files')

      {
        '幻想水滸伝 ORIGINAL GAME SOUNDTRACK' => "#{base_path}/tracks_s1.csv",
        '幻想水滸伝II ORIGINAL GAME SOUNDTRACK Vol.1' => "#{base_path}/tracks_s2_1.csv",
        '幻想水滸伝II ORIGINAL GAME SOUNDTRACK Vol.2' => "#{base_path}/tracks_s2_2.csv",
        '幻想水滸伝III ORIGINAL SOUNDTRACK SELECTION' => "#{base_path}/tracks_s3.csv",
        '幻想水滸伝IV ORIGINAL SOUNDTRACK SELECTION' => "#{base_path}/tracks_s4.csv",
        '幻想水滸伝V ORIGINAL SOUNDTRACK SELECTION' => "#{base_path}/tracks_s5.csv",
        '幻想水滸伝ティアクライス ORIGINAL SOUNDTRACK' => "#{base_path}/tracks_tk.csv",
        '幻想水滸伝 紡がれし百年の時 オリジナルサウンドトラック' => "#{base_path}/tracks_tsumutoki.csv"
      }
    end
  end
end
