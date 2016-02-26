
class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @instructors = Instructor.all
    @courses = Course.all

  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
    puts "Edit called......."
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    puts "Update called in courses......" + course_params.to_s
    puts params[:id].to_s
    if course_params[:status] == "Active"
      @c = Course.find(params[:id])
      @c.status='Active'
      @c.save
      puts "Sending email......"
      @notifiers = EmailNotification.where(course_id: params[:id])
      if @notifiers != nil

        @notifiers.all.each do |n|
          @em = Student.find(n.student_id).email.to_s
          puts "Sending email to ...." + @em
          if @em != nil
            Pony.mail(:to => @em, :from => 'localhost@gmail.com', :subject => 'Wolfweb portal: Course active', :body => 'Hello there. The course ' + course_params[:title].to_s + ' has become active.')
          end
        end
      end
      EmailNotification.destroy_all(course_id: params[:id])
    end
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:courseNumber, :title, :description, :instructor_id, :startDate, :endDate, :status)
    end
end
