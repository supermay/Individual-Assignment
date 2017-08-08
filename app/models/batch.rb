class Batch < ApplicationRecord
  belongs_to :user
  validates :number, presence: true, uniqueness: true
  validates :start, :end,
            presence: true
end
