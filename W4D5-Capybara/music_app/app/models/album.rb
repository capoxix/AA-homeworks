class Album < ApplicationRecord
  validates :band_id, :title, :year, presence: true
  validates :live, inclusion: { in: [true, false]}

  belongs_to :band,
  foreign_key: :band_id,
  class_name: :Band

  has_many :tracks,
  foreign_key: :album_id,
  class_name: :Track,
  dependent: :destroy
end
