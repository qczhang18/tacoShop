class Taco < ApplicationRecord
  validates :meat, presence: true
  validates :rice, :salsa, :pepper, inclusion: { in: [true, false] }
end
