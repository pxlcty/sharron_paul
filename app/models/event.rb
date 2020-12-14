class Event < ApplicationRecord
    validates :headline, presence: true, length: { minimum: 3 }
    validates :description_short, presence: true, length: { minimum: 3 }
    validates :location_name, presence: true
    validates :time, presence: true
end