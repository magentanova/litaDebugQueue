Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = "Litabot"

  # Add HTTP port configuration for deployment to Heroku.
  config.http.port = ENV["PORT"]

  # The locale code for the language to use.
  # config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  # An array of user IDs that are considered administrators. These users
  # have the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  config.robot.admins = ["U06BUGE74"]

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  config.robot.adapter = :slack

  ## Example: Set options for the chosen adapter.
  config.adapters.slack.token = ENV["SLACK_TOKEN"]
  # config.adapter.username = "myname"
  # config.adapter.password = "secret"

  ## Production settings
  config.redis[:url] = ENV["REDISTOGO_URL"]

  ## Development settings
  # config.redis.host = "127.0.0.1"
  # config.redis.port = 6379

  ## Handler Configuration
  ## Don't forget that tweaks to this handler will require corresponding
  ## updates in Slack!
  # Have an admin message ironbot with `auth add/remove person assistants`
  # when this is updated between semesters.
  config.handlers.debug_queue.classrooms = {
    "thisjustin"      => "hou_may2016_front_end",
    "jmatos"          => "hou_may2016_front_end",
    "travis.h"        => "hou_may2016_front_end",
    "travis.h"        => "hou_may2016_rails",
    "jwo"             => "hou_may2016_rails",
    "azamsharp"       => "hou_june2016_ios",
  }

  config.handlers.debug_api.passphrase = "treasurechest"

  config.handlers.debug_queue.schedule = {
    "Mon"       => (0...24),
    "Tue"       => (0...24),
    "Wed"       => (0...24),
    "Thu"       => (0...24),
    "Fri"       => (0...24),
    "Sat"       => [],
    "Sun"       => []
  }

  config.handlers.keepalive.url = "https://litaqueue.herokuapp.com/lita/info"
end
