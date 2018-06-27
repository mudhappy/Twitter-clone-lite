class Tweet < ApplicationRecord
  validates :body, length: { minimum: 1, maximum: 280 }

  belongs_to :user
end
