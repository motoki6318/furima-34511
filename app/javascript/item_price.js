function getPrice() {
  const inputPrice = document.getElementById("item-price")
  inputPrice.addEventListener("input", () => {
    const inputValue = inputPrice.value
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = inputValue * 0.1
    const addProfitDom = document.getElementById("profit")
    addProfitDom.innerHTML = inputValue - (inputValue * 0.1)
  })
}
window.addEventListener('load',getPrice)