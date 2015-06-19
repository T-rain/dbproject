class LoyalsController < ApplicationController
  before_action :set_loyal, only: [:show, :edit, :update, :destroy]

  # GET /loyals
  # GET /loyals.json
  def index
    @loyal = Loyal.all
    
  end

  # GET /loyals/1
  # GET /loyals/1.json
  def show

    g = @loyal.gender
    ab = @loyal.agebegin
    al = @loyal.agelast
    r = @loyal.region
    ye = @loyal.year

    case r

      when '日本'
         r = "A"
      when '韓國'
         r = "B"
      when '中國大陸'
         r = "G"
      when '港澳地區'
         r = "H"
      when '美加'
         r = "I"
      when '歐洲'
         r = "L"
      else 

    end
    r = r+"%"


    @yearl = ye-1
    @totall = Loyal.generate_result(g,ab,al,ye-1,"%")
    @regionl = Loyal.generate_result(g,ab,al,ye-1,r)

    @ratiol = @regionl.to_f/@totall

    @ratiol = @ratiol.round(5)
      


    @year = ye
    @total = Loyal.generate_result(g,ab,al,ye,"%")
    @region = Loyal.generate_result(g,ab,al,ye,r)

    @ratio = @region.to_f/@total

    @ratio = @ratio.round(5)


    @yearn = ye+1
    @totaln = Loyal.generate_result(g,ab,al,ye+1,"%")
    @regionn = Loyal.generate_result(g,ab,al,ye+1,r)

    @ration = @regionn.to_f/@totaln

    @ration = @ration.round(5)



    render :show


  end

  # GET /loyals/new
  def new
    @loyal = Loyal.new
  end

  # GET /loyals/1/edit
  def edit
  end

  # POST /loyals
  # POST /loyals.json
  def create
    @loyal = Loyal.new(loyal_params)

    respond_to do |format|
      if @loyal.save
        format.html { redirect_to loyals_url, notice: 'Loyal was successfully created.' }
        format.json { render :index, status: :created, location: loyals_url }
      else
        format.html { render :new }
        format.json { render json: @loyal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loyals/1
  # PATCH/PUT /loyals/1.json
  def update
    respond_to do |format|
      if @loyal.update(loyal_params)
        format.html { redirect_to loyals_url, notice: 'Loyal was successfully updated.' }
        format.json { render :index, status: :created, location: loyals_url }
      else
        format.html { render :edit }
        format.json { render json: @loyal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loyals/1
  # DELETE /loyals/1.json
  def destroy
    @loyal.destroy
    respond_to do |format|
      format.html { redirect_to loyals_url, notice: 'Loyal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loyal
      @loyal = Loyal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loyal_params
      params.require(:loyal).permit(:gender, :agebegin,:agelast, :region, :year)
    end

end





