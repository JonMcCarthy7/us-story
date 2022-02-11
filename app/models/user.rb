class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :relationship, optional: true

  has_many :entries, class_name: 'Entry'
  has_many :parent_entries, class_name: 'ParentEntry'

  has_one_attached :profile_image

  validates_presence_of :email, :first_name, :last_name#, :date_of_birth
end
