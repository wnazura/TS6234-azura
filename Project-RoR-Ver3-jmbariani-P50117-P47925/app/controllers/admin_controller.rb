class AdminController < ApplicationController
before_filter :adminauthorized


layout "admin"

def index
end


end
