class Todo < ActiveRecord::Base
  belongs_to :objective
  belongs_to :person

  before_save :set_completed_at

  scope :completed, -> { where(complete: true) }

  def completed_at_in_words
    completed_at.strftime('Completed on %b %-d at %-l:%M %P') if complete?
  end

  private

  def set_completed_at
    self.completed_at = complete? ? DateTime.now : nil
  end
end
