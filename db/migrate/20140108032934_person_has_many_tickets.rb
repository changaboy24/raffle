class PersonHasManyTickets < ActiveRecord::Migration
  def change
  	change_table :tickets do |t|
  		t.belongs_to :person
  	end

  	change_table :people do |t|
  		t.belongs_to :tickets
  	end
  end
end
