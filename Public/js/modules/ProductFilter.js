import Routers from "../services/ProductService.js";
import {createProductCard} from "./ProductCard.js";

const PRODUCTS_LIST = new Map();

export async function productFilter(source = 'other') {
    const filters = {};

    const checkedBrands = Array.from(
        document.querySelectorAll('#BrandFilter input[type="checkbox"]:checked')
    ).map(cb => parseInt(cb.value));
    if (checkedBrands.length > 0) filters.brand_fk = checkedBrands;

    const activeComponent = document.querySelector('#ComponentFilter .active');
    if (activeComponent) filters.product_component_fk = parseInt(activeComponent.dataset.id);

    const generationSelected = document.getElementById('GenerationSelect');
    if (generationSelected?.value) filters.generation_fk = parseInt(generationSelected.value);

    const rangeSelected = document.getElementById('RangeSelect');
    if (rangeSelected?.value) filters.product_range_fk = parseInt(rangeSelected.value);

    if (source === 'slider') {
        const slider = document.getElementById('PriceSlider');
        filters.max_price = parseInt(slider.value);
    }

    const filteredItems = await Routers.productComponentItems.getAll(filters);
    displayProducts(filteredItems, source);
}

export async function clearCache() {
    PRODUCTS_LIST.clear();
}

function displayProducts(data, source) {
    const container = document.getElementById('ProductsContainer');
    container.innerText = '';
    data.forEach(product => {
        if (PRODUCTS_LIST.has(product.id)) {
            container.appendChild(PRODUCTS_LIST.get(product.id));
        } else {
            const productNode = createProductCard(product);
            container.appendChild(productNode);
            PRODUCTS_LIST.set(product.id, productNode);
        }
    });

    if (source !== 'slider') {
        setSlider(data);
    }
}

function setSlider(products) {
    const slider = document.getElementById('PriceSlider');
    const maxPriceContainer = document.getElementById('MaxPrice');
    const priceVal = document.getElementById('PriceVal');

    if (!products || products.length === 0) return;

    const prices = products.map(p => p.price);
    const x = Math.max(...prices);
    const maxPrice = Math.ceil(x / 100) * 100;

    slider.max = maxPrice;
    slider.value = maxPrice;
    maxPriceContainer.innerText = `${maxPrice} €`;
    priceVal.innerText = `${maxPrice} €`;
}