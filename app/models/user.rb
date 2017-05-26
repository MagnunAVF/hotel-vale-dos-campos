class User < ApplicationRecord
  validates_presence_of :name, :cpf, :address, :birthday, :email, :fone
  validates_uniqueness_of :cpf, :email
  validates_numericality_of :cpf, :fone
  validates :fone, length: { is: 11 }
  validates :cpf, length: { is: 11 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
    message: "it's not an email!" }
end
