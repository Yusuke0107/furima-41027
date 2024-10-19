const price = () => {

  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = parseFloat(priceInput.value);

  if (!isNaN(inputValue) && inputValue >= 300) {
    const tax = inputValue * 0.1;
    const profit = inputValue - tax;

    addTaxDom.innerHTML = Math.floor(tax);
    profitDom.innerHTML = Math.floor(profit);
    } else {
    addTaxDom.innerHTML = "";
    profitDom.innerHTML = "";
    }
  });
  updateDisplay(parseFloat(priceInput.value));

  priceInput.addEventListener("input", () => {
    const inputValue = parseFloat(priceInput.value);
    updateDisplay(inputValue);
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);