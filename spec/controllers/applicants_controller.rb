# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicantsController, type: :controller do

  describe "POST update" do
    let(:fund) do
      Fund.create!(
        title: 'Fund',
        total: 10_000
      )
    end

    let(:project) do
      Project.create!(
        payment_date: Date.current + 1.month,
        title: 'Title',
        fund: fund
      )
    end

    let(:applicant) do
      Applicant.create!(
        name: 'Applicant 1',
        overview: 'Overview',
        funding: 500,
        project: project,
        status: 0
      )
    end

    context "#events_comments" do

      it "should create event for status comments when sended in params" do
        expect {
          patch :update, params: { id: applicant.id, applicant: {status_comment: "deleted", status: "approved"}, format: :json }
        }.to change(applicant.events, :count).by(1)
        event = applicant.events.last
        # Status changed
        expect(event.transition["old_value"]).to eq("applied")
        expect(event.transition["new_value"]).to eq("approved")

        # the comment provided when status changed
        expect(event.metadata["reason"]).to eq("deleted")
      end

      it "should not create event as only comment passed but status not changed" do
        expect {
          patch :update, params: { id: applicant.id, applicant: {status_comment: "deleted"}, format: :json }
        }.to change(applicant.events, :count).by(0)
      end
    end
  end
end
