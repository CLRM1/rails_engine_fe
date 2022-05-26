class MerchantsController < ApplicationController

  def index
    connection = Faraday.new(url: "http://localhost:3000")
    response = connection.get("api/v1/merchants")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    @merchants = parsed_response[:data]
  end

  def show
    connection = Faraday.new(url: "http://localhost:3000")
    response = connection.get("api/v1/merchants/#{params[:id]}")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    @merchant = parsed_response[:data]
    items_response = connection.get("api/v1/merchants/#{params[:id]}/items")
    parsed_items = JSON.parse(items_response.body, symbolize_names: true)
    @items = parsed_items[:data]
  end

  private
    def merchant_params
      params.require(:merchant).permit(:attributes, :name)
    end
end
