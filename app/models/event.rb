# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :eventable, polymorphic: true

  class Transition < OpenStruct
    KEYS = [:field, :old_value, :new_value]

    include ActiveModel::Validations

    validates :field, exclusion: { in: [nil] }
  end

  validates :name, presence: true
  validate :validate_transition

  before_save :slice_transition

  private


  def validate_transition
    transition = Transition.new(self.transition)
    unless transition.valid?
      errors.add(:transition, "Invalid transition: #{transition.errors.full_messages.join('. ')}.")
    end
  end

  def slice_transition
    self.transition = transition.slice(*Transition::KEYS.map(&:to_s))
  end
end
