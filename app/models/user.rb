class User < ApplicationRecord

    has_many :userlangs
    has_many :languages, through: :userlangs
    has_secure_password

end
