class MediaCollection < ApplicationRecord
    has_many :seasons, dependent: :destroy
    belongs_to :media_category
end