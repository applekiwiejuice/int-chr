class Number < ApplicationRecord
    validates :entered_number, presence: true
end
