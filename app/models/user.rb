class User < ApplicationRecord
    has_many :active_relationships,  class_name:  "Match",
                                   foreign_key: "swiper_id",
                                   dependent:   :destroy
    has_many :passive_relationships, class_name:  "Match",
                                   foreign_key: "swiped_id",
                                   dependent:   :destroy
    has_many :swiped, through: :active_relationships
    has_many :swipers, through: :passive_relationships
end
