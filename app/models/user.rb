class User < ApplicationRecord

	has_secure_password
	has_many :api_keys
	
	validates :username, uniqueness: true
	validates :email, presence: true
	validates :email, uniqueness: true
	validates :password_digest, presence: true
	
	after_create do 
		initialize!
	end
	
	def create_api_key
		if admin
			api_keys.create(
				public: SecureRandom.base64(32),
				secret: SecureRandom.base64(32),
				master: true
			)
		end
	end
	
	def initialize!
		u = "anon"+id.to_s
		update(username: u, name: u)
	end
end
