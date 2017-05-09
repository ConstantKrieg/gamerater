class User < ActiveRecord::Base

    has_secure_password


    validates :username, uniqueness: true, presence: true,
                         length: { minimum: 3, maximum: 30 }
    validates :password, length: {minimum: 4},presence: true ,
                format: {with: /\d[A-Z]|[A-Z].*\d/,
                message: "Your password has to contain at least one number and one letter must be upper case!"}                        

    has_many :reviews, dependent: :destroy
    has_many :comments
end
