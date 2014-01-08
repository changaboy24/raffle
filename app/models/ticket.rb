class Ticket < ActiveRecord::Base
	validates :name, presence: true,
                    length: { minimum: 5 }

    has_one :person
end
