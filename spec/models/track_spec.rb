require 'rails_helper'

RSpec.describe Track, type: :model do
  it 'Album へのアソシエーションが設定されていること' do
    expect(Track.first.album.class).to eq Album
  end
end
