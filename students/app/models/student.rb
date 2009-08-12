class Student < ActiveRecord::Base
 validates_presence_of :name
 validates_presence_of :matrix
 validates_presence_of :email
 validates_uniqueness_of :matrix
end
