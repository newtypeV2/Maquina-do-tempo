class User < ApplicationRecord
    has_many :active_relationships,  class_name:  "Match",
                                   foreign_key: "swiper_id",
                                   dependent:   :destroy
    has_many :passive_relationships, class_name:  "Match",
                                   foreign_key: "swiped_id",
                                   dependent:   :destroy
    has_many :swiped, through: :active_relationships
    has_many :swipers, through: :passive_relationships
    has_many :hobbie_users
    has_many :hobbies, through: :hobbie_users

    # has_many :matches, :foreign_key => "swiper_id"
    # has_many :matches, :foreign_key => "swiped_id"
    # has_many :swiped, through: :matches
    # has_many :swiper, through: :matches

    def matches
        self.swiped.select do |swiped|
            self.swipers.include?(swiped)
        end
    end
end
