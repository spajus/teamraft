class WelcomeController < ApplicationController

  skip_before_filter :authenticate_person!

  def index
    unless person_signed_in?
      return render text: 'soon' unless params[:preview] || Rails.env.development?
    end
    return redirect_to company_path if person_signed_in?
    render layout: 'intro'
  end
end
