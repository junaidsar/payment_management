# frozen_string_literal: true

class EventsController < ApplicationController

  def index
    if params[:eventable_id].present?
      @events = Event.where(eventable_id: params[:eventable_id]).order(:created_at)
    else
      @events = Event.order(:created_at)
    end
  end
end
