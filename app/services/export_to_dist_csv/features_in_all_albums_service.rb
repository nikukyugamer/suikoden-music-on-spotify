require 'csv'

module ExportToDistCsv
  class FeaturesInAllAlbumsService
    def initialize; end # rubocop:disable Style/RedundantInitialize

    def execute(exported_file_path = Rails.root.join('db/dist_csv_files/features_all.csv'))
      CSV.open(exported_file_path, 'w', force_quotes: true) do |csv|
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
