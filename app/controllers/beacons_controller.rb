class BeaconsController < MasterController

  before_action :set_beacon, only: [:show, :edit, :update, :destroy]

  # GET /beacons
  def index
    @beacons = Beacon.all
  end

  # GET /beacons/1
  def show
  end

  # GET /beacons/new
  def new
    @beacon = Beacon.new
  end

  # GET /beacons/1/edit
  def edit
  end

  # POST /beacons
  def create
    @beacon = Beacon.new(beacon_params)

    if @beacon.save
      redirect_to @beacon, notice: 'Beacon was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /beacons/1
  def update
    if @beacon.update(beacon_params)
      redirect_to @beacon, notice: 'Beacon was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /beacons/1
  def destroy
    @beacon.destroy
    redirect_to beacons_url, notice: 'Beacon was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beacon
      @beacon = Beacon.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def beacon_params
      params.require(:beacon).permit(:uuid, :major, :minor, :color, :name)
    end
end
