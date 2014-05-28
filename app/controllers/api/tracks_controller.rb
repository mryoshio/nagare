class Api::TracksController < ApplicationController

  def record
    beacon = params[:beacon_uuid]
    receiver = params[:receiver_name]

    unless beacon && receiver
      logger.error "Not enough parameters"
      logger.error "beacon_uuid: #{beacon}"
      logger.error "receiver: #{receiver}"
      render json: { status: :error }
      return
    end

    v = "#{beacon}:#{receiver}"
    ::REDIS.set(Time.now.to_i, v)

    render json: { status: :success }
  end

end
