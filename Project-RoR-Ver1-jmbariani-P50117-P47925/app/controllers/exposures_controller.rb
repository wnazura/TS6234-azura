class ExposuresController < ApplicationController

layout "admin"
  # GET /exposures
  # GET /exposures.xml
  def index
    @exposures = Exposure.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @exposures }
    end
  end

  # GET /exposures/1
  # GET /exposures/1.xml
  def show
    @exposure = Exposure.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @exposure }
    end
  end

  # GET /exposures/new
  # GET /exposures/new.xml
  def new
    @exposure = Exposure.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @exposure }
    end
  end

  # GET /exposures/1/edit
  def edit
    @exposure = Exposure.find(params[:id])
  end

  # POST /exposures
  # POST /exposures.xml
  def create
    @exposure = Exposure.new(params[:exposure])

    respond_to do |format|
      if @exposure.save
        
        if !params[:file_data].nil? #start save image
        @image = Image.new
        @image.file_data = params[:file_data]
          if @image.save #if image save.. save the image id to exposure column.
          @exposure.image_id = @image.id
          @exposure.save
          end     #end save image id in exposure column.
        end  #end save image
        
        flash[:notice] = 'Exposure was successfully created.'
        format.html { redirect_to(@exposure) }
        format.xml  { render :xml => @exposure, :status => :created, :location => @exposure }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @exposure.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /exposures/1
  # PUT /exposures/1.xml
  def update
    @exposure = Exposure.find(params[:id])

    respond_to do |format|
      if @exposure.update_attributes(params[:exposure])
        flash[:notice] = 'Exposure was successfully updated.'
        format.html { redirect_to(@exposure) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @exposure.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /exposures/1
  # DELETE /exposures/1.xml
  def destroy
    @exposure = Exposure.find(params[:id])
    @image = Image.find(:first, :conditions => ["id = ?",@exposure.image_id])
    @image.destroy unless @image.nil?
    @exposure.destroy

    respond_to do |format|
      format.html { redirect_to(exposures_url) }
      format.xml  { head :ok }
    end
  end
   def find
      puts params[:search_string]
     @exposure = Exposure.find_all_by_media_name(params[:search_string])
  end  
end
