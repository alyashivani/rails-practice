class Feedback < ApplicationRecord
  belongs_to :product

  has_many_attached :images

  # validate :uniqueness_of_feedback

  # def uniqueness_of_feedback
  #    existing_record = Feedback.find_by_message(message).where
  #    errors.add(:message, "Already same feedback message given by you....try different feedback") unless existing_record.blank?
  # end

end
