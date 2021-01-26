class Genre < ApplicationRecord
    has_many :products, dependent: :destroy
    validates :name, length:  { in: 1..20 }, presence: true
end
