# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.before_record do |i|
    i.response.body.force_encoding("UTF-8")

    if i.response.headers["Content-Type"][0].include?("application/json") && i.response.body.size > 0
      i.response.body = JSON.pretty_generate(JSON.parse(i.response.body))
    end
  end
end
