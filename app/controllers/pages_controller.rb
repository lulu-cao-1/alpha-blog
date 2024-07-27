class PagesController < ApplicationController
  def home
    redirect_to articles_path
  end
end
