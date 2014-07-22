class Station < ActiveRecord::Base
  belongs_to :place
  belongs_to :receiver

  def self.creatable?
    !(::Place.count.zero? || ::Receiver.count.zero?)
  end
end
