class TopController < ApplicationController
    def main
        if session[:login_uid]
            render "tweets/index"
        else
            render "login_form"
        end
    end
    def login
        user = User.find_by(uid: params[:uid])
        login_password = BCrypt::Password.new(user.pass)
        if login_password == 'password'
            session[:login_uid] = params[:uid]
            redirect_to controller: :tweets, action: :index
        else
            render 'index'
        end
    end
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end
