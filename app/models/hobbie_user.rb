class HobbieUser < ApplicationRecord
    belongs_to :user
    belongs_to :hobby
end
