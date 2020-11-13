class User < ActiveRecord::Base
    has_secure_password
    # validates_length_of :username, minimum: 5
    has_many :lists
    validates :username, :password, presence: true
    # , message: "Username and password cannot be blank"
    validates_uniqueness_of :username
    # validates :name, uniqueness: [ case_sensitive: false ]
    
     #validates_length_of :username, within: 6..20, too_long: 'pick a shorter name', too_short: 'pick a longer name'

end