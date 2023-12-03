require 'csv'

module ExportToCsv
  class AlbumsService
    EXPORTED_FILE_PATH = Rails.root.join('db/csv_files/albums.csv')

    def execute
      CSV.open(EXPORTED_FILE_PATH, 'w', force_quotes: true) do |csv|
        csv << headers

        rows.each do |row|
          csv << row.values
        end
      end

      nil
    end

    def headers
      %w[
        id
        artist_id
        upc
        name
        label
        popularity
        total_tracks
        spotify_external_url
        image_url
        image_height
        release_date
        release_date_precision
        api_href
      ]
    end

    def rows # rubocop:disable Metrics/AbcSize
      album_names = YAML.load_file(Rails.root.join('db/album_names.yml'))
      rows = []

      album_names.each do |album_name|
        album = Spotify::FetchAlbumService.new.execute(album_name)

        name = album_name
        upc = album.external_ids['upc']
        api_href = album.href
        spotify_external_url = album.external_urls['spotify']
        id = album.id
        # 異なる画像サイズの個数分の配列になっていて、最初が最大サイズであることはきっと保証されている
        image_height = album.images.first['height']
        image_url = album.images.first['url']
        label = album.label
        popularity = album.popularity
        release_date = album.release_date
        release_date_precision = album.release_date_precision
        total_tracks = album.total_tracks

        # 一つのアルバムに複数のアーティストが紐づいていることはないから first でよい
        artist_id = album.artists.first.id

        rows << {
          id:,
          artist_id:,
          upc:,
          name:,
          label:,
          popularity:,
          total_tracks:,
          spotify_external_url:,
          image_url:,
          image_height:,
          release_date:,
          release_date_precision:,
          api_href:
        }
      end

      rows
    end
  end
end
