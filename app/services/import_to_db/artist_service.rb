require 'csv'

module ImportToDb
  class ArtistService
    def initialize
      @csv_data = CSV.read('db/csv_files/artists.csv', headers: true)
    end

    def execute
      artists = @csv_data.map do |row|
        Artist.new(
          id_str: row['id'],
          name: row['name'],
          popularity: row['popularity'].to_i,
          url: row['spotify_external_url'],
          image_url: row['image_url'],
          image_height: row['image_height'].to_i,
          api_href: row['api_href']
        )
      end

      Artist.import!(artists, on_duplicate_key_ignore: false)

      nil
    end
  end
end
