class LocationsController < ApplicationController
  def index
    @tracks = Track.all.order("created_at desc")
  end
end
