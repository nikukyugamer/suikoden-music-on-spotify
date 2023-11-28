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
      album.tracks.map(&:id)
    end

    # TODO: CSV だと順番も重要だから人間の目に優しくしたい
    def headers
      %w[
        disc_number
        duration_ms
        isrc
        href
        spotify_external_url
        id
        name
        popularity
        preview_url
        track_number
      ]
    end

    def rows(track_ids)
      rows = []

      tracks = Spotify::FetchTracksService.new.execute(track_ids)

      tracks.each do |track|
        disc_number = track.disc_number
        duration_ms = track.duration_ms
        isrc = track.external_ids['isrc']
        href = track.href
        spotify_external_url = track.external_urls['spotify']
        id = track.id
        name = track.name
        popularity = track.popularity
        preview_url = track.preview_url
        track_number = track.track_number

        rows << {
          disc_number:,
          duration_ms:,
          isrc:,
          href:,
          spotify_external_url:,
          id:,
          name:,
          popularity:,
          preview_url:,
          track_number:
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
