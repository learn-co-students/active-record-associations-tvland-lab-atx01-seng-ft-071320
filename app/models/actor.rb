class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters 

  def full_name  
    f_name = self.first_name
    l_name = self.last_name
    full = f_name + " " + l_name
    full 
  end 

  def list_roles
    characters.map do |c|
        "#{c.name} - #{c.show.name}"
    end 
  end 
end