class RestaurantsController < ApplicationController

layout "restaurants"

def index
end

def contact
end

def jmbriani
end

def menu
  @categories = Category.find(:all)
  @foods = Menu.find(:all, :conditions => ["category_id = 1"])
   @drinks = Menu.find(:all, :conditions => ["category_id = 2"])
   @desserts = Menu.find(:all, :conditions => ["category_id = 3"])
end

def show_menu
  @menu = Menu.find(params[:id])
  @categories = Category.find(:all)
  @foods = Menu.find(:all, :conditions => ["category_id = 1"])
  @drinks = Menu.find(:all, :conditions => ["category_id = 2"])
  @desserts = Menu.find(:all, :conditions => ["category_id = 3"])
end

def outlets
@outlets = Outlet.find(:all)
@outletdefault = Outlet.find(:first)
end

def show_outlet
  @outlets = Outlet.find(:all)
  @outlet = Outlet.find(params[:id])
  @outletdefault = Outlet.find(:first)

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

end
