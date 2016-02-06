class Recipe < ActiveRecord::Base
  validates :title, presence: true
  validates :preparation, presence: true
end
