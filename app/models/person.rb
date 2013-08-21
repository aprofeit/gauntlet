class Person < ActiveRecord::Base
  validates :first_name, :last_name, :hire_date, presence: true

  has_many :todos, dependent: :delete_all
  has_many :objectives, through: :todos
  has_many :assignments, dependent: :delete_all
  has_many :questions, through: :assignments

  before_create :build_todos

  def name
    "#{first_name} #{last_name}"
  end

  def self.assign_question(question)
    find_each do |person|
      person.questions << question
    end
  end

  private

  def build_todos
    Objective.pluck(:id).each { |objective_id| todos.build(objective_id: objective_id) }
  end
end
