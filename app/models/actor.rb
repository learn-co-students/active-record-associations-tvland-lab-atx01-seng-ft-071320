

class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    roles = []
    Character.all.each do |character|
      if character.actor == self
        roles << "#{character.name} - #{character.show.name}"
      end
    end
    roles
  end

end
