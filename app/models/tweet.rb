class Tweet < ApplicationRecord
  # Relations
  has_and_belongs_to_many :hashtags
  belongs_to :user

  # Validations
  validates :body, length: { minimum: 1, maximum: 280 }

  # Callbacks
  after_create :make_hashtags

  private

  def make_hashtags
    hashtags = body.scan(/#(\w*[0-9a-zA-Z]+\w*[0-9a-zA-Z])/m)

    hashtags.map do |h|
      hashtag = Hashtag.find_or_create_by(name: h.first.downcase)
      self.hashtags << hashtag
    end
  end
end
