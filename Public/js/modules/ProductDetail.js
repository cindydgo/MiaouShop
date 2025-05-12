import { PRODUCT_ALTERNATIVE_IMAGE, PRODUCT_RATING_STARS, USER_ID } from "../config.js";
import Router from "../services/ProductService.js";

import createElement from "../utils/CreateElement.js";
import Toggle from "../utils/Toggle.js";
import { getFormattedPrice } from "../utils/NumberFormat.js";
import { getRatingComponent } from "../utils/Rating.js";

import Rating from "./Rating.js";
import Favorites from "./Favorites.js";

const setFavoriteButton = (id, btnIcon, btnText) => {
    if (Favorites?.contains(id)) {
        btnIcon.className = "bi bi-heart-fill me-1";
        btnText.innerText = "Retirer des favoris";
    } else {
        btnIcon.className = "bi bi-heart me-1";
        btnText.innerText = "Ajouter aux favoris";
    }
}

function setProductTemplate(product_data) {
    setProductImage('x', PRODUCT_ALTERNATIVE_IMAGE);
    setProductName(product_data.name);
    setProductBrand(product_data.brand_name, {src: product_data.logo, altSrc: PRODUCT_ALTERNATIVE_IMAGE});
    setProductDescription(product_data.description);
    setProductPrice(product_data.price);
    setProductRating(Rating.getOne(product_data.id));
    setButtons(product_data.id);
}

function setProductImage(src, altSrc) {
    const node = document.getElementById('productImage');
    createElement.setTag(node, {
        src: src,
        altSrc: altSrc
    });
}

function setProductName(name) {
    const container = document.getElementById('productName');
    createElement.setTag(container, { content: name });
}

function setProductBrand(brandName, brandLogo) {
    const brandNameContainer = document.getElementById('brandName');
    const brandLogoContainer = document.getElementById('brandLogo');

    createElement.setTag(brandNameContainer, { content: brandName });
    createElement.setTag(brandLogoContainer, {
        src: brandLogo.src,
        altSrc: brandLogo.altSrc
    });
}

function setProductDescription(description) {
    const container = document.getElementById('productDescription');
    createElement.setTag(container, { content: description });
}

function setProductPrice(price) {
    const container = document.getElementById('productPrice');
    createElement.setTag(container, { content: getFormattedPrice(price) });
}

function setProductRating(rating) {
    const container = document.getElementById('productRating');
    const ratingComponent = getRatingComponent(
        typeof rating === 'number' ? rating : 0,
        PRODUCT_RATING_STARS
    );
    container.appendChild(ratingComponent);
}

function setButtons(product_id) {
    const cartButton = document.getElementById('addToCart');
    const favoritesButton = document.getElementById('addToFavorites');
    const manufacturerButton = document.getElementById('manufacturerBtn');
    const descriptionButton = document.getElementById('descriptionBtn');

    const favoritesIcon = favoritesButton.querySelector('i');
    const favoritesText = favoritesButton.querySelector('span');

    setFavoriteButton(product_id, favoritesIcon, favoritesText);

    cartButton.addEventListener('click', async () => {
        if (!USER_ID) return;
        await Router.shopping_carts.post({
            user_fk: USER_ID,
            product_component_item_fk: product_id,
            quantity: 1,
            created_at: new Date().toISOString().slice(0, 19).replace("T", " ")
        })
    });

    favoritesButton.addEventListener('click', () => {
        Favorites.toggle(product_id);
        setFavoriteButton(product_id, favoritesIcon, favoritesText);
        console.log(Favorites.get());
    });

    manufacturerButton.addEventListener('click', () => {
        Toggle.vertical(document.getElementById('manufacturerSection'));
        manufacturerButton.classList.toggle('chevron-active');
    });

    descriptionButton.addEventListener('click', () => {
        Toggle.vertical(document.getElementById('descriptionSection'));
        descriptionButton.classList.toggle('chevron-active');
    });
}

export default setProductTemplate;