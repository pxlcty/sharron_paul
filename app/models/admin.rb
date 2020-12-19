class Admin < ApplicationRecord
    validates :admin_name, presence: true, length: { minimum: 2, maximum: 25 }
    validates :email, presence: true
    
    has_secure_password
end