import Routers from "../services/ProductService.js";
import CreateElement from "../utils/CreateElement.js";

let searchInput = null;
let resultBox = null;

const normalizeString = string => string.toLowerCase().trim();

const resultBoxShow = () => resultBox.style.display = 'block';

const resultBoxHidde = () => resultBox.style.display = 'none';

const resultBoxClear = () => resultBox.innerText = '';

const searchInputClear = () => searchInput.value = '';

export async function initSearchBar() {
    searchInput = document.getElementById("SearchInput");
    resultBox = document.getElementById("SearchResults");

    searchInput.addEventListener('input', async () => {
        const userInput = searchInput.value.trim();
        if (userInput.length < 2) {
            resultBoxClear();
            resultBoxHidde();
            return;
        }

        const items = await searchProducts(userInput);
        updateFindListItems(items);
    });

    document.addEventListener('click', event => {
        if (!document.getElementById("SearchBar").contains(event.target)) {
            searchInputClear();
            resultBoxClear();
            resultBoxHidde();
        }
    })
}

async function searchProducts(input) {
    const keyWord = normalizeString(input);
    try {
        return await Routers.productComponentItems.getAll({ like: keyWord });
    } catch (err) {
        console.error("Une erreur est survenue lors d'une recherche :", err);
        return [];
    }
}

function createFindListItem(product) {
    const listElement = CreateElement.getTag('li', {
        content: `${product.name}`,
        class: 'list-group-item'
    });

    listElement.addEventListener('click', () => {
        window.location.hash = `#product/${product.id}`;
        searchInputClear();
        resultBoxClear();
        resultBoxHidde()
    });

    return listElement;
}

function updateFindListItems(items) {
    resultBoxClear();
    if (resultBox.length === 0) {
        resultBoxHidde();
        return;
    }

    items.forEach(item => {
        resultBox.appendChild(createFindListItem(item));
    });
    resultBoxShow();
}
