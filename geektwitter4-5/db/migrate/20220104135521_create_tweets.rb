class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :body1
      t.string :image1
      t.string :body2
      t.string :image2
      t.string :body3
      t.string :image3
      t.string :body4
      t.string :image4
      t.string :place
      t.integer :time
      t.string :item
      t.string :title

      t.timestamps
    end
  end
end
