class NumbersController < ApplicationController
  before_action :set_number, only: %i[ show edit update destroy ]
      
  # GET /numbers or /numbers.json
  def index
    @numbers = Number.all
  end

  # GET /numbers/1 or /numbers/1.json
  def show
  end

  # GET /numbers/new
  def new
    @number = Number.new
  end

  # GET /numbers/1/edit
  def edit
  end

  # POST /numbers or /numbers.json
  def create
     @h = {1 => 'A', 2 => 'B', 3 => 'C', 4 => 'D', 5 => 'E', 6 => 'F', 7 => 'G', 
          8 => 'H', 9 => 'I', 10 => 'J', 11 => 'K', 12 => 'L', 13 => 'M', 14 => 'N', 
          15 => 'O', 16 => 'P', 17 => 'Q', 18 => 'R', 19 => 'S', 20 => 'T', 21 => 'U', 
          22 => 'V', 23 => 'W', 24 => 'X', 25 => 'Y', 26 => 'Z',}

     def label(number)
       do_label(number, []).join("")
     end

     def do_label(number, acc)
       return acc if number == 0
       quot, rem = number.divmod(@h.length)
       rem != 0 ? acc.prepend(@h[rem]) : acc.prepend(@h[@h.length])
       do_label((rem !=  0 ? quot : quot - 1), acc)
     end

    @number = Number.new(number_params)
    @number.converted_number = @number.entered_number.nil? ? "" : label(@number.entered_number)

    respond_to do |format|
      if @number.save
        format.html { redirect_to @number, notice: "Number was successfully created." }
        format.json { render :show, status: :created, location: @number }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /numbers/1 or /numbers/1.json
  def update
    respond_to do |format|
      if @number.update(number_params)
        format.html { redirect_to @number, notice: "Number was successfully updated." }
        format.json { render :show, status: :ok, location: @number }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /numbers/1 or /numbers/1.json
  def destroy
    @number.destroy
    respond_to do |format|
      format.html { redirect_to numbers_url, notice: "Number was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number
      @number = Number.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def number_params
      params.require(:number).permit(:entered_number)
    end
  
end
