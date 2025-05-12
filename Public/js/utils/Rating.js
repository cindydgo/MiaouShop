export function getRatingComponent(ratingPercent, nbStars) {
    const filledStars = getStarNumber(ratingPercent, nbStars);
    return createRatingComponent(filledStars, nbStars);
}

export function getRandomPercent(min = 0, max = 100) {
    return Math.random() * (max - min) + min;
}

function createRatingComponent(filledStars, nbStars) {
    const container = document.createElement('div');
    container.className = "rating";

    for (let i = 0; i<nbStars; i++) {
        const icon = document.createElement('i');
        if (filledStars > i) {
            setStarStyle(icon, (filledStars < (i + 1)) ? 'half' : 'fill');
        } else {
            setStarStyle(icon);
        }

        container.appendChild(icon);
    }

    return container;
}

function getStarNumber(percent, nbStars) {
    percent = Math.max(0, Math.min(percent, 100));
    const number = percent * nbStars / 100;
    return Math.round(number * 2) / 2;
}

function setStarStyle(node, starType) {
    let style;
    switch (starType) {
        case 'fill':
            style = "bi bi-star-fill text-warning";
            break;
        case 'half':
            style = "bi bi-star-half text-warning";
            break;
        default:
            style = "bi bi-star text-warning";
    }
    node.className = style;
}