require 'rails_helper'

RSpec.describe Artist, type: :model do
  before do
    ImportToDb::ArtistService.new.execute
  end

  it 'レコード数が 4つ であること' do
    expect(Artist.count).to eq 4
  end
end
