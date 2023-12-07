require 'rails_helper'

RSpec.describe 'ExportToDistCsv::FeaturesInEachAlbumService' do
  it 'エクスポータが正しく実行できること' do
    exported_files_dir = 'tmp'

    # TODO: DRY じゃないので直したい
    album_name_to_exported_file_name = {
      '幻想水滸伝 ORIGINAL GAME SOUNDTRACK' => 'features_s1.csv',
      '幻想水滸伝II ORIGINAL GAME SOUNDTRACK Vol.1' => 'features_s2_1.csv',
      '幻想水滸伝II ORIGINAL GAME SOUNDTRACK Vol.2' => 'features_s2_2.csv',
      '幻想水滸伝III ORIGINAL SOUNDTRACK SELECTION' => 'features_s3.csv',
      '幻想水滸伝IV ORIGINAL SOUNDTRACK SELECTION' => 'features_s4.csv',
      '幻想水滸伝V ORIGINAL SOUNDTRACK SELECTION' => 'features_s5.csv',
      '幻想水滸伝ティアクライス ORIGINAL SOUNDTRACK' => 'features_tk.csv',
      '幻想水滸伝 紡がれし百年の時 オリジナルサウンドトラック' => 'features_tsumutoki.csv'
    }

    album_name_to_exported_file_name.each do |album_name, exported_file_name|
      service = ExportToDistCsv::FeaturesInEachAlbumService.new(album_name)
      service.execute(exported_files_dir)

      expect(File.exist?("#{exported_files_dir}/#{exported_file_name}")).to be_truthy
    end
  end
end
