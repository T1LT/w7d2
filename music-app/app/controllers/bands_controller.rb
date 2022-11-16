class BandsController < ApplicationController
    before_action :set_band, only: %i(show edit update destroy)
    def new
        @band = Band.new
        render :new
    end

    def edit
        render :edit
    end

    def index
        @bands = Band.all
        render :index
    end

    def create
        @band = Band.new(band_params)
        if @band.save
            redirect_to bands_url
        else
            render :new
        end
    end

    def show
        render :show
    end

    def update
        @band.update(band_params)
    end

    def destroy
        @band.destroy
        redirect_to bands_url
    end

    private
    def set_band
        @band = Band.find_by(id: params[:id])
    end

    def band_params
        params.require(:band).permit(:name)
    end
end