class Objective < ActiveRecord::Base
  validates :title, presence: true

  has_many :todos, dependent: :delete_all
  has_many :people, through: :todos

  before_validation :set_position
  before_create :build_todos

  private

  def set_position
    self.position = Objective.count + 1
  end

  def build_todos
    Person.pluck(:id).each { |person_id| todos.build(person_id: person_id) }
  end
end
