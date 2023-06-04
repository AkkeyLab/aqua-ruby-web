class ApplicationController < ActionController::Base
  include SessionsHelper

  def greeting
    render html: "Aqua and Ruby"
  end
end
