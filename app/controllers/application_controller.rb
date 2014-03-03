class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include StaticPagesHelper
  include SessionsHelper
end
