require 'csv'

module ExportToCsv
  class TracksInEachAlbumService
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
        rows = rows(track_ids)

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
      # FIXME: 50曲を超える場合にはオフセットの設定が必要
      album.tracks.map(&:id)
    end

    def headers
      %w[
        id
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

    def rows(track_ids)
      rows = []

      tracks = Spotify::FetchTracksService.new.execute(track_ids)

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

        rows << {
          id:,
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

      rows
    end

    private

    def album_names_to_csv_filenames
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
