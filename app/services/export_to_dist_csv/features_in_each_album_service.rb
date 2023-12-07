require 'csv'

module ExportToDistCsv
  class FeaturesInEachAlbumService
    def initialize(album_name)
      @album_name = album_name
    end

    def execute(exported_files_dir = Rails.root.join('db/dist_csv_files'))
      raise 'アルバム名の指定が誤っています' unless @album_name.in?(album_names)

      exported_file_name = album_name_to_exported_file_name[@album_name]
      exported_file_path = "#{exported_files_dir}/#{exported_file_name}"

      CSV.open(exported_file_path, 'w', force_quotes: true) do |csv|
        csv << headers
        rows = rows(@album_name)

        rows.each do |row|
          csv << row
        end
      end

      nil
    end

    def headers
      ExportToDistCsv::FeaturesInAlbumBaseValuesService.headers
    end

    def rows(album_name)
      album = Album.find_by(name: album_name)
      features = Feature.where(album:)

      features.map.with_index(1) do |feature, id_number|
        ExportToDistCsv::FeaturesInAlbumBaseValuesService.row_values(feature, id_number)
      end
    end

    private

    def album_name_to_exported_file_name
      {
        '幻想水滸伝 ORIGINAL GAME SOUNDTRACK' => 'features_s1.csv',
        '幻想水滸伝II ORIGINAL GAME SOUNDTRACK Vol.1' => 'features_s2_1.csv',
        '幻想水滸伝II ORIGINAL GAME SOUNDTRACK Vol.2' => 'features_s2_2.csv',
        '幻想水滸伝III ORIGINAL SOUNDTRACK SELECTION' => 'features_s3.csv',
        '幻想水滸伝IV ORIGINAL SOUNDTRACK SELECTION' => 'features_s4.csv',
        '幻想水滸伝V ORIGINAL SOUNDTRACK SELECTION' => 'features_s5.csv',
        '幻想水滸伝ティアクライス ORIGINAL SOUNDTRACK' => 'features_tk.csv',
        '幻想水滸伝 紡がれし百年の時 オリジナルサウンドトラック' => 'features_tsumutoki.csv'
      }
    end

    def album_names
      album_name_to_exported_file_name.keys
    end
  end
end
