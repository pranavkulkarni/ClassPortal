class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end

  end


  def create_message

    if session[:user_type] == 'student'
      puts "##############" + params.to_s
      Message.create(message: params[:message], course_id: params[:tokenCourseId], student_id: session[:current_user_id], instructor_id: params[:Instructor])
      flash[:notice] = 'Message submitted successfully!'
      redirect_to '/students/land/send_and_view_messages/' + params[:tokenCourseId]
    else
      puts "in instructor sessionnnnnnnnn..." + params.to_s
      #session is instructor's
      Message.create(message: params[:message], course_id: params[:tokenCourseId], student_id: params[:tokenStudId], instructor_id: session[:current_user_id])
      flash[:notice] = 'Message submitted successfully!'
      redirect_to '/instructors/land/send_view_messages/' + params[:tokenCourseId]
    end


  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:message)
    end
end