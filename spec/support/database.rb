RSpec.configure do |config|
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean
end
