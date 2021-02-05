class User < ApplicationRecord
	has_many :products, dependent: :destroy
	has_many :categories, through: :products
	accepts_nested_attributes_for :products
	validates :user_name, presence: { message: " Enter the username " }
	validates :email, presence: { message: "Enter the email" }
	validates :user_name, uniqueness: { message: "Username already exists" }
	validates :email, uniqueness: { message: "Email already exists" }
	validates :encrypted_password, length: { in: 1..8}
	before_save :password_encryption


	def password_encryption
		encrypt_password = User.encryption(self.encrypted_password)
		self.encrypted_password = encrypt_password
	end

	def self.encryption(password)
		Digest::MD5.hexdigest("#{password}")
	end
end
