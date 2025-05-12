import { USER_ID } from "../config.js";
import Routers from "../services/CartService.js";
import createElement from "../utils/CreateElement.js";

import { getFormattedPrice } from "../utils/NumberFormat.js";

async function setSummarySection(data = null) {
    if (!data) data = await Routers.shopping_carts.getByUserId(USER_ID);
    const summaryContainer = document.getElementById("cart-summary-items");
    const totalPriceContainer = document.getElementById('cart-total');

    summaryContainer.innerHTML = "";

    let totalPrice = 0;
    data.forEach(item => {
        summaryContainer.appendChild(createSummaryItem(item));
        totalPrice += parseFloat(item.price);
    });
    totalPriceContainer.innerHTML = getFormattedPrice(totalPrice);
}

function createSummaryItem(data) {
    const id = data.cart_id;
    const container = createElement.getTag('div', {
        class: "d-flex justify-content-between",
        dataset: { id }
    });
    const itemName = createElement.getTag('span', { content: data.name });
    const itemPrice = createElement.getTag('span', { content: getFormattedPrice(data.price) });
    container.append(itemName, itemPrice);
    return container;
}

export default setSummarySection;