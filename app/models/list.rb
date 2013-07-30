class List < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { in: 4..50 }
  has_many :qq
end
