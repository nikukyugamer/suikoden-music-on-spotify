require 'csv'

module ImportToDb
  class FeatureService
    FEATURE_CSV_FILENAMES = [
      'features_s1.csv',
      'features_s2_1.csv',
      'features_s2_2.csv',
      'features_s3.csv',
      'features_s4.csv',
      'features_s5.csv',
      'features_tk.csv',
      'features_tsumutoki.csv',
    ].freeze

    def initialize; end # rubocop:disable Style/RedundantInitialize

    def execute # rubocop:disable Metrics/AbcSize
      FEATURE_CSV_FILENAMES.each do |feature_csv_filename|
        csv_data = CSV.read("db/csv_files/#{feature_csv_filename}", headers: true)

        features = csv_data.map do |row|
          album_id_str = row['album_id']

          # Album がインポートされていることが前提となる
          album = Album.find_by(id_str: album_id_str)
          album_id = album.id

          # cf. db/migrate/20231203050800_create_features.rb
          Feature.new(
            album_id:,
            id_str: row['id'],
            duration_ms: row['duration_ms'].to_i,
            tempo: row['tempo'].to_f,
            time_signature: row['time_signature'].to_i,
            key: row['key'].to_i,
            mode: row['mode'].to_i,
            acousticness: row['acousticness'].to_f,
            danceability: row['danceability'].to_f,
            energy: row['energy'].to_f,
            instrumentalness: row['instrumentalness'].to_f,
            liveness: row['liveness'].to_f,
            loudness: row['loudness'].to_f,
            speechiness: row['speechiness'].to_f,
            valence: row['valence'].to_f,
            api_analysis_url: row['api_analysis_url'],
            api_track_href: row['api_track_href']
          )
        end

        Feature.import!(features, on_duplicate_key_ignore: true)
      end
    end
  end
end
