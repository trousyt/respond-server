class RequiredFormsController < ApplicationController
  # Only respond to requests that ask for JSON in the HTTP-Accept header
  respond_to :json
  
  # GET requests
  def index
    @entity = RequiredForm.all
    #respond_with(@entity)
  end
  
end
