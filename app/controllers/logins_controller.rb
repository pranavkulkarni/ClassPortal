class LoginsController < ApplicationController

  skip_before_filter  :verify_authenticity_token

  def index
    session.clear
    Course.all.select {|c| c.endDate < Date.today}.each do |x|
      x.status = 'Inactive'
      x.save
      Enrollment.all.select {|y| y.course_id == x.id}.each do |y|
        y.status = 'DROPPED'
        y.save
      end
    end
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
    puts "returnVal"
    puts returnVal
    if returnVal == nil or returnVal[:password] != @password
      flash[:notice] = 'login failed!'
      puts flash[:notice]
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


  def signupValidate
    puts "________--------------------" + params.to_s
    @email = params[:email]
    @password = params[:password]
    @confirm_password = params[:confirm_password]
    if @password.to_s != @confirm_password.to_s
      flash[:notice] = 'Passwords do not match!'
      redirect_to '/logins/signup'
      return
    end
    @model = Student
    returnVal = @model.find_by email: @email
    if returnVal != nil
      flash[:notice] = 'The email you entered is already signed up. Please choose a different email id'
      redirect_to '/logins/signup'
      return
    else
      @stud = Student.create(name: params[:name], email: @email, password: @password)
      flash[:notice] = 'Signed up successfully. Now please login.'
      redirect_to '/logins/index'
      return
    end
  end

  def logout
    session.clear
    #reset_session
    puts "%%%%%%%%%%%%%%%%%%%%%%%"
    puts session
    redirect_to '/logins/index'
  end


end