class Admin::AdminsController < ApplicationController
  layout "layouts/admin"

  before_action :authenticate_user!
  authorize_resource
end
