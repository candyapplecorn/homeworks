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

<<<<<<< HEAD
=======
    def is_password?(pass)
      self.password_digest.is_password?(pass)
    end

>>>>>>> 33a3d562e414f7840879b0828549896300008af1
	def self.find_by_credentials(username, password)
		self.find_by(username: username, password: password)
	end

	def self.generate_session_token
		SecureRandom.base64
	end
<<<<<<< HEAD
=======

    def self.find_by_credentials(username, password)
      user = User.find_by(username: username)
      return nil if user.nil?
      user.is_password?(password) ? user : nil
    end
>>>>>>> 33a3d562e414f7840879b0828549896300008af1
end
