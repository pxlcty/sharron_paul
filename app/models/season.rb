class Season < ApplicationRecord
    has_many :episodes
    belongs_to :media_collection
end