class MyGiftCard < ApplicationRecord
  mount_uploader :card_image, CardImageUploader

  # Direct associations

  belongs_to :place,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
