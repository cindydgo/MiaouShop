import Routers from "../../js/services/ProductService.js";
import createElement from "../../js/utils/CreateElement.js";
import { productFilter, clearCache } from "../../js/modules/ProductFilter.js";

export async function init() {
    await generateFilters();
    await clearCache();
    await productFilter();
}

async function generateFilters() {
    const brands = await Routers.brands.getAll();
    const ranges = await Routers.productRanges.getAll();
    const components = await Routers.productComponents.getAll();
    const generations = await Routers.generations.getAll();

    buildBrandsCheckboxes(brands);
    buildRangeSelect(ranges);
    buildGenerationSelect(generations);
    buildComponentButtons(components);

    const slider = document.getElementById('PriceSlider');
    slider.addEventListener('input', () => {
        document.getElementById('PriceVal').innerText = `${slider.value} €`;
        productFilter('slider');
    });
}

function buildBrandsCheckboxes(brands) {
    const container = document.getElementById('BrandFilter');

    cleanContents(container);

    brands.forEach(({ id, brand_name }) => {
        const checkBox = createElement.getTag('input', {
            type: 'checkbox',
            id: `brand-${id}`,
            class: 'form-check-input',
            value: id
        });

        const label = createElement.getTag('label', {
            for: `brand-${id}`,
            class: 'form-check-label',
            content: brand_name
        });

        checkBox.addEventListener('change', productFilter);

        const wrapper = createElement.getTag('div', { class: 'form-check' });
        wrapper.append(checkBox, label);
        container.appendChild(wrapper);
    });
}

function buildComponentButtons(components) {
    const container = document.getElementById('ComponentFilter')
        || createFilterBlock('Composants', 'ComponentFilter');

    cleanContents(container);

    components.forEach(({ id, name }) => {
        const button = createElement.getTag('button', {
            class: 'btn btn-outline-primary btn-sm m-1',
            content: name,
            dataset: { id }
        });

        button.addEventListener('click', () => {
            container.querySelectorAll('button')
                .forEach(btn => btn.classList.remove('active'));

            button.classList.add('active');
            productFilter();
        });

        container.appendChild(button);
    });
}

function buildGenerationSelect(generations) {
    const container = document.getElementById('GenerationFilter')
        || createFilterBlock('Génération', 'GenerationFilter');

    cleanContents(container);

    const select = createElement.getTag('select', {
        class: 'form-select',
        id: 'GenerationSelect'
    });

    const defaultOption = createElement.getTag('option', { value: '', content: 'Toutes générations' });
    select.appendChild(defaultOption);

    generations.forEach(({ id, name }) => {
        const option = createElement.getTag('option', { value: id, content: name });
        select.appendChild(option);
    });

    select.addEventListener('change', productFilter);
    container.appendChild(select);
}

function buildRangeSelect(ranges) {
    const container = document.getElementById('RangeFilter')
        || createFilterBlock('Modèle', 'RangeFilter');

    cleanContents(container);

    const select = createElement.getTag('select', {
        class: 'form-select',
        id: 'RangeSelect'
    });

    const defaultOption = createElement.getTag('option', { value: '', content: 'Tous les modèles' });
    select.appendChild(defaultOption);

    ranges.forEach(({ id, name }) => {
        const option = createElement.getTag('option', { value: id, content: name });
        select.appendChild(option);
    });

    select.addEventListener('change', productFilter);
    container.appendChild(select);
}

function createFilterBlock(title, id) {
    const form = document.getElementById('FilterSidebar');
    const wrapper = createElement.getTag('div', { class: 'mb-3', id: id });
    const label = createElement.getTag('label', {
        class: 'form-label fw-bold',
        content: title
    });

    wrapper.appendChild(label);
    form.appendChild(wrapper);
    return wrapper;
}

function cleanContents(container) {
    if (container) container.innerText = '';
}