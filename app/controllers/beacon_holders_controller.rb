class BeaconHoldersController < ApplicationController

  before_action :set_beacon_holder, only: [:show, :edit, :update, :destroy]
  before_action :set_beacons,       only: [:new, :edit, :update]
  before_action :set_patients,      only: [:new, :edit, :update]

  # GET /beacon_holders
  def index
    @beacon_holders = BeaconHolder.all
  end

  # GET /beacon_holders/1
  def show
  end

  # GET /beacon_holders/new
  def new
    @beacon_holder = BeaconHolder.new
  end

  # GET /beacon_holders/1/edit
  def edit
  end

  # POST /beacon_holders
  def create
    @beacon_holder = BeaconHolder.new(beacon_holder_params)

    if @beacon_holder.save
      redirect_to @beacon_holder, notice: 'Beacon holder was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /beacon_holders/1
  def update
    if @beacon_holder.update(beacon_holder_params)
      redirect_to @beacon_holder, notice: 'Beacon holder was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /beacon_holders/1
  def destroy
    @beacon_holder.destroy
    redirect_to beacon_holders_url, notice: 'Beacon holder was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_beacon_holder
    @beacon_holder = BeaconHolder.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def beacon_holder_params
    params.require(:beacon_holder).permit(:beacon_id, :patient_id)
  end

  def set_beacons
    @beacons = Beacon.all
  end

  def set_patients
    @patients = Patient.all
  end

end
