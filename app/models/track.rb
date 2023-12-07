class Track < ApplicationRecord
  belongs_to :album
  has_one :feature, foreign_key: :id_str, primary_key: :id_str

  validates :album_id, presence: true
  validates :id_str, presence: true, uniqueness: true
  validates :isrc, presence: true, uniqueness: true
  validates :name, presence: true
  validates :popularity, presence: true
  validates :duration_ms, presence: true
  validates :disc_number, presence: true
  validates :track_number, presence: true
  validates :spotify_external_url, presence: true, uniqueness: true
  validates :preview_url, presence: true, uniqueness: true
  validates :api_href, presence: true, uniqueness: true
end
