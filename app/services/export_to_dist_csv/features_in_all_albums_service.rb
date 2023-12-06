require 'csv'

module ExportToDistCsv
  class FeaturesInAllAlbumsService
    EXPORTED_FILE_PATH = Rails.root.join('db/dist_csv_files/features_all.csv')

    def initialize; end # rubocop:disable Style/RedundantInitialize

    def execute
      CSV.open(EXPORTED_FILE_PATH, 'w', force_quotes: true) do |csv|
        csv << headers

        rows.each do |row|
          csv << row
        end
      end

      nil
    end

    def headers
      ExportToDistCsv::FeaturesInAlbumBaseValuesService.headers
    end

    def rows
      Feature.all.map.with_index(1) do |feature, id_number|
        ExportToDistCsv::FeaturesInAlbumBaseValuesService.row_values(feature, id_number)
      end
    end
  end
end
