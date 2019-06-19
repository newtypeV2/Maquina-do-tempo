class User < ApplicationRecord
    has_many :active_relationships,  class_name:  "Match",
                                   foreign_key: "swiper_id",
                                   dependent:   :destroy
    has_many :passive_relationships, class_name:  "Match",
                                   foreign_key: "swiped_id",
                                   dependent:   :destroy
    has_many :swiped, through: :active_relationships
    has_many :swipers, through: :passive_relationships

    has_many :sender_relationships,  class_name:  "Message",
                                   foreign_key: "sender_id",
                                   dependent:   :destroy
    has_many :receiver_relationships, class_name:  "Message",
                                   foreign_key: "receiver_id",
                                   dependent:   :destroy
    has_many :receivers, through: :sender_relationships
    has_many :senders, through: :receiver_relationships         

    has_many :hobbie_users
    has_many :hobbies, through: :hobbie_users
    has_one_attached :avatar

    has_secure_password

    validates :name, presence: true
    validates :password, presence: true
    validates :age, presence: true
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    
    def swiper_name_collect(array)
        array.collect do |match|
            match.swiper
        end
    end

    def swiped_name_collect(array)
        array.collect do |match|
            match.swiped
        end
    end

    def match_select(array,condition)
        array.select do |match|
            match.gave_chance == condition
        end
    end

    def match_accepted
        match_select(self.active_relationships,true)
    end

    def match_rejected
        match_select(self.active_relationships,false)
    end

    def match_said_yes
        match_select(self.passive_relationships,true)
    end

    def match_said_no
        match_select(self.passive_relationships,false)
    end

    def accepted
        self.swiped_name_collect(self.match_accepted)
    end

    def rejected
        self.swiped_name_collect(self.match_rejected)
    end

    def said_yes
        self.swiper_name_collect(self.match_said_yes)
    end

    def said_no
        self.swiper_name_collect(self.match_said_no)
    end


    def matches
        self.accepted.select do |user|
            self.said_yes.include?(user)
        end
    end

    def available_pool
        return User.all-[self]-self.swiped
    end

    def interested
        return self.said_yes - self.matches
    end

    def unique_senders
        return self.senders.uniq
    end

    def unique_receivers
        return self.receivers.uniq
    end

    def user_conversations
        return (self.unique_senders + self.unique_receivers).uniq
    end

    def get_messages_from(sender)
        return self.receiver_relationships.select do |message|
            message.sender == sender
        end
    end

    def get_sent_messages(receiver)
        return self.sender_relationships.select do |message|
            message.receiver == receiver
        end
    end

    def get_conversation(person)
        return (self.get_messages_from(person) + self.get_sent_messages(person)).sort
    end


end
