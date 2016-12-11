class Place < ApplicationRecord
  # Direct associations

  has_many   :my_gift_cards,
             :dependent => :destroy

  has_many   :deals,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
