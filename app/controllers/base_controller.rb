class BaseController < ApplicationController
  skip_before_action :authenticate_request
  def index
    url = 'http://localhost:3000/'
    resources = {
      categories: "#{url}categories",
      lists: "#{url}lists",
      authenticate: "#{url}authenticate",
      register: "#{url}register"
    }
    render json: resources
  end
end
