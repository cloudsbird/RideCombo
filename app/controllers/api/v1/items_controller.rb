module Api::V1
  class ItemsController < ApiController
    def index
      @items = Item.all
      render json: @items
    end

    def update
      @item = Item.find_by(id: params[:id])
      return render json: { error: 'Item not found' }, status: 404 unless @item

      if @item.update(item_params)
        render json: @item
      else
        render json: { error: 'Item not updated' }, status: 422
      end
    end

    def checkout
      cart = check_items
      return render json: { error: 'Cart is empty' }, status: 422 if cart.empty?

      price = checkout_params[:discount] == true ? calculate_discount_price : calculate_price

      render json: {
        items: cart,
        total: "#{price}€"
      }
    end

    private

    def check_items
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
      cart
    end

    def calculate_price
      cart = check_items
      total = 0
      cart.each do |code, quantity|
        item = Item.find_by(code: code)
        total += item.price * quantity
      end
      total
    end

    def calculate_discount_price
      calculate_price - check_discount_conditions
    end

    def check_discount_conditions
      cart = check_items
      price = 0
      discounts = Discount.where(status: true)
      discounts.each do |discount|
        cart.each do |code, quantity|
          price += discount.discount_price(quantity) if discount.item_code == code
        end
      end
      price
    end

    def checkout_params
      params.require(:checkout).permit(:discount, items: [])
    end

    def item_params
      params.require(:item).permit(:id, :price)
    end
  end
end
