window.addEventListener('load', () => {
  const itemPriceDom = document.getElementById("item-price");
  console.log(itemPriceDom);
  itemPriceDom.addEventListener('input', () => {  
  var input_message = document.getElementById("item-price").value;
  console.log(input_message);
  const fee = document.getElementById("add-tax-price");

    const value_result = input_message * 0.1
    console.log(value_result)
    fee.innerHTML = (Math.floor(value_result));

    const profitNumber = document.getElementById("profit");
    profitNumber.innerHTML = (Math.floor(input_message - value_result));
    console.log(value_result)

  })

});