class FakeController < ApplicationController
  def login
    render :text => "Placeholder for login page."
  end

  def logout
    render :text => "Placeholder for logout page."
  end

  def unauthorized
    render :text => "Placeholder for unauthorized page."
  end
end