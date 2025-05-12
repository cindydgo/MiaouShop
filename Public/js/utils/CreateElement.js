function getTag(type, attrs) {
    const node = document.createElement(type);
    setTag(node, attrs);
    return node;
}

function setTag(node, attrs) {
    if (!node || typeof attrs !== 'object') return;
    for (const [key, value] of Object.entries(attrs)) {
        switch (key) {
            case 'content':
                node.innerHTML = value;
                break;
            case 'altSrc':
                addAlternativeSource(node, value);
                break;
            case 'dataset':
                addDataset(node, value);
                break;
            default:
                addAttribute(node, key, value);
        }
    }
}

function addAttribute(node, key, value) {
    try {
        node.setAttribute(key, value);
    } catch (err) {
        console.warn(err);
        if (node.hasAttribute(key)) {
            node.removeAttribute(key);
        }
    }
}

function addAlternativeSource(node, altSrc) {
    if (!altSrc) return;
    node.onerror = () => {
        node.onerror = null;
        node.src = altSrc;
    };
}

function addDataset(node, data) {
    if (typeof data !== 'object') return;
    for (const [key, value] of Object.entries(data)) {
        node.dataset[key] = value;
    }
}

const CreateElement = { getTag, setTag };
export default CreateElement;