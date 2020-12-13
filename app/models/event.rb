class Event < ApplicationRecord
    validates :headline, presence: true, length: { minimum: 3 }
    validates :short_description, presence: true, length: { minimum: 3 }
    validates :location, presence: true
    validates :time, presence: true
end