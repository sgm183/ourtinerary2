class Trip < ApplicationRecord
  validates :name, presence: true
  validates :destination, presence: true, length: {minimum: 5, maximum: 500}
end
