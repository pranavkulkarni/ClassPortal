class InstructorsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_action :set_instructor, only: [:show, :edit, :update, :destroy]

  # GET /instructors
  # GET /instructors.json
  def index
    @instructors = Instructor.all
  end

  # GET /instructors/1
  # GET /instructors/1.json
  def show
  end

  # GET /instructors/new
  def new
    @instructor = Instructor.new
  end

  # GET /instructors/1/edit
  def edit
  end

  # POST /instructors
  # POST /instructors.json
  def create
    @instructor = Instructor.new(instructor_params)

    respond_to do |format|
      if @instructor.save
        format.html { redirect_to @instructor, notice: 'Instructor was successfully created.' }
        format.json { render :show, status: :created, location: @instructor }
      else
        format.html { render :new }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instructors/1
  # PATCH/PUT /instructors/1.json
  def update
    respond_to do |format|
      if @instructor.update(instructor_params)
        format.html { redirect_to @instructor, notice: 'Instructor was successfully updated.' }
        format.json { render :show, status: :ok, location: @instructor }
      else
        format.html { render :edit }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instructors/1
  # DELETE /instructors/1.json
  def destroy
    @instructor.destroy
    respond_to do |format|
      format.html { redirect_to instructors_url, notice: 'Instructor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /instructors/land/home
  def home
    render :courses => "index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instructor
      @instructor = Instructor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instructor_params
      params.require(:instructor).permit(:name, :email, :password)
    end

    public
    def manage_stu(courseId)
      if courseId == nil
        flash[:notice] = 'Please select a course!'
        redirect_to '/instructors/land/home'
      else
      redirect_to "/instructors/land/manage_student/"+ courseId.to_s
      end
    end

    def manage_course_mat(courseId)
      if courseId == nil
        flash[:notice] = 'Please select a course!'
        redirect_to '/instructors/land/home'
      else
      redirect_to "/instructors/land/manage_course_material/"+ courseId.to_s
      end
     end

    def add_enroll (courseId)
      if courseId == nil
        flash[:notice] = 'Please select a course!'
        redirect_to '/instructors/land/home'
      else
      redirect_to "/instructors/land/add_enrollment/"+ courseId.to_s
      end
     end


    def enroll_student
      @student_id_list = params[:student_ids]
      if @student_id_list == nil
          flash[:notice] = 'Please select student(s)!'
          redirect_to '/instructors/land/add_enrollment/' + params[:tokenCourseId].to_s
      else
      @student_id_list.each do |x|
        e = Enrollment.find_by(student_id: x, course_id: params[:tokenCourseId])
        puts e.student_id.to_s + "  " + e.status.to_s
        e.status = "ENROLLED"
        e.save
      end
      flash[:notice] = 'Students enrolled successfully!'
      redirect_to '/instructors/land/home'
      end
    end

    def dispatcher
      if params.has_key?(:manage_student)
        manage_stu params[:radio_checked]
      elsif params.has_key?(:add_enrollment)
        add_enroll params[:radio_checked]
      elsif params.has_key?(:manage_course_material)
        manage_course_mat params[:radio_checked]
      end
    end

    def add__stu_grade(courseId,grade,student_list)
      if student_list == nil
        flash[:notice] = 'Please select student(s)!'
        redirect_to '/instructors/land/manage_student/' + courseId.to_s
      elsif grade.to_s == ''
        flash[:notice] = 'Kindly select a grade!'
        redirect_to '/instructors/land/manage_student/'+courseId.to_s
      else
        student_list.each do |x|
        e = Enrollment.find_by(student_id: x, course_id: courseId, status: 'ENROLLED')
        #puts e.student_id.to_s + "  " + e.status.to_s
        e.grade = grade
        e.save
      end
      flash[:notice] = 'Student grades updated successfully!'
      redirect_to '/instructors/land/manage_student/'+courseId.to_s
      end
    end

    def remove_stu(courseId,student_list)
      if student_list == nil
        flash[:notice] = 'Please select student(s)!'
        redirect_to '/instructors/land/manage_student/' + courseId.to_s
      else
        student_list.each do |x|
        e = Enrollment.find_by(student_id: x, course_id: courseId, status: 'ENROLLED')
        #puts e.student_id.to_s + "  " + e.status.to_s
        e.destroy
        end
      flash[:notice] = 'Student(s) removed successfully!'
      redirect_to '/instructors/land/manage_student/'+courseId.to_s
      end
    end


    def manage_student_dispatcher
      puts params
      if params.has_key?(:add_grade)
        add__stu_grade params[:tokenCourseId], params[:grade], params[:student_ids]
      elsif params.has_key?(:remove_student)
        remove_stu params[:tokenCourseId], params[:student_ids]
      end
    end
end
