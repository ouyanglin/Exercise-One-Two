class PagesController < ApplicationController
  def splash
    @account = Account.new
    render :layout => false
  end

  def learn
  end

  def suggestion
  end

end
