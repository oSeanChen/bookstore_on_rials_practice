class Book < ApplicationRecord
  validates :title, :content, presence: true
end
