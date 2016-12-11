class Place < ApplicationRecord
  # Direct associations

  belongs_to :neighborhood,
             :counter_cache => true

  belongs_to :place_type,
             :counter_cache => true

  has_many   :my_gift_cards,
             :dependent => :destroy

  has_many   :deals,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
