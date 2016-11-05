class WelcomeController < ApplicationController
  include TwitterModule
  include NounprojectModule

  def index
    @icon = get_icon
  end
end
