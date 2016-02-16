class CourseMaterialsController < ApplicationController
  before_action :set_course_material, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token

  # GET /course_materials
  # GET /course_materials.json
  def index
    @course_materials = CourseMaterial.all
  end

  # GET /course_materials/1
  # GET /course_materials/1.json
  def show
  end

  # GET /course_materials/new
  def new
    @course_material = CourseMaterial.new
  end

  # GET /course_materials/1/edit
  def edit
  end

  # POST /course_materials
  # POST /course_materials.json
  def create

    course_new_params= {}
    course_new_params[:title] = course_material_params[:title]
    course_new_params[:message] = course_material_params[:message]
    course_new_params[:course_id] =  params[:course_id]
    course_new_params[:instructor_id] = params[:instructor_id]

    @course_material = CourseMaterial.new(course_new_params)
    respond_to do |format|
      if @course_material.save
        format.html { redirect_to @course_material, notice: 'Course material was successfully created.' }
        format.json { render :show, status: :created, location: @course_material }
      else
        format.html { render :new }
        format.json { render json: @course_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_materials/1
  # PATCH/PUT /course_materials/1.json
  def update
    respond_to do |format|
      if @course_material.update(course_material_params)
        format.html { redirect_to @course_material, notice: 'Course material was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_material }
      else
        format.html { render :edit }
        format.json { render json: @course_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_materials/1
  # DELETE /course_materials/1.json
  def destroy
    puts "********************in distroy****"
    @course_material.destroy
    respond_to do |format|
      format.html { redirect_to course_materials_url, notice: 'Course material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_material
      @course_material = CourseMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_material_params
      params.require(:course_material).permit(:title, :message)
    end
end
