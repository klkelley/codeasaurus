require 'video_thumb'

class Resource < ApplicationRecord
  belongs_to :teacher, class_name: User

  TYPES = %w(video snippet markdown)

  validates :resource_type, presence: true,
    inclusion: { in: TYPES, message: "%{value} is not a valid type." }

  def thumb
    VideoThumb::get(body, "small") if resource_type == "video"
  end

end
