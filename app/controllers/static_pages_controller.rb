class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end

  def template1
      render 'templates/1/index', layout: false
  end

  def template2
      render 'templates/2/index', layout: false
  end

  def template3
      render 'templates/3/index', layout: false
  end

  def template4
      render 'templates/4/index', layout: false
  end
end
