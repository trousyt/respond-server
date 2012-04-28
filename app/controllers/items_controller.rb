class ItemsController < ApplicationController
  # Only respond to requests that ask for JSON in the HTTP-Accept header
  respond_to :json
  
  # GET items
  def index
    @entities = Item.all
    #respond_with(@entity)
  end
  
  def for_request
    @entity = Item.find_by_request_id(params[:request_id])
  end
  
  # GET items/1
  def show
    @entity = Item.find(params[:id])
  end
  
  # PUT items/1
  def update
    @entity = Item.find(params[:id])
    @entity.update_attributes(params)
  end

  # POST items
  def create
    @entity = Item.create(params)
    request_path(@entity)
  end
  
  # DELETE items/1
  def delete
    Request.destroy(params[:id])
  end
  
end
