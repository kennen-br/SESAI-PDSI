require "#{Rails.root}/lib/debug.rb"

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :determine_layout

  def health
    render text: "I'm OK"
  end

  def image_upload
    file = File.join('public', 'images', params[:image].original_filename)
    tmp  = params[:image].tempfile
    FileUtils.cp tmp, file

    render json: { link: "/images/#{params[:image].original_filename}" }
  end

  def check_admin_actions
    unless current_user.admin?
      redirect_to root_path, flash: { error: 'Este usuário não possui privilégios suficientes para esta ação. Esta tentativa foi logada.' }
      debug "TODO: Logar esta tentativa || ApplicationController::check_admin_actions"
    end
  end

  def check_sesai_central_actions
    unless current_user.sesai_central?
      redirect_to root_path, flash: { error: 'Este usuário não possui privilégios suficientes para esta ação. Esta tentativa foi logada.' }
      debug "TODO: Logar esta tentativa || ApplicationController::check_admin_actions"
    end
  end

private
  def determine_layout
    current_user ? "private" : "public"
  end
end
