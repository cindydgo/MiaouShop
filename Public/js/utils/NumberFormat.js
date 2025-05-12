function getFormattedPrice(number) {
    let formattedPrice;

    if (typeof number !== 'number') number = parseFloat(number);

    if (!Number.isInteger(number)) {
        const [intPart, decimalPart] = number.toFixed(2).split(".");
        formattedPrice = `${intPart}€<sup>${decimalPart}</sup>`;
    } else {
        formattedPrice = `${number} €`;
    }
    return formattedPrice;
}

export { getFormattedPrice };