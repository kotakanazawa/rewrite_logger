# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
  end
end
