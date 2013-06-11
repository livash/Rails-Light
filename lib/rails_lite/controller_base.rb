require 'erb'
require_relative 'params'
require_relative 'session'
require 'active_support/core_ext'
require 'json'

class ControllerBase
  attr_reader :params

  def initialize(req, res, route_params = [])
    @req = req
    @res = res
    @params = route_params
    @already_rendered = false
    @response_built = false
    # @session = nil
  end

  def session
    @session ||= Session.new(@req)
  end

  def already_rendered?
    @already_rendered
  end

  def redirect_to(url)
    @res.status = "302"
    @res['location'] = url
    @session.store_session(@res)
    @response_built = true
  end

  def render_content(content, body_type)
    @res.content_type = body_type
    @res.body = content
    @session.store_session(@res)
    @already_rendered = true
  end

  def render(template_name)
    # @session.store_session(@res)
    controller_name = self.class.name.underscore# .split('_').first.downcase
    content_string = File.read("views/#{controller_name}/#{template_name}.html.erb")
    content = ERB.new(content_string).result(binding)
    render_content(content, "text/html")
  end

  def invoke_action(name)
  end
end
