class User < ApplicationRecord
    has_secure_password
    has_many :posts, dependent: :destroy
    validates :username, uniqueness: true, presence: true, length: {in: 4..25}
    validates :email, presence: true, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}
    validates :password, length: {in: 6..250}

    def self.from_omniauth(auth)
        self.find_or_create_by(provider: auth.fetch(:provider), uid: auth.fetch(:uid)) do |u|
            u.email = auth.fetch(:email)
            u.password = SecureRandom.hex(20)
            u.username = auth.fetch(:username).downcase.gsub(" ", "_")
        end
    end
end
