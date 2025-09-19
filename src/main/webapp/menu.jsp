
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BhojanVibes Menu</title>
    <link rel="stylesheet" href="css/menu.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
#cart-panel {
    position: fixed;
    top: 0;
    right: -400px;
    width: 400px;
    height: 100%;
    background: white;
    border-left: 1px solid #ccc;
    box-shadow: -4px 0 8px rgba(0,0,0,0.2);
    transition: right 0.4s;
    z-index: 999;
    padding: 20px;
}

.cart-button {
    position: fixed;
    top: 20px;
    right: 20px;
    background: #ff7f50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    z-index: 1000;
}

.cart-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

#cart-items {
    margin-top: 20px;
    max-height: 60vh;
    overflow-y: auto;
}

.cart-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
    border-bottom: 1px solid #eee;
    padding-bottom: 8px;
}

.qty-btn {
    background: #ddd;
    border: none;
    padding: 4px 8px;
    cursor: pointer;
    font-size: 16px;
}

.remove-btn {
    background: transparent;
    color: red;
    border: none;
    font-size: 20px;
    cursor: pointer;
}

#cart-total {
    margin-top: 20px;
    font-size: 18px;
    font-weight: bold;
}


</style>
    
</head>
<body>
<%
  String msg = (String) request.getAttribute("msg");
if (msg != null) {
	%>
	<p style="color:green;font-weight:bold;"><%= msg %></p>
	<%
	}%>

