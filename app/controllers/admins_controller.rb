class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token


  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      @ad = Admin.find(params[:id])
      new_params= {}
      new_params[:name] = admin_params[:name]
      new_params[:email] = admin_params[:email]
      if admin_params[:password] == @ad.password
        if admin_params[:new_password] != ""
          new_params[:password] = admin_params[:new_password]
        else
          new_params[:password] = admin_params[:password]
        end
        if @admin.update(new_params)
          format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
          format.json { render :show, status: :ok, location: @admin }
        else
          format.html { render :edit }
          format.json { render json: @admin.errors, status: :unprocessable_entity }
        end
      else
        flash[:notice] = "Password is not correct!"
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    puts " in delete"
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /admins/land/home
  def home
    render :admins => "home"
  end

  def add_grade_admin
    e = Enrollment.find_by(student_id: params[:stud_id].to_s, course_id: params[:Course].to_s)
    e.grade = params[:grade].to_s
    e.save
    redirect_to '/students'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:name, :email, :password, :new_password)
    end
end
