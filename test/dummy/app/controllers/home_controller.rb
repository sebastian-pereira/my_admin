class HomeController < ApplicationController
  def index
    @obj = Object.const_get('ActiveRecord').const_get('Base')
  end
end
