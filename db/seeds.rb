# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# Create users
u1 = User.create(:username => 'bbalonko', :email => 'bobby@balonko.com')
u2 = User.create(:username => 'pvelma', :email => 'pvelma@hotmail.com')

# Create user attributes
UserAttribute.create(:user_id => u1.id, :first_name => 'Bobby', :last_name => 'Balonko', :company => 'RealtorMart', :phone => '780-827-1111')
UserAttribute.create(:user_id => u2.id, :first_name => 'Patti', :last_name => 'Velma', :company => 'RealtorWorld', :phone => '721-922-8479')

# Create properties
p1 = Property.create(:street => '1234 Wally World', :city => 'Henderson', :state => 'NV', :postal_code => '83733')
p2 = Property.create(:street => '9763 Tiger Court', :city => 'Scranton', :state => 'PN', :postal_code => '98222')
p3 = Property.create(:street => '2311 Bountiful Lane', :city => 'Las Vegas', :state => 'NM', :postal_code => '11119')

# Create requests
r1 = Request.create(:user_id => u1.id, :property_id => p1.id, :required_forms => 'Form One|Form Two|Form Three', :other_notes => 'Some note')
r2 = Request.create(:user_id => u2.id, :property_id => p2.id, :required_forms => 'BofA Waiver|Lien Release', :other_notes => 'Please make sure the property is locked up and secure after access.')
r3 = Request.create(:user_id => u2.id, :property_id => p3.id, :other_notes => 'The lockbox code is 8822')

# Create items
Item.create(:description => 'Item No. 1', :request_id => r1.id)
Item.create(:description => 'Item No. 2', :request_id => r2.id)
Item.create(:description => 'Item No. 3', :request_id => r3.id)

# Create some arbitrary Required Forms
RequiredForm.create(:name => 'Lien Waiver', :ownedBy => 'Bank of America', :details => 'Lien Waiver required by BofA before work commencement on any property.')
