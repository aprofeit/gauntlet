class Objective < ActiveRecord::Base
  has_many :todos
  has_many :people, through: :todos

  before_validation :set_position

  private

  def set_position
    self.position = Objective.count + 1
  end
end
