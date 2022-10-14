class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    user = User.new(uid: params[:user][:uid], pass: params[:user][:pass])
    user.pass = BCrypt::Password.create('password')
    user.save
    redirect_to '/users/index'
  end
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to '/users/index'
  end
end
