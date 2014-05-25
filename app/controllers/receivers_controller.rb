class ReceiversController < ApplicationController
  before_action :set_receiver, only: [:show, :edit, :update, :destroy]

  # GET /receivers
  def index
    @receivers = Receiver.all
  end

  # GET /receivers/1
  def show
  end

  # GET /receivers/new
  def new
    @receiver = Receiver.new
  end

  # GET /receivers/1/edit
  def edit
  end

  # POST /receivers
  def create
    @receiver = Receiver.new(receiver_params)

    if @receiver.save
      redirect_to @receiver, notice: 'Receiver was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /receivers/1
  def update
    if @receiver.update(receiver_params)
      redirect_to @receiver, notice: 'Receiver was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /receivers/1
  def destroy
    @receiver.destroy
    redirect_to receivers_url, notice: 'Receiver was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receiver
      @receiver = Receiver.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def receiver_params
      params.require(:receiver).permit(:name, :description)
    end
end
