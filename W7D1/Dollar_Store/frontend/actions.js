export const selectCurrency = (baseCurrency, rates) => ({
    type: "SWITCH_CURRENCY",
    baseCurrency,
    rates
});
export const loadingCurrency = (baseCurrency) => ({
    type: "LOADING_CURRENCY",
    baseCurrency
});
//export selectCurrency;
