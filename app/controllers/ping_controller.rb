class PingController < ApplicationController
  def ping
    render json: { message: 'pong' }, status: :ok
  end
end
