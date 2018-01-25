class MyPollShipmentJob < Cangaroo::PollJob
  connection :cangaroo_endpoint
  path '/shipments'
  frequency 30.seconds
end
