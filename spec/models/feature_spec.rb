require 'rails_helper'

RSpec.describe Feature, type: :model do
  it 'Album へのアソシエーションが設定されていること' do
    expect(Feature.first.album.class).to eq Album
  end
end
