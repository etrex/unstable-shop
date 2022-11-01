module ProductsHelper
  def show_description(product)
    return product.description if product.description.length <= 40

    product.description.first(40) + "..."
  end
end
