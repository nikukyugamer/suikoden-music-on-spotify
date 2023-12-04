require 'csv'

module ImportToDb
  class AlbumService
    def initialize
      @csv_data = CSV.read('db/csv_files/albums.csv', headers: true)
    end

    def execute
      albums = @csv_data.map do |row|
        artist_id_str = row['artist_id']

        # Artist がインポートされていることが前提となる
        artist = Artist.find_by(id_str: artist_id_str)
        artist_id = artist.id

        Album.new(
          artist_id:,
          id_str: row['id'],
          upc: row['upc'],
          name: row['name'],
          label: row['label'],
          popularity: row['popularity'].to_i,
          total_tracks: row['total_tracks'].to_i,
          url: row['spotify_external_url'],
          image_url: row['image_url'],
          image_height: row['image_height'].to_i,
          release_date_or_year: row['release_date'],
          release_date_precision: row['release_date_precision'],
          api_href: row['api_href']
        )
      end

      Album.import!(albums, on_duplicate_key_ignore: false)

      nil
    end
  end
end
