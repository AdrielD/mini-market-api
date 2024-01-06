require 'factory_bot'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec::Matchers.define_negated_matcher :not_change, :change
