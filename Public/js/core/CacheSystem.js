const CACHE_DATA = new Map();

function CacheSystem(items_key) {
    function add(item, overwrite = false) {
        const cacheItems = get();
        if (overwrite || !cacheItems.includes(item)) {
            cacheItems.push(item);
            set(cacheItems);
        }
    }

    function set(items) {
        CACHE_DATA.set(items_key, items);
    }

    function get() {
        return exists() ? CACHE_DATA : [];
    }

    function exists() {
        return CACHE_DATA.has(items_key);
    }

    function clear() {
        CACHE_DATA.delete(items_key);
    }

    function clearAll() {
        CACHE_DATA.clear();
    }

    return { add, set, get, exists, clear, clearAll };
}

export default CacheSystem;