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
      session[:user_type] = @usertype
      session[:name] = returnVal.name
      @view = @usertype + 's'
      #below link is preprended with "land" word because Rails by default will take home as "id" in the model controller
      #check GET syntax in controller.
      redirect_to '/' + @view + '/land/home'
    end
  end

  def logout
    session[:current_user_id] = nil
    session[:user_type] = nil
    session[:name] = nil
    redirect_to '/logins/index'
  end


end