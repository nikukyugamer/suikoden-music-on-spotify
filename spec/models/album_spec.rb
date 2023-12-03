require 'rails_helper'

RSpec.describe Album, type: :model do
  it 'Artist へのアソシエーションが設定されていること' do
    expect(Album.first.artist.class).to eq Artist
  end

  it 'Track へのアソシエーションが設定されていること' do
    expect(Album.first.tracks).to be_present
    expect(Album.first.tracks.first.class).to eq Track
  end

  it 'Feature へのアソシエーションが設定されていること' do
    expect(Album.first.features).to be_present
    expect(Album.first.features.first.class).to eq Feature
  end
end
