class User < ApplicationRecord
    #Necessary to authenticate
    has_secure_password
    #Basic password validation, configure to your liking
    validates_length_of      :password, maximum: 72, minimum: 8, allow_nil: true, allow_blank: false
    validates_confirmation_of :password, allow_mil: true, allow_blank: false
    
    before_validation{
        (self.email = self.email.to_s.downcase) && ( self.username = self.username.to_s.downcase)
    }
    
    # Make sure email and username are present and unique
    validates_presence_of       :email
    validates_presence_of       :username
    validates_uniqueness_of     :email
    validates_uniqueness_of     :username
    
    def can_modify_user?(user_id)
        role == 'admin' || id.to_s == user_id.to_s
    end
    
    def is_admin?
        role == 'admin'
    end
end
