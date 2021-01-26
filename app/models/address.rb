class Address < ApplicationRecord
    belongs_to :customer
    def full_address
        postcode + address + name
    end
end
