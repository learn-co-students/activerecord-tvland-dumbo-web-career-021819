class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    return "#{first_name} #{last_name}"
  end

  def list_roles
    self.shows.collect do |shows|
      shows.characters.collect do |characters|
        return "#{characters.name} - #{shows.name}"
      end
    end
  end

end
