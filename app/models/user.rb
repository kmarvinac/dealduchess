class User < ApplicationRecord
  # Direct associations

  has_many   :places,
             :dependent => :nullify

  # Indirect associations

  # Validations
  validates :username, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
