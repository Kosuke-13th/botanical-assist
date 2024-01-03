class Plant < ApplicationRecord

  validates :plant_name,           presence: true, length: { minimum: 1, maximum: 20 }
  validates :plant_category,       presence: true, length: { minimum: 1, maximum: 20 }
  validates :watering_id,          presence: true, numericality: { other_than: 1 }
  validates :growth_time_id,       presence: true, numericality: { other_than: 1 }
  validates :agrochemical_time_id, presence: true, numericality: { other_than: 1 }
  validates :plant_text,           length: { minimum: 1, maximum: 1000 }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :watering
  belongs_to :growth_time
  belongs_to :agrochemical_time
end
