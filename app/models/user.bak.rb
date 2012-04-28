class User < ActiveRecord::Base
  has_many :requests
  has_one :user_attribute
end
