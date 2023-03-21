class Todo < ApplicationRecord
    
    enum :status, [:CREATED, :IN_PROGRESS, :COMPLETE, :CANCELED]
    enum :priority, [:LOW, :MEDIUM, :HIGH]

    validates :title, presence: true, length: { minimum: 5, maximum: 25 }
    validates :description, presence: true, length: { minimum: 40 }

    validate :check_title

    def check_title
        if !title.include?('.')
            errors.add(:title, "Title must contain a '.' character" )
        end
    end


    #DATA => title min => 5, max => 25, is not empty, contain(.)
    #description => min => 40, is not empty

end
