class AdminController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @elements = Element.order(created_at: :desc)
    @hostname = request.host || "http://127.0.0.1:3000/"
    @port = request.port
  end

  def destroy
    @element = Element.find_by(slug: params[:id])
    unless @element.nil?
      @element.destroy
      redirect_to "admin#index"
    else
      redirect_to "admin#index", flash: {message: "cette identifiant n'existe pas: #{params[:id]}"}
    end
  end

end
