class User < ApplicationRecord
	attr_reader :password

	before_validation :ensure_session_token

	validates :password_digest, :session_token, presence: true
	validates :password_digest, presence: { message: "pass can't be blank" }
	validates :password, length: { minimum: 6, allow_nil: true }

	def ensure_session_token
		self.session_token ||= self.class.generate_session_token
	end

	def reset_session_token!
		self.session_token = self.class.generate_session_token
		self.save!
	end

	def password=(pass)
		@password = pass
		self.password_digest = BCrypt::Password.create(@password)
	end

	def self.find_by_credentials(username, password)
		self.find_by(username: username, password: password)
	end

	def self.generate_session_token
		SecureRandom.base64
	end
end
