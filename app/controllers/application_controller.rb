class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :expire_hsts
  # include SessionsHelper
  

  def create_newsletter
    news_letter = Newsletter.new(newsletter_params)
    if news_letter.save
      flash[:notice] = "Teşekkürler, e-posta adresiniz bize ulaştı!"
    else
      flash[:newsletter_alert] = "E-posta adresiniz kaydedilemedi! Tekrar deneyiniz."
    end
    redirect_to :back
  end

  private

    # Confirms a logged-in user.
    # def logged_in_user
    #   unless logged_in?
    #     store_location
    #     flash[:danger] = "Please log in."
    #     redirect_to login_url
    #   end
    # end

    def expire_hsts
      response.headers["Strict-Transport-Security"] = 'max-age=0'
    end

    def newsletter_params
      params.require(:newsletter).permit(:email)
    end
end
