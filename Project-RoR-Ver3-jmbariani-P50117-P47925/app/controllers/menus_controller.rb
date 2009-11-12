class MenusController < ApplicationController
before_filter :find_menu, :only => [:rate]

layout "admin"

def rate
    @menu.rate(params[:stars], current_user, params[:dimension])
    id = "ajaxful-rating-#{!params[:dimension].blank? ? "#{params[:dimension]}-" : ''}menu-#{@menu.id}"
    render :update do |page|
      page.replace_html id, ratings_for(@menu, :wrap => false, :dimension => params[:dimension], :small_stars => params[:small_stars])
      page.visual_effect :highlight, id
    end
  end

  # GET /menus
  # GET /menus.xml
  def index
    @menus = Menu.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menus }
    end
  end

  # GET /menus/1
  # GET /menus/1.xml
  def show
    @menu = Menu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menu }
    end
  end

  # GET /menus/new
  # GET /menus/new.xml
  def new
    @menu = Menu.new
    @categories = Category.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu }
    end
  end

  # GET /menus/1/edit
  def edit
    @menu = Menu.find(params[:id])
    @categories = Category.find(:all)
  end

  # POST /menus
  # POST /menus.xml
  def create
    @menu = Menu.new(params[:menu])
    @categories = Category.find(:all)
    respond_to do |format|
      if @menu.save
        
        if !params[:file_data].nil? #start save image
        @image = Image.new
        @image.file_data = params[:file_data]
          if @image.save #if image save.. save the image id to menu column.
          @menu.image_id = @image.id
          @menu.save
          end     #end save image id in menu column.
        end  #end save image 
        
        flash[:notice] = 'Menu was successfully created.'
        format.html { redirect_to(@menu) }
        format.xml  { render :xml => @menu, :status => :created, :location => @menu }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @menu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /menus/1
  # PUT /menus/1.xml
  def update
    @menu = Menu.find(params[:id])

    respond_to do |format|
      if @menu.update_attributes(params[:menu])
        flash[:notice] = 'Menu was successfully updated.'
        format.html { redirect_to(@menu) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.xml
  def destroy
    @menu = Menu.find(params[:id])
    @image = Image.find(:first, :conditions => ["id = ?",@menu.image_id])
    @image.destroy unless @image.nil?
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to(menus_url) }
      format.xml  { head :ok }
    end
  end
end

private
  
  def find_menu
    @menu = Menu.find(params[:id])
  end
