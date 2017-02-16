class IndexController < ApplicationController
  def Welcome
    @messages = Message.all
  end
end
