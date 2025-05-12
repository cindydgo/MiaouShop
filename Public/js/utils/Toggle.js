function vertical(element) {
    if (!element) return;

    const isOpen = element.classList.contains('open-vertical');

    if (isOpen) {
        element.style.height = element.scrollHeight + 'px';
        requestAnimationFrame(() => {
            element.style.height = '0px';
        });

        const cleanup = () => {
            element.classList.remove('open-vertical');
            element.removeEventListener('transitionend', cleanup);
        };

        element.addEventListener('transitionend', cleanup);
    } else {
        element.classList.add('open-vertical');
        const fullHeight = element.scrollHeight + 'px';
        element.style.height = '0px';

        requestAnimationFrame(() => {
            element.style.height = fullHeight;
        });

        const cleanup = () => {
            element.style.height = 'auto';
            element.removeEventListener('transitionend', cleanup);
        };

        element.addEventListener('transitionend', cleanup);
    }
}

function horizontal(element) {
    if (!element) return;

    if (element.classList.contains('open-horizontal')) {
        element.style.width = element.scrollWidth + 'px';
        requestAnimationFrame(() => {
            element.style.width = '0';
        });
        element.classList.remove('open-horizontal');
    } else {
        element.style.width = 'auto';
        const width = element.scrollWidth + 'px';
        element.style.width = '0';
        requestAnimationFrame(() => {
            element.style.width = width;
        });
        element.classList.add('open-horizontal');
    }
}

const Toggle = { vertical, horizontal };
export default Toggle;