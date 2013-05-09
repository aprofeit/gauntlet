class Todo < ActiveRecord::Base
  belongs_to :objective
  belongs_to :person
end
