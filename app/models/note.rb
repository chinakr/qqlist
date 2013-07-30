class Note < ActiveRecord::Base
  belongs_to :qq
  validates :qq, :content, :creator, presence: true
end
