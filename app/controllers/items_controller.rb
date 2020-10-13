class ItemsController < ApplicationController
  before_action :authenticate_user!,except: :index
  def new
  end

  def index
  end
end
