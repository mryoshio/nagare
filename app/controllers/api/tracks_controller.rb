class Api::TracksController < ApplicationController
  # Record actual tracking of patients
  # @param [String] loc: receiver identifier
  # @param [File]   file: includes MAC addresses of beacons
  def record
    unless params[:loc] || params[:file]
      logger.error "Not enough parameters"
      logger.error "`file` not exists" unless params[:file]
      logger.error "`loc` not exists" unless params[:loc]
      render json: { status: :error }
      return
    end

    r = Receiver.where(name: params[:loc]).first
    unless r
      logger.error "Receiver not found: #{params[:loc]}"
      render json: { status: :error }
      return
    end

    Track.transaction do
      mac_addresses.each do |mac|
        b = Beacon.where(mac_address: mac).first
        unless b
          logger.error "Beacon not found: #{mac}"
          next
        end

        Track.create!(
          beacon_id: b.id,
          receiver_id: r.id,
          patient_name: b.patients.first.name,
          place_name: r.places.first.name)
      end
    end

    render json: { status: :success }
  end

  private

  def mac_addresses
    a = []
    params[:file].read.each_line { |l| a.push l.chomp }
    a
  end
end
