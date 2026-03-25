Category.destroy_all
Product.destroy_all

cat = Category.create(name: "Electronics")

Product.create(name: "Keyboard", description: "Gaming keyboard", price: 50, stock_quantity: 10, category: cat)
Product.create(name: "Mouse", description: "Wireless mouse", price: 30, stock_quantity: 20, category: cat)
Product.create(name: "Monitor", description: "24 inch display", price: 200, stock_quantity: 5, category: cat)