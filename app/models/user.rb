class User < ActiveRecord::Base
    has_secure_password
    # validates_length_of :username, minimum: 5
    has_many :travel_listers
    validates_presence_of :username, :password
    # validates_uniqueness_of :username
    
     #validates_length_of :username, within: 6..20, too_long: 'pick a shorter name', too_short: 'pick a longer name'

end