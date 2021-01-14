class MediaCollection < ApplicationRecord
    has_many :seasons
    belongs_to :media_category
end