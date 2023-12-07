require 'csv'

module ExportToDistCsv
  class ArtistsService
    def initialize; end # rubocop:disable Style/RedundantInitialize

    def execute
      exported_file_path = 'db/dist_csv_files/artists.csv'

      CSV.open(exported_file_path, 'w', force_quotes: true) do |csv|
        csv << headers

        rows.each do |row|
          csv << row
        end
      end

      nil
    end

    def headers
      %w[
        id
        アーティスト名
        URL
        人気度
        画像URL
      ]
    end

    def rows
      Artist.all.map.with_index(1) do |artist, id_number|
        [
          id_number,
          artist.name,
          artist.url,
          artist.popularity,
          artist.image_url,
        ]
      end
    end
  end
end
