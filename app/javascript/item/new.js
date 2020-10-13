
window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input",() => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const addProfit = document.getElementById("profit")
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    addProfit.innerHTML = Math.floor(inputValue * 0.9);
  });
});