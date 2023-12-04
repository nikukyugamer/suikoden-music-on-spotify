class Album < ApplicationRecord
  belongs_to :artist
  has_many :tracks, dependent: :destroy
  has_many :features, dependent: :destroy

  validates :artist_id, presence: true
  validates :id_str, presence: true, uniqueness: true
  validates :upc, presence: true, uniqueness: true
  validates :name, presence: true
  validates :label, presence: true
  validates :popularity, presence: true
  validates :total_tracks, presence: true
  validates :url, presence: true, uniqueness: true
  validates :image_url, presence: true, uniqueness: true
  validates :image_height, presence: true
  validates :release_date_or_year, presence: true
  validates :release_date_precision, presence: true
  validates :api_href, presence: true, uniqueness: true
end
