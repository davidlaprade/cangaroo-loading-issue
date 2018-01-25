class ShipmentsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: { shipments: [{id: '123456', status: 'shipped'}] }
  end

end
