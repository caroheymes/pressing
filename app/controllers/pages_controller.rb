class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :enquete]

  def home
  end
  def enquete
  end
  
end
