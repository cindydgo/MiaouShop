import { DEFAULT_PAGE_NAME } from "../config.js";
import { loadPage } from "./PageLoader.js";

export async function handleNavigation() {
    const hash = window.location.hash.substring(1) || DEFAULT_PAGE_NAME;
    const [page, ...params] = hash.split('/');
    await loadPage(page, params);
}