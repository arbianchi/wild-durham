class TwilioController < ActionController::Base 
  # after_filter :set_header 
  # skip_before_action :verify_authenticity_token 
  # skip_after_action :verify_authorized

  # skip_before_filter  :verify_authenticity_token

  def sms
    description = params["Body"]
    picture = params["MediaUrl0"]
    location = params["FromZip"]
    number = params["From"]

    user = User.find_by(phone: number)

    if user

      Observation.create!(created_by: user.id, sighted_at: Time.now, description: description,pic: picture, phone: number)
    end
  end
end
