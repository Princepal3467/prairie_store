module Admin
  class BaseController < ApplicationController
    before_action :require_admin

    private

    def require_admin
      user = User.first

      unless user && user.admin?
        redirect_to root_path, alert: "Access denied."
      end
    end
  end
end