class TwilioController < ActionController::Base
  # after_filter :set_header 
  # skip_before_action :verify_authenticity_token 

  def sms
    description = params["Body"]
    picture = params["MediaUrl0"]
    location = params["FromZip"]
    number = params["From"]

    Observation.create!(posted_by: number, sighted_at: Time.now, description: description,pic: picture)
  end
end
