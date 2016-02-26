class EmailNotificationsController < ApplicationController
  before_action :set_email_notification, only: [:show, :edit, :update, :destroy]

  # GET /email_notifications
  # GET /email_notifications.json
  def index
    @email_notifications = EmailNotification.all
  end

  # GET /email_notifications/1
  # GET /email_notifications/1.json
  def show
  end

  # GET /email_notifications/new
  def new
    @email_notification = EmailNotification.new
  end

  # GET /email_notifications/1/edit
  def edit
  end

  # POST /email_notifications
  # POST /email_notifications.json
  def create
    @email_notification = EmailNotification.new(email_notification_params)

    respond_to do |format|
      if @email_notification.save
        format.html { redirect_to @email_notification, notice: 'Email notification was successfully created.' }
        format.json { render :show, status: :created, location: @email_notification }
      else
        format.html { render :new }
        format.json { render json: @email_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_notifications/1
  # PATCH/PUT /email_notifications/1.json
  def update
    respond_to do |format|
      if @email_notification.update(email_notification_params)
        format.html { redirect_to @email_notification, notice: 'Email notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_notification }
      else
        format.html { render :edit }
        format.json { render json: @email_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_notifications/1
  # DELETE /email_notifications/1.json
  def destroy
    @email_notification.destroy
    respond_to do |format|
      format.html { redirect_to email_notifications_url, notice: 'Email notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_notification
      @email_notification = EmailNotification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_notification_params
      params[:email_notification]
    end
end
