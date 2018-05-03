class Room < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :messages   
    validates :name, presence: true
    validates :email, presence: true
    belongs_to :creator, class_name: "User"

    def name_capitalised
        self.name.split(' ').map(&:capitalize).join(' ')
    end
end
