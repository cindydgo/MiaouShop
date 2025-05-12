import Routers from "../services/ProductService.js";
import { PRODUCT_ALTERNATIVE_IMAGE } from "../config.js";
import createElement from "../utils/CreateElement.js";

import { getFormattedPrice } from "../utils/NumberFormat.js";
import setSummarySection from "./CartSummary.js";

function createProductList(data) {
    const id = data.cart_id;
    const container = createElement.getTag('div', {
        class: "d-flex align-items-center p-3 bg-white rounded shadow gap-3",
        dataset: { id }
    });

    container.append(
        createImageElement(data.image),
        createLeftSection(data.name, data.description, data.quantity),
        createRightSection(id, data.price)
    );

    return container;
}

function createLeftSection(name, description, quantity) {
    const container = createElement.getTag('div', {class: "flex-grow-1"});
    const itemQuantity = createElement.getTag('div', { content: `Quantité : ${quantity || 1}` });
    const itemName = createElement.getTag('div', {
        content: name,
        class: "fw-bold"
    });
    const itemDescription = createElement.getTag('div', {
        content: description,
        class: "text-muted small"
    });

    container.append(itemName, itemDescription, itemQuantity);
    return container;
}

function createRightSection(id, price) {
    const container = createElement.getTag('div', { class: "text-end" });
    const itemPrice = createElement.getTag('div', {
        content: getFormattedPrice(price),
        class: "fw-bold"
    });
    const itemRemoveBtn = createElement.getTag('button', {
        content: 'Supprimer',
        class: "btn btn-sm btn-outline-danger mt-2"
    });

    itemRemoveBtn.addEventListener('click', async () => {
        await Routers.shopping_carts.remove(id);
        await setSummarySection();
        document.querySelector(`#cart-products-list [data-id="${id}"]`)?.remove();
    });

    container.append(itemPrice, itemRemoveBtn);
    return container;
}

function createImageElement(image) {
    return createElement.getTag('img', {
        src: image,
        altSrc: PRODUCT_ALTERNATIVE_IMAGE,
        alt: "product_image",
        style: "width: 60px; height: 60px; object-fit: cover; border-radius: 6px;"
    });
}

const cartList = { createProductList };
export default cartList;