#require 'murmurhash3'
require 'uri'

class HomepageController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @elements = Element.order(created_at: :desc).limit(20)
    @hostname = request.host || "http://127.0.0.1:3000/"
    @port = request.port
  end

  def create
    unless params[:url] =~ URI::regexp
      redirect_to homepage_index_path, flash: {message: "cette url est invalide: #{params[:url]}"}
      return
    end
    if Element.find_by(url: params[:url])
      Element.increase_popularity(params[:url])
      redirect_to homepage_index_path, flash: {message: "cette url est deja racourcit: #{params[:url]}"}
      return
    end
    @element = Element.new(url: params[:url], slug: Element.next_slug)
    unless @element.save
      Element.increase_popularity(params[:url])
      redirect_to homepage_index_path, flash: {message: "cette url est deja racourcit: #{params[:url]}"}
    else
      redirect_to homepage_index_path
    end
  end

  def show
    @element = Element.find_by(slug: params[:id])
    unless @element.nil?
      Element.increase_clic(@element.url)
      redirect_to @element.url
    else
      redirect_to homepage_index_path, flash: {message: "identifiant invalide: #{params[:id]}"}
    end
  end

end