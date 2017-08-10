class Batch < ApplicationRecord
  belongs_to :user
  has_many :students
  validates :number, presence: true, uniqueness: true
  # validates :start_at, :end_at,
  #           presence: true

  def self.search(number)
    if number
      where('number LIKE ?', "%#{number}")
    else
      all
    end
  end
end
