class Ticket < ApplicationRecord
  belongs_to :sport

  scope :book, ->{where.not(booked_at: nil)}
  scope :cancel, ->{where(booked_at: nil)}
end
