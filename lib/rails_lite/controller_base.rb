require 'erb'
require_relative 'params'
require_relative 'session'

class ControllerBase
  attr_reader :params

  def initialize(req, res, route_params = [])
    @req = req
    @res = res
    @params = route_params
    @already_rendered = false
    @response_built = false
  end

  def session
  end

  def already_rendered?
  end

  def redirect_to(url)
    @res.status = "302"
    @res['location'] = url
    @response_built = true
  end

  def render_content(content, body_type)
    @res.content_type = 'text/text'
    @res.body = content
    @already_rendered = true
  end

  def render(template_name)
  end

  def invoke_action(name)
  end
end
