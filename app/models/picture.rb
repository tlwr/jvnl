class Picture < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :image, attached: true, content_type: { in: %w[image/jpeg image/png image/gif image/webp image/svg+xml], message: "moet een afbeelding zijn (JPEG, PNG, GIF, WebP, SVG)" }, size: { less_than: 10.megabytes, message: "mag niet groter zijn dan 10MB" }
end
