collection @entity
attributes :request_id, :required_forms, :other_notes, :created_at, :user_id, :property_id

child :property do
	attributes :street, :city, :state, :postal_code, :latitude, :longitude, :created_at
end

child :items do
	attributes :description, :image1x_url, :image2x_url, :created_at
end