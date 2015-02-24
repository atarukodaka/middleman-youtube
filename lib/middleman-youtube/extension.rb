module Middleman
  module Youtube
    class Extension < ::Middleman::Extension
      option :width, 560, 'width of iframe'

      def initialize(app, options_hash = {}, &block)
        super
        extension = self
        app.before_render do |body|
          extension.convert(body)
        end
      end

      def convert(body)
        regex = %r{https://www.youtube.com/watch\?v=(.*?)(\s+)?$}
        body.gsub(regex) { iframe($1) }
      end

      def iframe(path)
        '<iframe width="560" height="315" src="https://www.youtube.com/embed/' + path + '" frameborder="0" allowfullscreen="true"></iframe>'
      end
    end
  end
end
