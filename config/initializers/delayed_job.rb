Delayed::Worker.default_queue_name = 'cangaroo'
Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.delay_jobs = true
Delayed::Worker.logger = Logger.new(File.join(Rails.root, 'log', 'delayed_job.log'))
