class User < ActiveRecord::Base
    has_secure_password
    validates :username, :password, presence: true
    validates :username, uniqueness: true
    # {  message: "The #{user[:username]} is taken already! Try again." }
    validates_length_of :username, within: 6..20
    # , too_long: 'pick a shorter name', too_short: 'pick a longer name'
    has_many :lists
end
