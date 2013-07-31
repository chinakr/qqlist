class UserController < ApplicationController
  skip_before_filter :authorize
  
  def new
  end

  def create
    username = params[:username]
    password = params[:password]
    if authenticate(username, password)
      session[:username] = username
      redirect_to qqs_path
    else
      redirect_to login_path, alert: '用户名或密码错误，登录失败。'
    end
  end

  def destroy
    session[:username] = nil
    redirect_to login_path, alert: '您已退出，感谢您的访问。'
  end

  private
    def authenticate(username, password)
      require 'net/http'
      require 'json'
      auth_uri = URI('http://u.vstudy.cn/api/login')
      secret_key = 'HelloWorld_123456'
      http = Net::HTTP.start(auth_uri.hostname, auth_uri.port)
      req = Net::HTTP::Post.new(auth_uri)
      req.set_form_data('secret_key' => secret_key, 'username' => username, 'password' => password)
      resp = http.request(req)
      json = resp.body
      authentication = JSON.parse(json)
      if authentication['status'] == 'ok'
        return true
      elsif authentication['status'] == 'error'
        return false
      end
    end
end
