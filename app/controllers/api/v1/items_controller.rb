class ItemsController < ApiController
  def index
    @items = Item.all
    render json: @items
  end

  def update
    @item = Item.find(params[:id])
    return render json: { error: 'Item not found' }, status: 404 unless @item

    if @item.update(item_params)
      render json: @item
    else
      render json: { error: 'Item not updated' }, status: 422
    end
  end

  def checkout
    items = checkout_params[:items]

    cart = {}

    items.each do |item|
      checked_item = Item.find_by(code: item)
      next if checked_item.nil?

      if cart.key?(checked_item.code)
        cart[checked_item.code] += 1
      else
        cart[checked_item.code] = 1
      end
    end
  end

  private

  def checkout_params
    params.require(:checkout).permit(:items)
  end

  def item_params
    params.require(:item).permit(:price)
  end
end
