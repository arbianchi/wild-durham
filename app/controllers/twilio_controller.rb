class TwilioController < ActionController::Base
  # after_filter :set_header 
  # skip_before_action :verify_authenticity_token 

  def sms
    description = params["Body"]
    picture = params["MediaUrl0"]
    location = params["FromZip"]
  binding.pry  
  end
end
