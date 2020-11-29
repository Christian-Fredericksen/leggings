class User < ApplicationRecord
    has_one: cart
    has_many: items
    has_secure: password
end
