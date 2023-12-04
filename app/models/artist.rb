class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy

  validates :id_str, presence: true, uniqueness: true
  validates :name, presence: true
  validates :popularity, presence: true
  validates :url, presence: true, uniqueness: true
  validates :image_url, presence: true, uniqueness: true
  validates :image_height, presence: true
  validates :api_href, presence: true, uniqueness: true
end
