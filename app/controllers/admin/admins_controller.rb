class Admin::AdminsController < ApplicationController
  layout "layouts/admin"

  before_action :authenticate_user!
end
