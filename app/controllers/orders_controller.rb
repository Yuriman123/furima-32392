class OrdersController < ApplicationController
end

def index
  @order = Order(:item)
end