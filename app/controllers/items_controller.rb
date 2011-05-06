class ItemsController < ApplicationController
before_filter :authenticate

  # GET /items
  # GET /items.xml
  def index
    @items = Item.where(["user_id= ?", current_user.id.to_s])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end
  
  def list
  @items = Item.find()
  end
  
  def search
	#@items = Item.order(params[:sort])
  @items = Item.find_by_sql(['SELECT * FROM items WHERE name like ? AND user_id = ?', (params[:key] + '%'), current_user.id])
  end 
     
  # GET /items/1
  # GET /items/1.xml
  def show

	@item = Item.find_by_id_and_user_id(params[:id], current_user.id)
	
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new
	@subcategories = Subcategory.where(["user_id= ?", current_user.id.to_s])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
	@subcategories = Subcategory.where(["user_id= ?", current_user.id.to_s])
	
  end

  # POST /items
  # POST /items.xml
    def create
     @item  = current_user.items.new(params[:item])
	
    respond_to do |format|
       if @item.save
       format.html { redirect_to(@item, :notice => 'Item was successfully created.') }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
    end


  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to(@item, :notice => 'Item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
    end
  end
  
end
