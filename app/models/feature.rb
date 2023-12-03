class Feature < ApplicationRecord
  belongs_to :album

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
