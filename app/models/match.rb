class Match < ApplicationRecord
    belongs_to :swiper, :class_name => "User"
    belongs_to :swiped, :class_name => "User"
end
