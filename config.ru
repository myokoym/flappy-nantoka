require "yeah/web/server"

# https://github.com/opal/opal/blob/master/lib/opal/sprockets/server.rb#L144
module Opal
  class Server
    class Index
      SUB_URL = "/flappy-nantoka"

      def javascript_include_tag source
        if @server.debug
          assets = @server.sprockets[source].to_a
          raise "Cannot find asset: #{source}" if assets.empty?
          scripts = assets.map do |a|
            %Q{<script src="#{SUB_URL}/assets/#{ a.logical_path }?body=1"></script>}
          end
          scripts.join "\n"
        else
          "<script src=\"#{SUB_URL}/assets/#{source}.js\"></script>"
        end
      end
    end
  end
end

#run Yeah::Web::Server.const_get("Application").new
run Rack::URLMap.new("/flappy-nantoka" => Yeah::Web::Server.const_get("Application").new)
