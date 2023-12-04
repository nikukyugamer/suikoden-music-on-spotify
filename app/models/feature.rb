class Feature < ApplicationRecord
  belongs_to :album

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

  def track_name
    Track.find_by(id_str:).name
  end

  def disc_number
    Track.find_by(id_str:).disc_number
  end

  def track_number
    Track.find_by(id_str:).track_number
  end

  def popularity
    Track.find_by(id_str:).popularity
  end
end
