var sellingPriceLabel = document.getElementById('sellingPrice');
var privateDebtLabel = document.getElementById('privateDebt');
var valueResidueLabel = document.getElementById('valueResidue');
sellingPriceLabel.style.display = "none";
privateDebtLabel.style.display = "none";
valueResidueLabel.style.display = "none";
var sellingPrice = 0;
var privateDebt = 0;
var valueResidue = 0;



function handleHasSoldHouseChange(checkBox) { 
    if(checkBox.checked){
        sellingPriceLabel.style.display = "block";
        privateDebtLabel.style.display = "block";
        valueResidueLabel.style.display = "block";
    } else {
        sellingPriceLabel.style.display = "none";
        privateDebtLabel.style.display = "none";
        valueResidueLabel.style.display = "none";
    }
}

function handleHasBoughtHouseChange(checkBox) {

}

function handleHasMaintLoanChange(checkBox) {

}

function handleSellingPriceChange(numInput) {
    if (numInput == "") {
        setSellingPrice(0)
    } else {
        setSellingPrice(parseFloat(numInput))
    }
    setValueResidue()
}

function setSellingPrice(value) {
    sellingPrice = value
}
  
function handlePrivateDebtChange(numInput) {
    if (numInput == "") {
        setPrivateDebt(0)
    } else {
        setPrivateDebt(parseFloat(numInput))
    }
    setValueResidue()
}

function setPrivateDebt(value) {
    privateDebt = value
}

function setValueResidue() {
    valueResidue = sellingPrice - privateDebt
    valueResidueLabel.innerHTML = "Value residue: " + valueResidue + "<br><br>"
}

