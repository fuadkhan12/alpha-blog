class PagesController < ApplicationController
  before_action :redirect_user_signed_in

  def home
  end

  def about
  end

  private
    def redirect_user_signed_in
      redirect_to articles_path if user_signed_in?
    end
end
