require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.platform = 'windows'
  config.log_level = :error
  # Prohibit using the should syntax
  config.expect_with :rspec { |spec| spec.syntax = :expect }

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end

at_exit { ChefSpec::Coverage.report! }
