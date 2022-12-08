# frozen_string_literal: true

# Controller for upcoming Payments
class PaymentsController < ApplicationController

  def index
    @projects = Project.where('payment_date >= ?', Date.current).order(payment_date: :asc)
  end
end
