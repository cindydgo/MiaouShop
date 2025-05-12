import Routers from "../../js/services/ProductService.js";
import setProductTemplate from "../../js/modules/ProductDetail.js";

export async function init(product_id) {
    const data = await Routers.productComponentItems.getOne(product_id);
    setProductTemplate(data);
}