class CartSerializer < ActiveRecord::Serializer
    attributes :id
    has_one: user
    has_many: items
end