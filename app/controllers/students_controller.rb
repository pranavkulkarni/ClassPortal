class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      @st = Student.find(params[:id])
      new_params= {}
      new_params[:name] = student_params[:name]
      new_params[:email] = student_params[:email]
      if student_params[:password] == @st.password
        if student_params[:new_password] != ""
          new_params[:password] = student_params[:new_password]
        else
          new_params[:password] = student_params[:password]
        end
        if @student.update(new_params)
          format.html { redirect_to @student, notice: 'Student was successfully updated.' }
          format.json { render :show, status: :ok, location: @student }
        else
          format.html { render :edit }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      else
        flash[:notice] = "Password is not correct!"
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def take_to_enroll_student_page
    redirect_to '/students/land/enrollment_page'
  end

  def enroll_course
    @courseListToEnroll = params[:courses_to_be_enrolled]
    @courseListToEnroll.each do |courId|
      @e = Enrollment.create(student_id: session[:current_user_id].to_s, course_id: courId, status: 'PENDING', grade: '')
    end
    flash[:notice] = 'Enrollment request(s) have been submitted'
    redirect_to '/students/land/enrollment_page'
  end


  def register_for_email
    @courseListToNotify = params[:courses_to_be_notified]
    puts "$$$$$$$$$$$" + params.to_s
    @courseListToNotify.each do |courId|
      @e = EmailNotification.create(student_id: session[:current_user_id].to_s, course_id:courId)
    end
    flash[:notice] = 'Registered for notification when a course becomes active!'
    redirect_to '/students/land/enrollment_page'
  end



  def drop_course
    e = Enrollment.find_by(student_id: session[:current_user_id], course_id: params[:cId])
    e.status = 'DROPPED'
    e.save
    flash[:notice] = 'Course has been dropped.'
    redirect_to '/students/land/home'
  end

  def take_to_search_course_page
    redirect_to '/students/land/search_course'
  end

  #def search_result
  #  redirect_to '/students/land/search_result'
  #end


  def dispatcher
    puts params
    puts "oo**********************%%%%%%%%%%%%%%"
    if params.has_key?(:enroll_student)
      take_to_enroll_student_page
    end
    if params.has_key?(:search)
      puts "oo*************####################"
      take_to_search_course_page
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :email, :password, :new_password)
    end
end
