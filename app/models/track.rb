class Track < ActiveRecord::Base
  belongs_to :beacon
  belongs_to :receiver
end
