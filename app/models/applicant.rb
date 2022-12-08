# frozen_string_literal: true

# Applications to Projects
class Applicant < ApplicationRecord
  attribute :status, :integer, default: 0

  EVENT_STATUS_CHANGE = 'Applicant: Status Change'

  validates :name, presence: true, uniqueness: true
  validates :overview, presence: true
  validates :funding, numericality: true, presence: true

  belongs_to :project
  has_many :events, as: :eventable, dependent: :destroy

  attr_accessor :metadata

  enum status: { applied: 0, initial_review: 1, more_information_required: 2, declined: 3, approved: 4 }

  after_save :save_status_event!, if: :saved_change_to_status?

  def save_status_event!
    events.create(
      name: EVENT_STATUS_CHANGE,
      transition: {
        old_value: previous_changes["status"].first,
        new_value: previous_changes["status"].last,
        field: 'status'
      },
      metadata: {
        reason: metadata.try(:[], :status_comment)
      }
    )
  end
end
