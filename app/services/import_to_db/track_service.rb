require 'csv'

module ImportToDb
  class TrackService
    TRACK_CSV_FILENAMES = [
      'tracks_s1.csv',
      'tracks_s2_1.csv',
      'tracks_s2_2.csv',
      'tracks_s3.csv',
      'tracks_s4.csv',
      'tracks_s5.csv',
      'tracks_tk.csv',
      'tracks_tsumutoki.csv',
    ].freeze

    def initialize; end # rubocop:disable Style/RedundantInitialize

    def execute
      TRACK_CSV_FILENAMES.each do |track_csv_filename|
        csv_data = CSV.read("db/csv_files/#{track_csv_filename}", headers: true)

        tracks = csv_data.map do |row|
          album_id_str = row['album_id']

          # Album がインポートされていることが前提となる
          album = Album.find_by(id_str: album_id_str)
          album_id = album.id

          Track.new(
            album_id:,
            id_str: row['id'],
            isrc: row['isrc'],
            name: row['name'],
            popularity: row['popularity'].to_i,
            duration_ms: row['duration_ms'].to_i,
            disc_number: row['disc_number'].to_i,
            track_number: row['track_number'].to_i,
            spotify_external_url: row['spotify_external_url'],
            preview_url: row['preview_url'],
            api_href: row['api_href']
          )
        end

        Track.import!(tracks, on_duplicate_key_ignore: false)
      end
    end
  end
end
