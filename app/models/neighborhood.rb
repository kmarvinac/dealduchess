class Neighborhood < ApplicationRecord
  # Direct associations

  has_many   :places,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
