require 'yajl'
require 'yajl/json_gem'

class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :property
  has_many :items
  
  def self.save_hash (hash, absolute_url)
    File.open("/Users/tparkinson/Development/RequestPost.txt", "w+") { |f| f.puts("In ::save_hash") }

    begin
         # Create the request
         @request = Request.create
         @request.other_notes = hash["other_notes"]
         @request.required_forms = hash["required_forms"]

         # If a property hash was sent with this request, create that object first.
         if hash['property']
             @prop = Property.create
             @request.property_id = @prop.id
             @prop.update_attributes(hash['property'])
         end

         # Save the request
         @request.save

         # Similarly if an items hash was sent, create those objects first.
         if hash['items']
           items_array = hash['items']

           # Loop through the items array
           items_array.each do |instance|
             item_base = instance["item"]
             @item = Item.create

             @file_included = false
             @file_path = ""

             # If the "image_base64" attribute present: decode it the image, save it to file,
             # and remove from hash.
             if item_base['image_base64']
               @file_included = true
               
               # Create the basic folder structure
               @file_dirs = ["#{Rails.public_path}/requests/", "#{@request.id}/", "items/"]
               @dir_path = ""
               @file_dirs.each do |path|
                 @dir_path = "#{@dir_path}#{path}"
                 Dir::mkdir(@dir_path) unless File.exists?(@dir_path)
               end

               # Save the image to the file system
               @file_contents = Base64.decode64(item_base['image_base64'])
               @guid = rand(36**8).to_s(36)
               @file_name = "#{@guid}.jpg"
               @file_path = "#{@dir_path}#{@file_name}"
               @file_url = "#{absolute_url}requests/#{@request.id}/items/#{@file_name}"
               
               # Write the image to file
               File.open( @file_path, "wb" ) { |f| f.write(@file_contents) }

               # Set the image URL paths
               @item.image1x_url = @file_url
               @item.image2x_url = @file_url

               item_base.delete('image_base64')
             end

             @item.update_attributes(item_base)
             @item.request_id = @request.id
             @item.save
           end
         end
     rescue => e
       # Log the error
       File.open("/Users/tparkinson/Development/RequestPost.txt", "w+") do |f| 
         f.puts("Error:")
         f.puts(e.message) 
         f.puts(e.backtrace)
       end
     end

  end
end
