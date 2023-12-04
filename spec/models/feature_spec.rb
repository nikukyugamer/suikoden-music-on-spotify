require 'rails_helper'

RSpec.describe Feature, type: :model do
  it 'Album へのアソシエーションが設定されていること' do
    expect(Feature.first.album.class).to eq Album
  end

  it 'feature.track で Track へのアソシエーションが設定されていること' do
    feature = Feature.first

    expect(feature.track.present?).to eq true
  end
end
