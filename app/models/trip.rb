class Trip < ApplicationRecord
  validates :name, presence: true
  validates :destination, presence: true, length: {minimum: 5, maximum: 500}
  validates :start_date, presence: true
  validates :end_date, presence: true

  has_many :tripitems

  belongs_to :user
  validates :user_id, presence: true


  default_scope -> { order(updated_at: :desc)}


end
