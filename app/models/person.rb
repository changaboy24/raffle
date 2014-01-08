class Person < ActiveRecord::Base
	has_many :tickets, dependent: :destroy
end
