require 'json'
require 'webrick'

class Session
  def initialize(req)
    request_cookies = req.cookies
    @cookie_value = {}
    request_cookies.each do |cookie|
      next unless cookie.name == '_rails_lite_app'
      @cookie_value = JSON.parse(cookie.value)
    end

  end

  def [](key)
    @cookie_value[key]
  end

  def []=(key, val)
    @cookie_value[key] = val
  end

  def store_session(res)
    value = @cookie_value.to_json
    name = '_rails_lite_app'
    @new_cookie = WEBrick::Cookie.new(name, value)
    res.cookies << @new_cookie
  end
end
