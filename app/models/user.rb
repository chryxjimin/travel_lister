class User < ActiveRecord::Base
    has_secure_password
    has_many :travel_listers
    validates_presence_of :username, :password
    #add validates length of password and uniqueness or username and password
end