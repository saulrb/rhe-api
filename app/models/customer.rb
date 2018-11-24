class Customer < ApplicationRecord
    validates_presence_of :firstname, :lastname, :phone, :street, :location
end