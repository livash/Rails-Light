require "webrick"

server = WEBrick::HTTPServer.new :Port => 8080 # , :DocumentRoot => root

trap ("INT") { server.shutdown }

server.start
#
# http_request = WEBrick::HTTPRequest.new
# http_response = WEBrick::HTTPResponce.new

http_response.content_type = "text/text"
http_response.body = http_request.path

server.mount_proc('/') do |request, response|
  response.content_type = 'text/text'
  response.body = request.path
end



#log files
# log_file = File.open "/var/log/webrick.log", "a+"
# log = WEBrick::Log.new log_file