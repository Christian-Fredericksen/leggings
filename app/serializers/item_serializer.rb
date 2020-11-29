class ItemSerializer < ActiveRecord::Serializer 
    attributes :id, :name, :price, :description, :image
    
end
