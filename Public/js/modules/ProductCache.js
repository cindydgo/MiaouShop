import CacheSystem from "../core/CacheSystem.js";
import { createProductCard } from "./ProductCard.js";
import { dummy_products } from "../tmp/products.js";

const PRODUCTS_CACHE_KEY = "test";

function load() {
    const products = getFormattedData(dummy_products);
    CacheSystem.set(PRODUCTS_CACHE_KEY, products);
}

function update(data) {
    const cacheData = get();
    const products = getFormattedData(data);

    products.forEach(product => {
        if (!cacheData.includes(product.id)) {
            cacheData.push(product);
        }
    });

    CacheSystem.set(PRODUCTS_CACHE_KEY, cacheData, true);
}

function get() {
    if (!CacheSystem.exists(PRODUCTS_CACHE_KEY)) load();
    return CacheSystem.get(PRODUCTS_CACHE_KEY) ?? [];
}

function getFormattedData(data) {
    const formattedData = [];
    data.forEach(product => {
        if (!product.hasOwnProperty("node")) {
            product["node"] = createProductCard(product);
            formattedData.push(product);
        }
    });
    return formattedData;
}

const ProductCache = { load, get, update };
export default ProductCache;

