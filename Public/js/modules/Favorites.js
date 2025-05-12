import { USER_ID } from "../config.js";
import Routers from "../services/ProductService.js";

let cachedFavorites = null;

async function loadCache() {
    if (!USER_ID) return;
    const results = await Routers.favorites.getAll({ user_fk: USER_ID });
    cachedFavorites = results.map(fav => fav.product_component_item_fk);
}

function contains(itemID) {
    return cachedFavorites?.includes(itemID) ?? false;
}

async function asyncContains(itemID) {
    if (!USER_ID) return false;
    const results = await Routers.favorites.getAll({
        user_fk: USER_ID,
        product_component_item_fk: itemID
    });
    return results.length > 0;
}

async function toggle(itemID) {
    if (!USER_ID) return;
    const isFav = await asyncContains(itemID);
    if (isFav) {
        const results = await Routers.favorites.getAll({
            user_fk: USER_ID,
            product_component_item_fk: itemID
        });
        await Promise.all(results.map(fav => remove(fav.id)));
    } else {
        await add(itemID);
    }
    await loadCache(); // On recharge le cache à jour
}

async function add(itemID) {
    if (!USER_ID) return;
    await Routers.favorites.post({
        user_fk: USER_ID,
        product_component_item_fk: itemID
    });
}

async function remove(id) {
    await Routers.favorites.remove(id);
}

const Favorites = {
    loadCache,
    contains,
    asyncContains,
    toggle,
    add,
    remove, cachedFavorites
};

export default Favorites;