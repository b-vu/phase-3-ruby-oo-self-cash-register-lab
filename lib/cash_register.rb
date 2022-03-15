require "pry"

class CashRegister
    attr_accessor :total, :discount, :items, :last_item

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity = 1)
        quantity.times { self.items << item }
        self.last_item = {
            item: item,
            price: price,
            quantity: quantity
        }
        self.total += price * quantity
    end

    def apply_discount
        unless discount == 0
            self.total = self.total - self.total * discount / 100
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_item[:price] * self.last_item[:quantity]
    end
end