import { USER_ID } from "../../js/config.js";
import Favorites from "../../js/modules/Favorites.js";
import Routers from "../../js/services/ProductService.js";
import { createProductCard } from "../../js/modules/ProductCard.js";

export async function init() {
    const data = await getFavorites();
    displayFavoriteCards(data);
}

function displayFavoriteCards(cards) {
    const container = document.getElementById('FavoritesList');
    container.innerHTML = '';

    if (cards.length === 0) {
        container.innerHTML = '<p class="fw-bold text-center">Votre liste de favoris est vide !</p>';
        return;
    }

    cards.forEach(card => {
        container.appendChild(card);
    });
}

async function getFavorites() {
    if (!USER_ID) return [];
    const result = await Routers.favorites.getAll({ user_fk: USER_ID });

    const cards = await Promise.all(result.map(async fav => {
        const productData = await Routers.productComponentItems.getOne(fav.product_component_item_fk);
        const card = createProductCard(productData);

        const favBtn = card.querySelector('.favorite i');
        if (favBtn) {
            favBtn.addEventListener('click', async () => {
                await Favorites.toggle(productData.id);
                card.remove();

                if (document.getElementById('FavoritesList').children.length === 0) {
                    displayFavoriteCards([]);
                }
            });
        }

        return card;
    }));

    return cards;
}
