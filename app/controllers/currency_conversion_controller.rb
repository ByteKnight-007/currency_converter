class CurrencyConversionController < ApplicationController  

  def index
  end

  def show
    @from_currency = params[:from_currency]
    @to_currency = params[:to_currency]

    if @from_currency.present? && @to_currency.present?
      @exchange_rate = CurrencyLayer.get_conversion_rates(@from_currency, @to_currency)

      if @exchange_rate.present? &&  @exchange_rate['success']==true
        if request.format.html?
          @amount = params[:amount].to_f

          @converted_amount = @amount * @exchange_rate['quotes'].values.first
        else
          render json: @converted_amount
        end
      else
        flash.now[:alert] = 'Failed to fetch currency conversion data. Please try again.'
      end
    else
      flash.now[:alert] = 'Both source and target currencies are required.'
    end
  end
end