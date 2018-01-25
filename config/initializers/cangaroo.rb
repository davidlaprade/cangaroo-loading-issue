Dir[Rails.root.join("app/jobs/**/*.rb")].each {|f| require f}
Rails.configuration.cangaroo.poll_jobs = [
  MyPollShipmentJob
]
