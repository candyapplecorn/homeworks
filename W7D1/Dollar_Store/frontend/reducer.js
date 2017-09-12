const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const reducer = (state = initialState, action) => {
  switch (action.type){
    case ("SWITCH_CURRENCY"):
      const { baseCurrency, rates } = action
      return { baseCurrency, rates };
      break;
    case ("LOADING_CURRENCY"):
      return {
        baseCurrency: `loading ${action.baseCurrency}...`,
        rates: []
      }
      break;
    default:
      return state; // remove this and fill out the body of the reducer function
  }
};

window.reducer = reducer;
export default reducer;
