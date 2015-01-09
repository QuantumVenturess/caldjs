class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :short

  include PagesHelper
  include PhotosHelper
  include SessionsHelper
  include UsersHelper

  private

    def short
      @short = Shortly::Clients::Tinyurl
    end
end