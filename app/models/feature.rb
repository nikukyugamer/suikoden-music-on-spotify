class Feature < ApplicationRecord
  belongs_to :album
  belongs_to :track, foreign_key: :id_str, primary_key: :id_str

  validates :album_id, presence: true
  validates :id_str, presence: true, uniqueness: true
  validates :duration_ms, presence: true
  validates :tempo, presence: true
  validates :time_signature, presence: true
  validates :key, presence: true
  validates :mode, presence: true
  validates :acousticness, presence: true
  validates :danceability, presence: true
  validates :energy, presence: true
  validates :instrumentalness, presence: true
  validates :liveness, presence: true
  validates :loudness, presence: true
  validates :speechiness, presence: true
  validates :valence, presence: true
  validates :api_analysis_url, presence: true, uniqueness: true
  validates :api_track_href, presence: true, uniqueness: true
end
