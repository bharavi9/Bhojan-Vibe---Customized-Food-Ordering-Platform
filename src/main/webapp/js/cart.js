let selectedItems = [];

function selectItem(idSafeName, price, displayName) {
    const qtyInput = document.getElementById("qty_" + idSafeName);
    const qty = parseInt(qtyInput.value);

    if (isNaN(qty) || qty <= 0) {
        alert("Please enter valid quantity for " + displayName);
        return;
    }

    const index = selectedItems.findIndex(item => item.name === displayName);
    if (index > -1) {
        selectedItems[index].qty += qty;
    } else {
        selectedItems.push({ name: displayName, price, qty });
    }

    alert(`${qty} x ${displayName} added to order.`);
}

function calculateTotal() {
    return selectedItems.reduce((sum, item) => sum + item.price * item.qty, 0);
}

function placeOrder() {
    if (selectedItems.length === 0) {
        alert("No items selected!");
        return;
    }

    const orderData = {
        items: selectedItems,
        totalAmount: calculateTotal()
    };

    document.getElementById("orderData").value = JSON.stringify(orderData);
    document.getElementById("orderForm").submit();
}

function filterMenu(category) {
    document.querySelectorAll(".filter-btn").forEach(btn => btn.classList.remove("active"));
    event.target.classList.add("active");

    const cards = document.querySelectorAll(".card");
    cards.forEach(card => {
        if (category === "all" || card.classList.contains(category)) {
            card.style.display = "block";
        } else {
            card.style.display = "none";
        }
    });
}
