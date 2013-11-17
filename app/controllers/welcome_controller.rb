class WelcomeController < ApplicationController
  def index
    return redirect_to company_path if person_signed_in?
    render layout: 'intro'
  end
end
