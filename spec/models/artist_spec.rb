require 'rails_helper'

RSpec.describe Artist, type: :model do
  it 'レコード数が 4つ であること' do
    expect(Artist.count).to eq 4
  end

  it 'Album へのアソシエーションが設定されていること' do
    expect(Artist.first.albums).to be_present
    expect(Artist.first.albums.first.class).to eq Album
  end

  it 'それぞれの Album に紐づく Track の個数が正しいこと' do
    Album.all.each do |album|
      expect(album.tracks.count).to eq album.total_tracks
    end
  end
end
