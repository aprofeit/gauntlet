class Person < ActiveRecord::Base
  has_many :todos
  has_many :objectives, through: :todos
end
