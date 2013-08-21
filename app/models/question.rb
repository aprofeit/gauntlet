class Question < ActiveRecord::Base
  after_create :assign_to_people

  has_many :assignments, dependent: :delete_all
  has_many :people, through: :assignments

  validates :body, :position, presence: true

  private

  def assign_to_people
    Person.assign_question(self)
  end
end
