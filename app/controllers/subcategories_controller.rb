class SubcategoriesController < ApplicationController
before_filter :authenticate
  # GET /subcategories
  # GET /subcategories.xml
  def index
    @subcategories = Subcategory.where(["user_id= ?", current_user.id.to_s])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subcategories }
    end
  end

  # GET /subcategories/1
  # GET /subcategories/1.xml
  def show
    @subcategory = Subcategory.find_by_id_and_user_id(params[:id], current_user.id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subcategory }
    end
  end

  # GET /subcategories/new
  # GET /subcategories/new.xml
  def new
    @subcategory = Subcategory.new
	@categories = Category.where(["user_id= ?", current_user.id.to_s])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subcategory }
    end
  end

  # GET /subcategories/1/edit
  def edit
    @subcategory = Subcategory.find(params[:id])
	@categories = Category.where(["user_id= ?", current_user.id.to_s])
  end

  # POST /subcategories
  # POST /subcategories.xml
  def create
    @subcategory = current_user.subcategory.new(params[:subcategory])
	
    respond_to do |format|
      if @subcategory.save
        format.html { redirect_to(@subcategory, :notice => 'Subcategory was successfully created.') }
        format.xml  { render :xml => @subcategory, :status => :created, :location => @subcategory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subcategory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subcategories/1
  # PUT /subcategories/1.xml
  def update
    @subcategory = Subcategory.find(params[:id])

    respond_to do |format|
      if @subcategory.update_attributes(params[:subcategory])
        format.html { redirect_to(@subcategory, :notice => 'Subcategory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subcategory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subcategories/1
  # DELETE /subcategories/1.xml
  def destroy
    @subcategory = Subcategory.find(params[:id])
    @subcategory.destroy

    respond_to do |format|
      format.html { redirect_to(subcategories_url) }
      format.xml  { head :ok }
    end
  end
end
