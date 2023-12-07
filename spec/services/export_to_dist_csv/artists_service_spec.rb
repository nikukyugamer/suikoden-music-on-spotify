require 'rails_helper'

RSpec.describe 'ExportToDistCsv::ArtistsService' do
  it 'エクスポータが正しく実行できること' do
    csv_filepath = 'tmp/dist_csv_artists.csv'

    ExportToDistCsv::ArtistsService.new.execute(csv_filepath)

    expect(File.exist?(csv_filepath)).to eq true
  end
end
