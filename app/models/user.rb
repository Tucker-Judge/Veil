class User < ApplicationRecord
    has_many :lessons
    has_many :languages, through: :lessons
    has_secure_password
end
