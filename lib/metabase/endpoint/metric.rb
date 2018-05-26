# frozen_string_literal: true

module Metabase
  module Endpoint
    module Metric
      #
      # @see https://github.com/metabase/metabase/blob/master/docs/api-documentation.md#get-apimetric
      def metrics(**params)
        get('/api/metric', params)
      end
    end
  end
end
