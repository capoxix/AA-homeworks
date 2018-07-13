class Track < ApplicationRecord
  validates :album_id, :ord, :title, presence: true
  validates :bonus, inclusion: { in: [true, false]}

  belongs_to :album,
  foreign_key: :album_id,
  class_name: :Album
end
