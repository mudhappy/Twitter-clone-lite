class CreateHashtagsTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :hashtags_tweets, id: false do |t|
      t.references :tweet, foreign_key: true
      t.references :hashtag, foreign_key: true
    end
  end
end
