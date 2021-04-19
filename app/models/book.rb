class Book < ApplicationRecord

    belongs_to :user, optional: true

    def self.available
        Book.where(reserve: false, payed: false)
    end
end
