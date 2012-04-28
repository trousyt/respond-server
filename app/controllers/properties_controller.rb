class PropertiesController < ApplicationController
  # Only respond to requests that ask for JSON in the HTTP-Accept header
  respond_to :json
  
  # GET properties
  def index
    @entities = Property.all
  end
  
  # GET properties/1
  def show
    @entity = Property.find(params[:id])
  end
  
  # PUT properties/1
  def update
    @entity = Property.find(params[:id])
    @entity.update_attributes(params)
  end

  # POST properties
  def create
    @entity = Property.create(params)
    property_path(@entity)
  end
  
  # DELETE properties/1
  def delete
    Property.destroy(params[:id])
  end

end
