require 'rails_helper'

RSpec.describe Track, type: :model do
  it 'Album へのアソシエーションが設定されていること' do
    expect(Track.first.album.class).to eq Album
  end

  it 'track.feature で Feature へのアソシエーションが設定されていること' do
    track = Track.first

    expect(track.feature.present?).to eq true
  end
end
