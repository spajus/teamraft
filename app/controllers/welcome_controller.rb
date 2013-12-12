class WelcomeController < ApplicationController

  skip_before_filter :authenticate_person!

  def index
    return render text: 'soon' unless params[:preview]
    return redirect_to company_path if person_signed_in?
    render layout: 'intro'
  end
end
