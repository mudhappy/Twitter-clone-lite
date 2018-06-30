class Tweet < ApplicationRecord
  # Relations
  has_and_belongs_to_many :hashtags
  belongs_to :user

  # Validations
  validates :body, length: { minimum: 1, maximum: 280 }

  # Callbacks
  after_create :make_hashtags
  before_create :randomize_id

  private

  def make_hashtags
    hashtags = body.scan(/#(\w*[0-9a-zA-Z]+\w*[0-9a-zA-Z])/m)

    hashtags.map do |h|
      hashtag = Hashtag.find_or_create_by(name: h.first.downcase)
      self.hashtags << hashtag
    end
  end

  def randomize_id
    begin
      self.random_string_id = SecureRandom.hex
    end while Tweet.where(id: self.random_string_id).exists?
  end
end
