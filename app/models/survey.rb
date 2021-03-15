class Survey < ApplicationRecord
  belongs_to :room

  has_many :alternatives, dependent: :destroy
  accepts_nested_attributes_for :alternatives
end
