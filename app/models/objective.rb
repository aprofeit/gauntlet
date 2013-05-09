class Objective < ActiveRecord::Base
  has_many :todos
  has_many :people, through: :todos
end