<div class="container">
    <div class="card-grid">
        <!-- Example Card -->
        <div class="card" data-category="pizza">
        <form action="cart" method="post">
            <div class="hover-icons">
                <i class="fas fa-shopping-cart"></i>
                <i class="fas fa-heart"></i>
                <i class="fas fa-eye"></i>
            </div>
            <img src="images/pizza.jpeg" alt="Pizza" style="width:100%; height:auto;">
            <h4>Pepperoni Pizza</h4>
            <p>Cheese, Tomato, Olives</p>
            <div class="price">100.00 rs</div>
            <input type="hidden" name="item" value="Pepperoni Pizza"/>
            <input type="hidden" name="price" value="100"/>
            <div class="actions" style="display:flex;gap:10px;align-items: center;margin-top:10px;">
            <label class="quantity-label">Qty:</label>
            <input type="number" name="quantity" value="1" class="quantity-input" min="1"/>
                <button class="btnPrimary" type="submit">Add to Cart</button>
                </div>
                </form>
            </div>
        </div>
 <!-- 2. Burger -->
                <div class="card" data-category="burger">
                    <div class="hover-icons">
                        <i class="fas fa-shopping-cart"></i>
                        <i class="fas fa-heart"></i>
                        <i class="fas fa-eye"></i>
                    </div>
                    <img src="images/burger.jpeg">
                    <h4>Cheese Burger</h4>
                    <p>Cheese, Tomato, Olives</p>
                    <div class="price">120.00 rs</div>
                    <div class="actions" style="display:flex;gap:10px;align-items: center;margin-top:10px;">
                    <label class="quantity-label">Qty:</label>
                    <input type="number" name="quantity" value="1" class="quantity-input" min="1"/>
                    <button class="btnPrimary" type="submit">Add to Cart</button>
                    </div>
                </div>

                <!-- 3. Fries -->
                <div class="card" data-category="fries">
                    <div class="hover-icons">
                        <i class="fas fa-shopping-cart"></i>
                        <i class="fas fa-heart"></i>
                        <i class="fas fa-eye"></i>
                    </div>
                    <img src="images/fb.jpeg">
                    <h4>French Fries</h4>
                    <p>Crispy and Golden</p>
                    <div class="price">60.00 rs</div>
                    <div class="actions">
                        <button class="btnPrimary">Add to Cart</button>
                        <button class="btnSecondary">Watch List</button>
                    </div>
                </div>

                <!-- 4. Pizza again -->
                <div class="card" data-category="pasta">
                    <div class="hover-icons">
                        <i class="fas fa-shopping-cart"></i>
                        <i class="fas fa-heart"></i>
                        <i class="fas fa-eye"></i>
                    </div>
                    <img src="images/pasta.jpg">
                    <h4>Pasta</h4>
                    <p>Spicy Pasta</p>
                    <div class="price">100.00 rs</div>
                    <div class="actions">
                        <button class="btnPrimary">Add to Cart</button>
                        <button class="btnSecondary">Watch List</button>
                    </div>
                </div>

                <!-- 5. Sandwich -->
                <div class="card" data-category="Sandwich">
                    <div class="hover-icons">
                        <i class="fas fa-shopping-cart"></i>
                        <i class="fas fa-heart"></i>
                        <i class="fas fa-eye"></i>
                    </div>
                    <img src="images/sandwich.jpeg">
                    <h4>Sandwich</h4>
                    <p>Cheese, Tomato, Olives</p>
                    <div class="price">60.00 rs</div>
                    <div class="actions">
                        <button class="btnPrimary">Add to Cart</button>
                        <button class="btnSecondary">Watch List</button>
                    </div>
                </div>

                <!-- 6. Chicken -->
                <div class="card" data-category="fries">
                    <div class="hover-icons">
                        <i class="fas fa-shopping-cart"></i>
                        <i class="fas fa-heart"></i>
                        <i class="fas fa-eye"></i>
                    </div>
                    <img src="images/chicken.jpeg">
                    <h4>Chicken</h4>
                    <p>Crispy and Golden</p>
                    <div class="price">100.00 rs</div>
                    <div class="actions">
                        <button class="btnPrimary">Add to Cart</button>
                        <button class="btnSecondary">Watch List</button>
                    </div>
                </div>

                <!-- ✅ Additional 10 Food Cards -->

                <div class="card" data-category="salad">
                    <div class="hover-icons">
                        <i class="fas fa-shopping-cart"></i>
                        <i class="fas fa-heart"></i>
                        <i class="fas fa-eye"></i>
                    </div>
                    <img src="images/salad.jpg">
                    <h4>Salad</h4>
                    <p>Fruits, Onion, Paneer</p>
                    <div class="price">130.00 rs</div>
                    <div class="actions">
                        <button class="btnPrimary">Add to Cart</button>
                        <button class="btnSecondary">Watch List</button>
                    </div>
                </div>

                <div class="card" data-category="smoothie">
                    <div class="hover-icons">
                        <i class="fas fa-shopping-cart"></i>
                        <i class="fas fa-heart"></i>
                        <i class="fas fa-eye"></i>
                    </div>
                    <img src="images/smoothies.jpg">
                    <h4>Smoothie</h4>
                    <p>Strawberry,milk</p>
                    <div class="price">90.00 rs</div>
                    <div class="actions">
                        <button class="btnPrimary">Add to Cart</button>
                        <button class="btnSecondary">Watch List</button>
                    </div>
                </div>

                <div class="card" data-category="Paneer">
                    <div class="hover-icons">
                        <i class="fas fa-shopping-cart"></i>
                        <i class="fas fa-heart"></i>
                        <i class="fas fa-eye"></i>
                    </div>
                    <img src="images/paneer.jpg">
                    <h4>Mutter paneer</h4>
                    <p>Mutter, Spicy & Crispy paneer</p>
                    <div class="price">160.00 rs</div>
                    <div class="actions">
                        <button class="btnPrimary">Add to Cart</button>
                        <button class="btnSecondary">Watch List</button>
                    </div>
                </div>

                <div class="card" data-category="Grilled Food">
                    <div class="hover-icons">
                        <i class="fas fa-shopping-cart"></i>
                        <i class="fas fa-heart"></i>
                        <i class="fas fa-eye"></i>
                    </div>
                    <img src="images/grilled.jpg   ">
                    <h4>Grilled Food</h4>
                    <p>Grilled taste food</p>
                    <div class="price">180.00 rs</div>
                    <div class="actions">
                        <button class="btnPrimary">Add to Cart</button>
                        <button class="btnSecondary">Watch List</button>
                    </div>
                </div>
 


                <div class="card" data-category="Biriyani">
                    <div class="hover-icons">
                        <i class="fas fa-shopping-cart"></i>
                        <i class="fas fa-heart"></i>
                        <i class="fas fa-eye"></i>
                    </div>
                    <img src="images/biiryani.jpg">
                    <h4>Biriyani</h4>
                    <p>Aromatic basmati rice cooked with tender spices, herbs, and marinated meat or vegetables a royal
                        Indian delicacy</p>
                    <div class="price">250.00 rs</div>
                    <div class="actions">
                        <button class="btnPrimary">Add to Cart</button>
                        <button class="btnSecondary">Watch List</button>
                    </div>
                </div>

                <div class="card" data-category="Chapati">
                    <div class="hover-icons">
                        <i class="fas fa-shopping-cart"></i>
                        <i class="fas fa-heart"></i>
                        <i class="fas fa-eye"></i>
                    </div>
                    <img src="images/chapati.jpg">
                    <h4>Chapati</h4>
                    <p>Whole Wheat chapati</p>
                    <div class="price">30.00 rs</div>
                    <div class="actions">
                        <button class="btnPrimary">Add to Cart</button>
                        <button class="btnSecondary">Watch List</button>
                    </div>
                </div>

                <div class="card" data-category="green tea">
                    <div class="hover-icons">
                        <i class="fas fa-shopping-cart"></i>
                        <i class="fas fa-heart"></i>
                        <i class="fas fa-eye"></i>
                    </div>
                    <img src="images/green tea.jpg">
                    <h4>Greeen Tea</h4>
                    <p>Green Tea Good For Health</p>
                    <div class="price">50.00 rs</div>
                    <div class="actions">
                        <button class="btnPrimary">Add to Cart</button>
                        <button class="btnSecondary">Watch List</button>
                    </div>
                </div>

                <div class="card" data-category="Ragi malt">
                    <div class="hover-icons">
                        <i class="fas fa-shopping-cart"></i>
                        <i class="fas fa-heart"></i>
                        <i class="fas fa-eye"></i>
                    </div>
                    <img src="images/ragi-malt-ragi-porridge.jpg">
                    <h4>Ragi Porridge</h4>
                    <p>Easy for Digest</p>
                    <div class="price">70.00 rs</div>
                    <div class="actions">
                        <button class="btnPrimary">Add to Cart</button>
                        <button class="btnSecondary">Watch List</button>
                    </div>
                </div>

                <div class="card" data-category="Herbal Tea">
                    <div class="hover-icons">
                        <i class="fas fa-shopping-cart"></i>
                        <i class="fas fa-heart"></i>
                        <i class="fas fa-eye"></i>
                    </div>
                    <img src="images/herbal.jpg">
                    <h4>Herbal Tea</h4>
                    <p>Good For Health</p>
                    <div class="price">50.00 rs</div>
                    <div class="actions">
                        <button class="btnPrimary">Add to Cart</button>
                        <button class="btnSecondary">Watch List</button>
                    </div>
                </div>

                <div class="card" data-category="cerlac">
                    <div class="hover-icons">
                        <i class="fas fa-shopping-cart"></i>
                        <i class="fas fa-heart"></i>
                        <i class="fas fa-eye"></i>
                    </div>
                    <img src="images/cerlac.jpg">
                    <h4>Millet</h4>
                    <p>Good For Health</p>
                    <div class="price">130.00 rs</div>
                    <div class="actions">
                        <button class="btnPrimary">Add to Cart</button>
                        <button class="btnSecondary">Watch List</button>
                    </div>
                </div>

                <div class="card" data-category="high_protein">
                    <div class="hover-icons">
                        <i class="fas fa-shopping-cart"></i>
                        <i class="fas fa-heart"></i>
                        <i class="fas fa-eye"></i>
                    </div>
                    <img src="images/high_protein.jpg">
                    <h4>High_Protein</h4>
                    <p>Breakfast Bowl</p>
                    <div class="price">150.00 rs</div>
                    <div class="actions">
                        <button class="btnPrimary">Add to Cart</button>
                        <button class="btnSecondary">Watch List</button>
                    </div>
                </div>

                <div class="card" data-category="Dal & Roti">
                    <div class="hover-icons">
                        <i class="fas fa-shopping-cart"></i>
                        <i class="fas fa-heart"></i>
                        <i class="fas fa-eye"></i>
                    </div>
                    <img src="images/dal.jpg">
                    <h4>Dal & Roti</h4>
                    <p>A wholesome Indian meal featuring soft butter roti served with flavorful garlic-tempered dal</p>
                    <div class="price">200.00 rs</div>
                    <div class="actions">
                        <button class="btnPrimary">Add to Cart</button>
                        <button class="btnSecondary">Watch List</button>
                    </div>
        <!-- Add more .card blocks as needed -->
    </div>
