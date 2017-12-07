class ListsController < ApplicationController
  require "google/cloud/vision"
  before_action :set_list, only: [:show, :update, :destroy]

  # GET /lists
  def index
    @lists = List.all

    render json: @lists
  end

  # GET /lists/1
  def show
    render json: @list
  end

  # POST /lists
  def create
    @list = List.new(list_params)
    @list.user_id = @current_user.id
    
    if @list.save
      extract_text if @list.picture.present?
      render json: @list, status: :created, location: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lists/1
  def update
    if @list.update(list_params)
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def list_params
      params.require(:list).permit(:user_id, :category_id, :due_date, :picture, :photo_url)
    end

    def extract_text
      project_id = 'list-pic'
      key_file = ENV['GOOGLE_APPLICATION_CREDENTIALS']
      vision = Google::Cloud::Vision.new project: project_id, keyfile: key_file
      file_name = "public#{@list.picture}"
      labels = vision.image(file_name).text.text.split("\n")
      labels.each do |label|
        print "!!!!!!!!!!!!!!!!"
        puts label
        @list.list_items.create!(title: label)
      end
    end
end
