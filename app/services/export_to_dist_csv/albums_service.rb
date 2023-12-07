require 'csv'

module ExportToDistCsv
  class AlbumsService
    def initialize; end # rubocop:disable Style/RedundantInitialize

    def execute
      exported_file_path = 'db/dist_csv_files/albums.csv'

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
        アルバム名
        レーベル名
        URL
        人気度
        総トラック数
        リリース年月日
        画像URL
      ]
    end

    def rows
      Album.all.map.with_index(1) do |album, id_number|
        [
          id_number,
          album.name,
          album.label,
          album.url,
          album.popularity,
          album.total_tracks,
          album.release_date_or_year,
          album.image_url,
        ]
      end
    end
  end
end
