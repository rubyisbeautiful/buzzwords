require 'resque'
require 'resque/server'
require 'resque-scheduler'

resque_config = YAML.load_file(Rails.root.join('config/resque.yml'))

Resque.redis = resque_config[Rails.env]
Resque::Scheduler.dynamic = true
Resque.schedule = YAML.load_file(Rails.root.join('config/resque_schedule.yml'))