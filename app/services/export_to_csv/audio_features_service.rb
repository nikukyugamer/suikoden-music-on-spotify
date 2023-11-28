require 'csv'

module ExportToCsv
  class AudioFeaturesService
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
    EXPORTED_FILE_PATH = Rails.root.join('db/csv_files')

    def album(album_name)
      Spotify::FetchAlbumService.new.execute(album_name)
    end

    def track_ids(album)
      album.tracks.map(&:id)
    end

    def execute
      CSV.open(EXPORTED_FILE_PATH, 'w', force_quotes: true) do |csv|
        csv << headers

        rows.each do |row|
          csv << row.values
        end
      end
    end

    # TODO: CSV だと順番も重要だから人間の目に優しくしたい
    def headers
      %w[
        name
        upc
        href
        id
        image_height
        image_url
        label
        popularity
        release_date
        release_date_precision
        total_tracks
      ]
    end

    def rows
      rows = []

      ALBUM_NAMES.each do |album_name|
        album = Spotify::FetchAlbumService.new.execute(album_name)

        name = album_name
        upc = album.external_ids['upc']
        href = album.href
        id = album.id
        # 異なる画像サイズの個数分の配列になっていて、最初が最大サイズであることはきっと保証されている
        image_height = album.images.first['height']
        image_url = album.images.first['url']
        label = album.label
        popularity = album.popularity
        release_date = album.release_date
        release_date_precision = album.release_date_precision
        total_tracks = album.total_tracks

        rows << {
          name:,
          upc:,
          href:,
          id:,
          image_height:,
          image_url:,
          label:,
          popularity:,
          release_date:,
          release_date_precision:,
          total_tracks:
        }
      end

      rows
    end
  end
end