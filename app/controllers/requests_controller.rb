class RequestsController < ApplicationController
  # Only respond to requests that ask for JSON in the HTTP-Accept header
  respond_to :json
  
  # GET requests
  def index
    @entity = Request.all
    @item_count = @entity.length
  end
  
  def for_property
    @entity = Request.find_by_property_id(params[:property_id])
  end
  
  # GET requests/1
  def show
    @entity = Request.find(params[:id])
  end
  
  # PUT requests/1
  def update
    @entity = Request.find(params[:id])
    @entity.update_attributes(params)
  end
  
  # POST requests
  def create
    
    if request.body
      
      # Parse the body of the request out of the newly created hash.
      parsed_data = JSON.parse(request.body.read)
      base_hash = parsed_data['request']
      
      # And save the request.
      Request.save_hash base_hash, 'http://localhost:3000/'
      
    else
      File.open("/Users/tparkinson/Development/RequestPost.txt", "w") { |f| f.puts("request.body empty") }
    end
       
  end
  
  # DELETE requests/1
  def delete
    Request.destroy(params[:id])
  end
  
end