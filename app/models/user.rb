class User < ApplicationRecord
  # Direct associations

  has_many   :my_gift_cards,
             :dependent => :destroy

  has_many   :places,
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
