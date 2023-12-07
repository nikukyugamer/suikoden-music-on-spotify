require 'rails_helper'

RSpec.describe 'ExportToDistCsv::AlbumsService' do
  it 'エクスポータが正しく実行できること' do
    csv_filepath = 'tmp/dist_csv_albums.csv'

    ExportToDistCsv::AlbumsService.new.execute(csv_filepath)

    expect(File.exist?(csv_filepath)).to eq true
  end
end
