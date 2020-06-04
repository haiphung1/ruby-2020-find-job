class Admin::AdminsController < ApplicationController
  layout "layouts/admin"

  before_action :logged_in_user
end
