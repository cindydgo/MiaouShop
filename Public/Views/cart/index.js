import { USER_ID } from "../../js/config.js";
import Routers from "../../js/services/CartService.js";
import cartList from "../../js/modules/CartList.js";
import setSummarySection from "../../js/modules/CartSummary.js";

export async function init() {
    if (!USER_ID) return;
    const data = await Routers.shopping_carts.getByUserId(USER_ID);
    console.log("Données récupérées du panier :", data);
    await displayShoppingCart(data)
    await setSummarySection(data);
    //setPurchaseButton();
}

function displayShoppingCart(cartItems) {
    const cartContainer = document.getElementById("cart-products-list");
    cartContainer.innerHTML = "";

    if (!Array.isArray(cartItems)) {
        console.warn("Données invalides pour displayShoppingCart :", cartItems);
        return;
    }

    cartItems.forEach(item => cartContainer.appendChild(cartList.createProductList(item)));
}

function setPurchaseButton() {
    document.getElementById('purchase-button').addEventListener('click', async () => {
        // Intégrer l'appel à Stripe
    });
}

// async function displayShoppingCart(data) {

//     let result = await getShoppingCart()

//     console.log(result,' result avant le display')

//     const container = document.getElementById('shopping_cart_display');

//     if (data.length === 0) {
//         container.innerHTML = '<p class="fw-bold text-center">Votre panier est vide !</p>'
//         return;
//     }

//     data.forEach(product => {
//         product.addEventListener('click', event => {
//             const eTarget = event.target.parentNode;
//             if (eTarget.classList.contains('Panier')) {
//                 product.remove();
//             }
//         });
//         container.appendChild(product);
//     });
// }

// async function getShoppingCart(id) {
//     return result = Cart.getAll(id)
// }
// back en fonction de l'id user