</div>

<!-- 🛒 Cart UI -->
<div id="cartBox" style="display: none;">
    <div class="cart-header">
        <h3>Your Cart</h3>
        <button id="closeCart">X</button>
    </div>
    <div id="cartContainer"></div>
</div>

<button id="open-cart" class="cart-button">🛒 Cart</button>

<div id="cart-panel">
    <div class="cart-header">
        <h3>Your Cart</h3>
        <button id="close-cart">✕</button>
    </div>
    <div id="cart-items"></div>
    <div id="cart-total">Total: ₹0.00</div>
</div>
<button id="place-order" class="place-order-btn">Place Order</button>

<script>
let cart = [];

function addToCart(name, price) {
    const existing = cart.find(item => item.name === name);
    if (existing) {
        existing.quantity += 1;
    } else {
        cart.push({ name: name, price: price, quantity: 1 });
    }
    updateCartUI();
}

function updateCartUI() {
    let cartHTML = "";
    let total = 0;

    cart.forEach(item => {
        const itemTotal = item.price * item.quantity;
        total += itemTotal;
        cartHTML += `
            <div class="cart-item">
                <span>${item.name}</span>
                <span>₹${item.price.toFixed(2)}</span>
                <input type="number" value="${item.quantity}" min="1" onchange="updateQuantity('${item.name}', this.value)" />
                <button onclick="removeItem('${item.name}')">Remove</button>
            </div>
        `;
    });

    document.getElementById("cart-items").innerHTML = cartHTML;
    document.getElementById("cart-total").innerText = "Total: ₹" + total.toFixed(2);
}

function updateQuantity(name, quantity) {
    quantity = parseInt(quantity);
    const item = cart.find(i => i.name === name);
    if (item && quantity > 0) {
        item.quantity = quantity;
        updateCartUI();
    }
}

function removeItem(name) {
    cart = cart.filter(item => item.name !== name);
    updateCartUI();
}

// ✅ MAIN FUNCTION TO PLACE ORDER
function placeOrder() {
    if (cart.length === 0) {
        alert("Cart is empty!");
        return;
    }

    fetch("PlaceOrderServlet", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(cart)
    })
    .then(res => {
        if (!res.ok) {
            throw new Error("Order failed.");
        }
        return res.json();
    })
    .then(data => {
        alert(data.message);
        if (data.message === "Order placed successfully.") {
            cart = [];
            updateCartUI();
        }
    })
    .catch(err => {
        console.error("Error placing order:", err);
        alert("There was a problem placing your order. Please try again.");
    });
}
</script>
</body>
</html>
