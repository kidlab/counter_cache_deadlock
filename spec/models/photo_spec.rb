RSpec.describe Photo do

  before :all do
    @vehicle = Vehicle.create!
  end

  it 'race condition counter_cache' do
    threads = []

     # note: 10.times do ... would work without deadlock
    threads << Thread.new do
      Photo.create(vehicle: @vehicle, url: 'url')
      ActiveRecord::Base.connection.close
    end
    threads << Thread.new do
      Photo.create(vehicle: @vehicle, url: 'url')
      ActiveRecord::Base.connection.close
    end
    threads << Thread.new do
      Photo.create(vehicle: @vehicle, url: 'url')
      ActiveRecord::Base.connection.close
    end
    threads << Thread.new do
      Photo.create(vehicle: @vehicle, url: 'url')
      ActiveRecord::Base.connection.close
    end
    threads << Thread.new do
      Photo.create(vehicle: @vehicle, url: 'url')
      ActiveRecord::Base.connection.close
    end
    threads << Thread.new do
      Photo.create(vehicle: @vehicle, url: 'url')
      ActiveRecord::Base.connection.close
    end
    threads << Thread.new do
      Photo.create(vehicle: @vehicle, url: 'url')
      ActiveRecord::Base.connection.close
    end
    threads << Thread.new do
      Photo.create(vehicle: @vehicle, url: 'url')
      ActiveRecord::Base.connection.close
    end
    threads << Thread.new do
      Photo.create(vehicle: @vehicle, url: 'url')
      ActiveRecord::Base.connection.close
    end
    threads << Thread.new do
      Photo.create(vehicle: @vehicle, url: 'url')
      ActiveRecord::Base.connection.close
    end

    threads.each(&:join)
  end

  after :all do
    expect(@vehicle.photos.count).to eq 10
    expect(@vehicle.reload.photos_count).to eq 10
  end

end
