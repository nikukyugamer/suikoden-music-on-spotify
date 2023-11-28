require 'csv'

module ExportToCsv
  class ArtistsService
    ARTIST_NAMES = %w[
      コナミ矩形波倶楽部
      幻想水滸伝音楽チーム
      幻想水滸伝ティアクライス音楽チーム
      幻想水滸伝サウンドチーム
    ].freeze
    EXPORTED_FILE_PATH = Rails.root.join('db/csv_files/artists.csv')

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
        name
        popularity
        spotify_external_url
        image_url
        image_height
        href
      ]
    end

    def rows
      rows = []

      ARTIST_NAMES.each do |artist_name|
        artist = Spotify::FetchArtistService.new.execute(artist_name)

        href = artist.href
        spotify_external_url = artist.external_urls['spotify']
        id = artist.id
        # 異なる画像サイズの個数分の配列になっていて、最初が最大サイズであることはきっと保証されている
        image_height = artist.images.first['height']
        image_url = artist.images.first['url']
        name = artist.name
        popularity = artist.popularity

        rows << {
          id:,
          name:,
          popularity:,
          spotify_external_url:,
          image_url:,
          image_height:,
          href:
        }
      end

      rows
    end
  end
end
