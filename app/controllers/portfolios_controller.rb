class PortfoliosController < ApplicationController
    def index
        @portfolio_items = Portfolio.all
    end

    def new
        @portfolio_items = Portfolio.new
        3.times { @portfolio_items.technologies.build }
        
    end

    def create
        @portfolio_items = Portfolio.new(portfolio_params)

    
      if @portfolio_items.save
        redirect_to @portfolio_items
        
      else
        render :new
      
    end
  end

  def show
    @portfolio_items = Portfolio.find(params[:id])

  end

  def edit
    @portfolio_items = Portfolio.find(params[:id])
  end

  def update
    @portfolio_items = Portfolio.find(params[:id])
    if @portfolio_items.update(portfolio_params)
      redirect_to @portfolio_items
    else

      render :edit  
  end
end

  def destroy
    @portfolio_items = Portfolio.find(params[:id])
    @portfolio_items.destroy
    redirect_to portfolios_path
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image, technologies_attributes: [:name])
  end
end
