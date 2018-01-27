class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_title

  protected

    def set_title
      unless action_name.to_s.downcase == 'destroy'

        case params[:action]
        when 'index'
          @page_title = controller_name.titleize
        when 'show'
          @page_title = controller_name.singularize.titleize
        when 'new', 'create'
          @page_title = "New #{controller_name.singularize.titleize}"
        when 'edit', 'update'
          @page_title = "Edit #{controller_name.singularize.titleize}"
        else
          @page_title = action_name.titleize
        end
      end
    end
end
