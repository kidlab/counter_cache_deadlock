class Photo < ActiveRecord::Base

  belongs_to :vehicle, counter_cache: true, touch: true

end
