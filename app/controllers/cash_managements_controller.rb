# frozen_string_literal: true

class CashManagementsController < ApplicationController
  load_and_authorize_resource except: [:filter_cash_management]
  before_action :set_cash_management, only: [:show, :edit, :update, :destroy]

  # GET /cash_managements
  # GET /cash_managements.json
  def index
    @cash_managements = CashManagement.list(current_user)
  end

  # GET /cash_managements/1
  # GET /cash_managements/1.json
  def show
  end

  # GET /cash_managements/new
  def new
    @cash_management = CashManagement.new
  end

  # GET /cash_managements/1/edit
  def edit
  end

  # POST /cash_managements
  # POST /cash_managements.json
  def create
    @cash_management = CashManagement.new(cash_management_params)

    respond_to do |format|
      if @cash_management.save
        format.html { redirect_to @cash_management, notice: 'Cash management was successfully created.' }
        format.json { render :show, status: :created, location: @cash_management }
      else
        format.html { render :new }
        format.json { render json: @cash_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cash_managements/1
  # PATCH/PUT /cash_managements/1.json
  def update
    respond_to do |format|
      if @cash_management.update(cash_management_params)
        format.html { redirect_to @cash_management, notice: 'Cash management was successfully updated.' }
        format.json { render :show, status: :ok, location: @cash_management }
      else
        format.html { render :edit }
        format.json { render json: @cash_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cash_managements/1
  # DELETE /cash_managements/1.json
  def destroy
    @cash_management.destroy
    respond_to do |format|
      format.html { redirect_to cash_managements_url, notice: 'Cash management was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #filter cash management based on company
  def filter_cash_management
    @cash_managements = CashManagement.company_based(params[:company_id])
    respond_to do |format|
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash_management
      @cash_management = CashManagement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cash_management_params
      params.require(:cash_management).permit(:initial_cash, :cash_out, :cash_in,:company_id, :entry_month)
    end
end
