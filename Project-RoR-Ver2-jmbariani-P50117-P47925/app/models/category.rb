class Category < ActiveRecord::Base
has_many :menus
validates_uniqueness_of :title
end
