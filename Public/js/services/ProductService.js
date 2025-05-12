import Router from '../api/Router.js';

const Routers = {
    brands: Router('brands'),
    generations: Router('generations'),
    productTypes: Router('product_types'),
    productRanges: Router('product_ranges'),
    productComponents: Router('product_components'),
    productComponentItems: Router('product_component_items'),
    shopping_carts: Router('shopping_carts'),
    favorites: Router('favorite')
};

export default Routers;