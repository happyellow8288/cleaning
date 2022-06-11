class Tweet < ApplicationRecord

    belongs_to :user
    mount_uploader :image1, ImageUploader
    mount_uploader :image2, ImageUploader
    mount_uploader :image3, ImageUploader
    mount_uploader :image4, ImageUploader
    is_impressionable
    is_impressionable counter_cache: true
end
