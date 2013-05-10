class Person < ActiveRecord::Base
  has_many :todos
  has_many :objectives, through: :todos

  def name
    "#{first_name} #{last_name}"
  end
end
