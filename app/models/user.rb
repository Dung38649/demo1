class User < ApplicationRecord
    attr_accessor :password, :password_confir
    before_save :encrypt_password
    
    validates_confirmation_of :password
    validates_presence_of :password, :on => :create
    validates :password, presence: true,
    length: { minimum: 3 }
    validates_presence_of :email
    validates_uniqueness_of :email
    validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ , message: "Nhập ko hợp lệ" }

    def self.authenticate(email, password)
        user = find_by_email(email)
        if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
            user
        else
            nil
        end 
    end

    def encrypt_password
        if password.present?
            self.password_salt = ::BCrypt::Engine.generate_salt
            self.password_hash = ::BCrypt::Engine.hash_secret(password, password_salt)
          end
    end
    
    def admin?
       self.role == "admin"
    end

end
