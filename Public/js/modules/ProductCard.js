import { USER_ID, PRODUCT_ALTERNATIVE_IMAGE, PRODUCT_RATING_STARS } from "../config.js";
import Router from "../services/ProductService.js";
import CreateElement from "../utils/CreateElement.js";
import Rating from "./Rating.js";
import Favorites from "./Favorites.js";

import { getFormattedPrice } from "../utils/NumberFormat.js";
import { getRatingComponent } from "../utils/Rating.js";

export function createProductCard(cardData) {
    const mainContainer = CreateElement.getTag('div', {
        class: "col-12 col-sm-6 col-lg-4 mb-4 mt-0"
    });

    const cardContainer = CreateElement.getTag('div' ,{
        class: "product-card"
    });

    cardContainer.append(
        createImageSection(
            cardData.id,
            cardData.image
        ),
        createInfosSection(
            cardData.id,
            cardData.name,
            cardData.description,
            Rating.getOne(cardData.id),
            parseFloat(cardData.price)
        )
    );
    mainContainer.appendChild(cardContainer);

    return mainContainer;
}

function createImageSection(id, image) {
    const imgContainer = CreateElement.getTag('div', {
        class: "product-image-wrapper"
    });

    const imageLink = CreateElement.getTag('a', {
        href: `#product/${id}`
    });

    const productImage = CreateElement.getTag('img', {
        class: "img-fluid rounded product-image",
        src: image,
        alt: "Product image",
        altSrc: PRODUCT_ALTERNATIVE_IMAGE
    });

    imageLink.appendChild(productImage);
    imgContainer.appendChild(imageLink);

    return imgContainer;
}

function createInfosSection(id, name, description, rating, price) {
    const ratingContainer = CreateElement.getTag('div', {
        class: "rating"
    });

    const ratingPriceContainer = CreateElement.getTag('div', {
        class: "d-flex justify-content-between align-items-center mb-3"
    });

    const favoriteIconContainer = CreateElement.getTag('div', {
        class: "favorite"
    });

    const cartFavoriteContainer = CreateElement.getTag('div', {
        class: "d-flex justify-content-between align-items-center mt-auto"
    });

    const cartButton = CreateElement.getTag('div', {
        content: '<i class="bi bi-cart3 me-1"></i> Ajouter au panier',
        class: "btn btn-primary btn-sm add-to-cart-btn",
        // dataset: { id: id } // pour transmettre l'id du produit au fetch

    });

    const infosContainer = CreateElement.getTag('div', {
        class: "p-3 d-flex flex-column justify-content-between h-100"
    });

    const productDescription = CreateElement.getTag('p', {
        content: description,
        class: "product-description mb-2"
    });

    const productTitle = CreateElement.getTag('h6', {
        class: "product-title mb-1"
    });

    const favoriteIcon = CreateElement.getTag('i', {
        class: "bi bi-heart"
    });

    const titleLink = CreateElement.getTag('a', {
        content: name,
        class: "product-link",
        href: `#product/${id}`
    });

    const productPrice = CreateElement.getTag('p', {
        content: getFormattedPrice(price),
        class: "product-price mb-0"
    });

    const productRating = getRatingComponent(
        typeof rating === 'number' ? rating : 0,
        PRODUCT_RATING_STARS
    );

    Favorites.asyncContains(id).then(isFav => {
        favoriteIcon.className = isFav ? "bi bi-heart-fill" : "bi bi-heart";
    });

    cartButton.addEventListener('click', async() => {
        if (!USER_ID) return;
        await Router.shopping_carts.post({
            user_fk: USER_ID,
            product_component_item_fk: id,
            quantity: 1,
            created_at: new Date().toISOString().slice(0, 19).replace("T", " ")
        })
    });

    favoriteIcon.addEventListener('click', async () => {
        await Favorites.toggle(id);
        favoriteIcon.className = Favorites.contains(id)
            ? "bi bi-heart-fill"
            : "bi bi-heart";
    });

    productTitle.appendChild(titleLink);
    favoriteIconContainer.appendChild(favoriteIcon);
    ratingContainer.appendChild(productRating);
    ratingPriceContainer.append(ratingContainer, productPrice);
    cartFavoriteContainer.append(cartButton, favoriteIconContainer);
    infosContainer.append(productTitle, productDescription, ratingPriceContainer, cartFavoriteContainer);

    return infosContainer;
}