### About

This app attempts to minimally reproduce a file reloading error with the [Cangaroo source code](https://github.com/nebulab/cangaroo).

The error prevents PollJob classes from updating poll timestamps and (more
importantly) from processing response payloads. In the logs, the error
looks like this:

```
Job ActiveJob::QueueAdapters::DelayedJobAdapter::JobWrapper (id=5) (queue=cangaroo)
FAILED (1 prior attempts) with ArgumentError: A copy of Cangaroo::BaseJob has
been removed from the module tree but is still active!
```

### To Reproduce

```shell
bundle
bundle exec rake db:create db:migrate db:seed
```

Open 2 separate shells:

```shell
# in the first shell
bundle exec rails s -p 3100 # start the rails server

# in the second shell
bundle exec rake cangaroo:poll # add a poll job to the queue
bin/delayed_job start # start a worker process
tail -f log/delayed_job.log # watch what the worker does
```

Once the `MyPollShipmentJob` runs, you will see the following error in the
worker log file:

```
Job ActiveJob::QueueAdapters::DelayedJobAdapter::JobWrapper (id=5) (queue=cangaroo)
FAILED (1 prior attempts) with ArgumentError: A copy of Cangaroo::BaseJob has
been removed from the module tree but is still active!
```

As a result of this error, the poll timestamp for this connection is not
updated, nor is `PerformFlows` triggered. Polling, in other words, is broken.
