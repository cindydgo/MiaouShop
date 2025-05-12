import { PRODUCT_RATING_MIN } from "../config.js";
import { getRandomPercent } from "../utils/Rating.js";

function add(items) {
    const ratings = getAll();
    items.forEach(itemID => {
        if (!ratings.hasOwnProperty(itemID)) {
            ratings[itemID] = getRandomPercent(PRODUCT_RATING_MIN);
        }
    });
    set(ratings);
}

function set(ratings) {
    localStorage.setItem('ratings', JSON.stringify(ratings));
}

function getAll() {
    return JSON.parse(localStorage.getItem('ratings')) ?? {};
}

function getOne(itemID) {
    const ratings = getAll();
    return ratings[itemID] ?? null;
}

const Rating = { add, getOne };
export default Rating;