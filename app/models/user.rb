class User < ActiveRecord::Base
    has_secure_password
    has_many :travel_essentials
    validates_presence_of :username, :email, :password
end