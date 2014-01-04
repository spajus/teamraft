class WelcomeController < ApplicationController

  skip_before_filter :authenticate_person!

  def index
    return redirect_to company_path if person_signed_in?
    if request.post?
      email = params[:contact_email]
      if email.present?
        ContactEmail.create(email: email)
        flash.now[:notice] = "Thank you, we'll let you know when it's open"
      else
        flash.now[:alert] = "Please provide your email"
      end
    end
    render layout: 'intro-pre'
  end

  def index_beta
    return redirect_to company_path if person_signed_in?
    render layout: 'intro'
  end
end
