class Deal < ApplicationRecord
  # Direct associations

  belongs_to :place,
             :counter_cache => true

  # Indirect associations

  # Validations

end
