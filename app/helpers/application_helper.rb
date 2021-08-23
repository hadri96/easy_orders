module ApplicationHelper
  def round_price(price)
    if price % 1 != 0
      price.round(2)
    else
      price.to_i
    end
  end
end
