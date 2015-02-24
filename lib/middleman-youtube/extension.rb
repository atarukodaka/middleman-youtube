module Middleman
  module Youtube
    class Extension < ::Middleman::Extension
      option :width, 560, 'width of iframe'

      def initialize(app, options_hash = {}, &block)
        super
      end
    end
  end
end
