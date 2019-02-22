class HomepageController < ApplicationController
  def index
    redirect_to cocktails_path
  end
end
