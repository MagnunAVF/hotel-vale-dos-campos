class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :cpf, :address, :birthday, :email, :fone
  validates_uniqueness_of :cpf, :email
  validates_numericality_of :cpf, :fone
  validates :fone, length: { is: 11 }
  validates :cpf, length: { is: 11 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
    message: "it's not an email!" }

  has_many :bookings
end
