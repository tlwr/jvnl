class Tag < ApplicationRecord
  has_and_belongs_to_many :pictures

  def name
    id
  end

  validates :id, presence: true, format: { with: /\A[a-z0-9-]+\z/, message: "must be kebab-case" }
end
