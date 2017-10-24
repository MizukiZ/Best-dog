class BreedsController < ApplicationController
  before_action :set_breed, only: [:show, :edit, :update, :destroy]

  # GET /breeds
  # GET /breeds.json
  def index


    if params[:query]
      @view_btn = true
      query = params[:query]
      @breeds = Breed.where("name iLIKE ?", "%#{query}%")
    else
      @view_btn = false
      @breeds = Breed.all.order(:name)
    end

  end

  # GET /breeds/1
  # GET /breeds/1.json
  def show
    @feed_backs = @breed.feed_backs
    @average_rate = FeedBack.where(breed_id: @breed.id).average(:rate)

    if params[:view] == "all"
      @feed_backs = @breed.feed_backs.order(created_at: :desc)
    elsif params[:view] == "three"
      @feed_backs = @breed.feed_backs.order(created_at: :desc).limit(3)
    else
      if @feed_backs.count > 3
        @feed_backs = @breed.feed_backs.order(created_at: :desc).limit(3)
      else
        @feed_backs = @breed.feed_backs.order(created_at: :desc)
      end
    end
  end

  # GET /breeds/new
  def new
    @breed = Breed.new
  end

  # GET /breeds/1/edit
  def edit
  end

  # POST /breeds
  # POST /breeds.json
  def create
    @breed = Breed.new(breed_params)

    respond_to do |format|
      if @breed.save
        format.html { redirect_to @breed, notice: 'Breed was successfully created.' }
        format.json { render :show, status: :created, location: @breed }
      else
        format.html { render :new }
        format.json { render json: @breed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breeds/1
  # PATCH/PUT /breeds/1.json
  def update
    respond_to do |format|
      if @breed.update(breed_params)
        format.html { redirect_to @breed, notice: 'Breed was successfully updated.' }
        format.json { render :show, status: :ok, location: @breed }
      else
        format.html { render :edit }
        format.json { render json: @breed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breeds/1
  # DELETE /breeds/1.json
  def destroy
    @breed.destroy
    respond_to do |format|
      format.html { redirect_to breeds_url, notice: 'Breed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_breed
    @breed = Breed.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def breed_params
    params.require(:breed).permit(:name, :image, :description)
  end
end
