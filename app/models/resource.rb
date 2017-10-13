require 'video_thumb'
require 'video_player'

class Resource < ApplicationRecord
  belongs_to :teacher, class_name: User

  TYPES = %w(video snippet markdown)

  validates :resource_type, presence: true,
    inclusion: { in: TYPES, message: "%{value} is not a valid type." }

  def thumb
    VideoThumb::get(body, "small") if resource_type == "video"
  end

  def iframe
    VideoPlayer::player(body, "1200", "800", false) if resource_type == "video"
  end
end
