class AddImpressionsCountToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :impressions_count, :integer
  end
end
