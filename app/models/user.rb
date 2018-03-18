class User < ApplicationRecord
  attr_accessor :remember_token
    
    before_save { email.downcase! }
    validates :first_name, :last_name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    validates :password, :presence => true, length: { minimum: 6 }



  ##Returns a hash digest part of the string 
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  ##Returns a random token 
  def User.new_token 
    SecureRandom.urlsafe_base64
  end 

  #Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

    # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget 
    update_attribute(:remember_digest, nil)
  end 


    has_secure_password
end


##BCRYPT PSEDUO FOR REMEMBER ME 
# Create a random string of digits for use as a remember token.
# Place the token in the browser cookies with an expiration date far in the future.
# Save the hash digest of the token to the database.
# Place an encrypted version of the user’s id in the browser cookies.
# When presented with a cookie containing a persistent user id, find the user in the database using the given id, and verify that the remember token cookie matches the associated hash digest from the database.