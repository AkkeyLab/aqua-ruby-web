class ApplicationController < ActionController::Base
  def greeting
    render html: "Aqua and Ruby"
  end
end
