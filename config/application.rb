# frozen_string_literal: true

require 'active_record'
require 'sqlite3'
require 'yaml'

# This is some boilerplate code to read the config/database.yml file
# And connect to the database
config_path = File.join(__dir__, 'database.yml')
ActiveRecord::Base.configurations = YAML.load_file(config_path)
ActiveRecord::Base.establish_connection(:development)

# Set a logger so that you can view the SQL actually performed by ActiveRecord
logger = Logger.new($stdout)
logger.formatter = proc do |_severity, _datetime, _progname, msg|
  "#{msg}\n"
end
ActiveRecord::Base.logger = logger

# Load all models!
Dir["#{__dir__}/../models/*.rb"].each { |file| require file }
