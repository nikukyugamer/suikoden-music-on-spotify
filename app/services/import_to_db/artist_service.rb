require 'csv'

module ImportToDb
  class ArtistService
    def initialize
      @csv_data = CSV.read('db/csv_files/artists.csv', headers: true)
    end

    def execute
      artists = @csv_data.map do |data|
        Artist.new(
          id_str: data['id'],
          name: data['name'],
          popularity: data['popularity'].to_i,
          url: data['spotify_external_url'],
          image_url: data['image_url'],
          image_height: data['image_height'].to_i,
          api_href: data['api_href']
        )
      end

      Artist.import!(artists, on_duplicate_key_ignore: true)

      nil
    end
  end
end
