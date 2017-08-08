class Batch < ApplicationRecord
  belongs_to :user
  has_many :students
  validates :number, presence: true, uniqueness: true
  validates :start, :end,
            presence: true
end
