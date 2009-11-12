class RestaurantsController < ApplicationController


layout "restaurants"



def index
end

def contact
end

def jmbriani
end

def menu
  #@menu = Menu.find(1)
  @menu = Menu.find(:first)
  @categories = Category.find(:all)
  @foods = Menu.find(:all, :conditions => ["category_id = 1"])
   @drinks = Menu.find(:all, :conditions => ["category_id = 2"])
   @desserts = Menu.find(:all, :conditions => ["category_id = 3"])
   @ratecount = Rating.count(:id, :conditions =>["menu_id = ?",@menu.id])
     if @ratecount == 0
       @menurating = 0
     else
       @menurating = Rating.sum(:rating, :conditions =>["menu_id = ?",@menu.id])
       @menurating = @menurating.to_f/@ratecount.to_f
     end
end

def show_menu
  @menu = Menu.find(params[:id])
  @categories = Category.find(:all)
  @foods = Menu.find(:all, :conditions => ["category_id = 1"])
  @drinks = Menu.find(:all, :conditions => ["category_id = 2"])
  @desserts = Menu.find(:all, :conditions => ["category_id = 3"])
#rating
@ratecount = Rating.count(:id, :conditions =>["menu_id = ?",@menu.id])
  if @ratecount == 0
    @menurating = 0
  else
    @menurating = Rating.sum(:rating, :conditions =>["menu_id = ?",@menu.id])
    @menurating = @menurating.to_f/@ratecount.to_f
  end
end

def exposure
@exposures = Exposure.find(:all)
end

def show_exposure
  if params[:id].nil?
    @exposure = Exposure.find(:first)
    params[:id] = @exposure.id
  end
@exposure = Exposure.find(params[:id])
render(:layout => false)
end

def search
@menus = Menu.find(:all,:conditions => ["title like ?", "%#{params[:query]}%"])
@outlets = Outlet.find(:all,:conditions => ["title like ?", "%#{params[:query]}%"])
end

def rate
  @menu  = Menu.find(params[:id])
  @rating = Rating.new
  @rating.menu_id = @menu.id
  @rating.rating = params[:rating]
  @rating.save
  @menurating = Rating.sum(:rating, :conditions =>["menu_id = ?",@menu.id])
  @ratecount = Rating.count(:id, :conditions =>["menu_id = ?",@menu.id])
  @menurating = @menurating.to_f/@ratecount.to_f
end

end