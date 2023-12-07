require 'rails_helper'

RSpec.describe 'ExportToDistCsv::FeaturesInAllAlbumsService' do
  it 'エクスポータが正しく実行できること' do
    csv_filepath = 'tmp/dist_csv_features_all.csv'

    ExportToDistCsv::FeaturesInAllAlbumsService.new.execute(csv_filepath)

    expect(File.exist?(csv_filepath)).to eq true
  end
end
