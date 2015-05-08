class Post < ActiveRecord::Base
validates :name,:content, :presence=>"true"
end
