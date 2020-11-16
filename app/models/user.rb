class User < ActiveRecord::Base
    has_secure_password
    validates :username, :password, presence: true
    validates :username, uniqueness: true
    validates_length_of :username, within: 6..20
    has_many :lists
end
