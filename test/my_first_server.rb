require "webrick"

root = File.expand_path '-/public_html'
server = WEBrivk::HTTPServer.new :Port => 8080, :DocumentRoot => root

