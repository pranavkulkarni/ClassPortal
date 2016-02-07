class LoginsController < ApplicationController

  skip_before_filter  :verify_authenticity_token

  def index
    render :logins => "index"
  end

  def validate
    @email = params[:email]
    @password = params[:password]
    @usertype = params[:userType]
    if @usertype == 'student'
      @model = Student
    end
    if @usertype == 'instructor'
      @model = Instructor
    end
    if @usertype == 'admin'
      @model = Admin
    end
    returnVal = @model.find_by email: @email
    if returnVal == nil or returnVal[:password] != @password
      flash[:notice] = 'login failed!'
      redirect_to '/logins/index'
    else
      session[:current_user_id] = returnVal.id
      @view = @usertype+'s'
      redirect_to '/'+@view+'/' + returnVal[:id].to_s
    end
  end

  def logout
    session[:current_user_id] = nil
    redirect_to '/logins/index'
  end


end