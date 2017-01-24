Precious::App.set(:gollum_path, ENV['GOLLUM_PATH'])

module Precious
  class App < Sinatra::Base
    set :default_markup, :rest

    before { set_user_right }

    helpers do
      def set_user_right
        @edit_access = request.env['HTTP_ACCESS'] == 'edit'
      end
    end

    def commit_message
      {
        :message => params[:message],
        :name => request.env['HTTP_USER'],
        :email => request.env['HTTP_EMAIL'],
      }
    end
  end

  module Views
    class Layout < Mustache
      # Passthrough additional omniauth parameters for status bar
      def allow_user_edit
        @edit_access
      end
    end
  end
end
