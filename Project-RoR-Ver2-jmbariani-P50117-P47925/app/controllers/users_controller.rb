class UsersController < ApplicationController
before_filter :adminauthorized, :except => [:login, :logout]

layout "admin"

def index
  @users = User.find(:all)
end

def edit
@user = User.find(params[:id])
end

def register
@user = User.new(params[:user])
	if request.post? and @user.save
	flash[:notice] = " #{@user.name} created, thank you "
	redirect_to(:action => 'login' )
	end
end


def login
	if request.post?
	user = User.authenticate(params[:user][:name], params[:user][:password])
		if user 
		session[:user] = user
		session[:user_id] = user.id
		session[:user_name] = user.name
		session[:user_level] = user.level
		  #if user level is 1 ( 1 is admin so we redirect user to admin page)
		  if session[:user_level].to_i == 1
		    redirect_to(:controller => 'admin', :action => "index" )
	    else #else redirect to restaurants controller
	      redirect_to(:controller => 'restaurants',:action => 'index')
      end
		flash[:notice] = 'Welcome ' + session[:user_name]
		else 
		flash[:notice] = "Invalid user/password combination"
		end
	end
end


def logout
session[:user] = nil
session[:user_id] = nil
session[:user_name] = nil
session[:user_level] = nil
redirect_to(:controller => 'restaurants',:action => 'index')
flash[:notice] = 'Logout..'
end

def update
@user = User.find(params[:id])
@user.update_attributes(params[:user])
redirect_to(:action=>'index')
flash[:notice] = 'User Updated!'
end


def change_password
   @user = User.find(params[:id])
    if request.post?
     if @user.update_attributes(:password=>params[:user][:password], :password_confirmation => params[:user][:password_confirmation])   
flash[:notice]="Password Changed!"
redirect_to :action=>'edit', :id => @user.id
      end
    end
end

def delete
@user = User.find(params[:id])
@findlastadmin = User.count(:id, :conditions => ["level = 1"])
  if @findlastadmin == 1 and @user.level == 1
    redirect_to(:action => 'index')
    flash[:notice] = "Do not remove the last admin user"
  else
  @user.destroy
  redirect_to(:action => 'index')
  end
end


end
