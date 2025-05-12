import { USER_ID } from "../config.js";
import Router from '../services/CartService.js'

function contains(itemID) {
    const cart = getAll();
    return cart.hasOwnProperty(itemID);
}

function increment(itemID) {
    const cart = getAll();
    cart[itemID] = (cart[itemID] ?? 0) + 1;
    set(cart);
}

function decrement(itemID) {
    const cart = getAll();
    if (cart[itemID] > 1) {
        cart[itemID]--;
    } else {
        delete cart[itemID];
    }
    set(cart);
}

function update(itemID, nbItems) {
    const cart = getAll();
    if (nbItems <= 0) {
        delete cart[itemID];
    } else {
        cart[itemID] = nbItems;
    }
    set(cart);
}

// function getAll() {
//     return JSON.parse(localStorage.getItem("cart")) ?? {};
// }

function count() {
    const x = getAll();
    return x.length;
}

function getOne(itemID) {
    const cart = getAll();
    return cart[itemID] ?? {};
}

function set(cart) {
    localStorage.setItem("cart", JSON.stringify(cart));
}

function clear(itemID) {
    const cart = getAll();
    delete cart[itemID]
    set(cart);
}

function getAll(){
    return USER_ID ? Router.shopping_carts.getByUserId(USER_ID) : null;
}

const Cart = { count, getAll, set, clear, getOne, contains,
    increment,
    decrement,
    update };
export default Cart;