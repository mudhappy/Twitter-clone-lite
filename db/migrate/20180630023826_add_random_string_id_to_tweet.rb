class AddRandomStringIdToTweet < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :random_string_id, :string
    add_index :tweets, :random_string_id
  end
end
