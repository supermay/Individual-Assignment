class Student < ApplicationRecord
  belongs_to :batch
  has_many :evaluations
  validates :picture, presence: true, uniqueness: true
  validates :first_name, :last_name,
            presence: true
end
