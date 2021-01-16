class Season < ApplicationRecord
    has_many :episodes, dependent: :destroy
    belongs_to :media_collection
end