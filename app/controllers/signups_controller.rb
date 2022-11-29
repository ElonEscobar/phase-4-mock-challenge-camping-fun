class SignupsController < ApplicationController

    def create
        new_signup = Signup.create!(new_signup_params)
        render json: new_signup.activity, status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    private

    def new_signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
