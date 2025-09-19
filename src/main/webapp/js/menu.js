// menu.js

AOS.init({ duration: 1000, once: true });

function toggleMenu() {
    document.getElementById('nav-menu').classList.toggle('show');
}

const filterButtons = document.querySelectorAll('.filter-btn');
const cards = document.querySelectorAll('.card');

filterButtons.forEach(button => {
    button.addEventListener('click', () => {
        document.querySelector('.filter-btn.active').classList.remove('active');
        button.classList.add('active');
        const category = button.getAttribute('data-category');

        cards.forEach(card => {
            const cardCategory = card.getAttribute('data-category');
            card.style.display = (category === 'all' || cardCategory === category) ? 'block' : 'none';
        });
    });
});

// Cart logic
let cart = [];

function updateCart() {
    const cartItemsContainer = document.getElementById("cart-items");
    const cartTotal = document.getElementById("cart-total");
    cartItemsContainer.innerHTML = "";
    let total = 0;

    cart.forEach((item, index) => {
        const itemTotal = item.price * item.quantity;
        total += itemTotal;
        const itemElement = document.createElement("div");
        itemElement.className = "cart-item";
        itemElement.innerHTML = `
            <div>
                <strong>${item.name}</strong> x ${item.quantity}
            </div>
            <div>
                ₹${itemTotal.toFixed(2)}
                <button onclick="changeQuantity(${index}, -1)">-</button>
                <button onclick="changeQuantity(${index}, 1)">+</button>
            </div>
        `;
        cartItemsContainer.appendChild(itemElement);
    });

    cartTotal.textContent = `₹${total.toFixed(2)}`;
}

function addToCart(name, price) {
    const index = cart.findIndex(item => item.name === name);
    if (index !== -1) {
        cart[index].quantity++;
    } else {
        cart.push({ name, price, quantity: 1 });
    }
    updateCart();
    document.getElementById("cart-panel").style.right = "0";
}

function changeQuantity(index, delta) {
    cart[index].quantity += delta;
    if (cart[index].quantity <= 0) {
        cart.splice(index, 1);
    }
    updateCart();
}

document.addEventListener("DOMContentLoaded", () => {
    const cartPanel = document.getElementById("cart-panel");

    document.querySelectorAll(".add-to-cart").forEach(button => {
        button.addEventListener("click", () => {
            const name = button.getAttribute("data-name");
            const price = parseFloat(button.getAttribute("data-price"));
            addToCart(name, price);
        });
    });

    document.getElementById("close-cart").addEventListener("click", () => {
        cartPanel.style.right = "-400px";
    });

    // Place order button
    document.getElementById("place-order").addEventListener("click", () => {
        if (cart.length === 0) {
            alert("Your cart is empty.");
            return;
        }

        fetch("PlaceOrderServlet", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(cart)
        })
        .then(response => {
            if (response.ok) {
                alert("Order placed successfully!");
                cart = [];
                updateCart();
                cartPanel.style.right = "-400px";
                window.location.href = "orderSuccess.jsp";
            } else {
                alert("Failed to place order.");
            }
        })
        .catch(error => {
            console.error("Error:", error);
            alert("An error occurred while placing the order.");
        });
    });
});
