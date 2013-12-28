class FeedbackController < ApplicationController

  skip_before_filter :authenticate_person!

  def index
    if request.get?
      @feedback = Feedback.new
      return
    end
    @feedback = Feedback.new(params.require(:feedback).permit(
      :person_id, :email, :subject, :message))
    if @feedback.save
      flash[:notice] = 'Thank you, feedback received!'
      return redirect_to '/'
    else
      flash[:alert] = 'Could not get your feedback just yet'
    end
  end
end
