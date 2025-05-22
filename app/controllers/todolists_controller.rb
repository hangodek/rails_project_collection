class TodolistsController < ApplicationController
  before_action :set_todolist, only: %i[ show edit update destroy ]

  # GET /todolists or /todolists.json
  def index
    @todolists = Todolist.all
  end

  # GET /todolists/1 or /todolists/1.json
  def show
    render layout: "todolist_form"
  end

  # GET /todolists/new
  def new
    @todolist = Todolist.new
    render layout: "todolist_form"
  end

  # GET /todolists/1/edit
  def edit
  end

  # POST /todolists or /todolists.json
  def create
    user = User.find_by(email_address: Current.session.user.email_address)
    @todolist = Todolist.new(todolist_params)
    @todolist.user = user

    respond_to do |format|
      if @todolist.save
        format.html { redirect_to homepages_index_path, notice: "Todolist was successfully created." }
        format.json { render :show, status: :created, location: @todolist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todolists/1 or /todolists/1.json
  def update
    respond_to do |format|
      if @todolist.update(todolist_params)
        format.html do
          flash[:notice] = "To do list updated successfully"
          redirect_back(fallback_location: root_path)
        end
        format.json { render :show, status: :ok, location: @todolist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todolists/1 or /todolists/1.json
  def destroy
    @todolist.destroy!

    respond_to do |format|
      format.html { redirect_to root_path, status: :see_other, notice: "Todolist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todolist
      @todolist = Todolist.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def todolist_params
      params.expect(todolist: [ :title, :description, :completed, :deadline ])
    end
end
