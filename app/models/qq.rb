class Qq < ActiveRecord::Base
  belongs_to :list
  has_many :note
  validates :number, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { in: 6..20 }
  validates :status, presence: true, inclusion: { in: %w(正常 已删除) }
end
