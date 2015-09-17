threads = []

threads << Thread.new do
  system('rspec spec/models/photo_spec.rb')
end
threads << Thread.new do
  system('rspec spec/models/photo_spec.rb')
end

threads.each(&:join)
