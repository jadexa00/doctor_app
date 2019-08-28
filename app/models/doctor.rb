class Doctor < ApplicationRecord
    has_many :appointment
    has_many :patients, through: :appointment
    has_many :appointment, dependent: :destroy
  end