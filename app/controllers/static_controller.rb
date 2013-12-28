class StaticController < ApplicationController

  skip_before_filter :authenticate_person!

  def privacy
  end

  def terms
  end
end
