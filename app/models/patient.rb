class Patient < ApplicationRecord
    has_many :appointment
    has_many :doctors, through: :appointment
    has_many :appointment, dependent: :destroy


    def full_name
      "#{self.first_name} #{self.last_name}"
    end
  end