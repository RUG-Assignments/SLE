// generateLabels
var hasMaintLoanLabel = document.getElementById('hasMaintLoanLabel');
var hasSoldHouseLabel = document.getElementById('hasSoldHouseLabel');
var privateDebtLabel = document.getElementById('privateDebtLabel');
var sellingPriceLabel = document.getElementById('sellingPriceLabel');
var hasBoughtHouseLabel = document.getElementById('hasBoughtHouseLabel');
var valueResidueLabel = document.getElementById('valueResidueLabel');

// generateInputs
var hasMaintLoanInput = document.getElementById('hasMaintLoanInput');
var hasSoldHouseInput = document.getElementById('hasSoldHouseInput');
var privateDebtInput = document.getElementById('privateDebtInput');
var sellingPriceInput = document.getElementById('sellingPriceInput');
var hasBoughtHouseInput = document.getElementById('hasBoughtHouseInput');

// generateVars
var hasMaintLoan = false;
var hasSoldHouse = false;
var sellingPrice = 0;
var privateDebt = 0;
var hasBoughtHouse = false;
var valueResidue = 0;

// additionalFuncs
conditionsEval();
function text2num(text) {
    if (text == "") {
        return 0;
    } else {
        return parseFloat(text);
    }
}

// generateFunctions
function handlehasMaintLoanChange(input) {
    hasMaintLoan = true ? input.checked : false;
    computevalueResidue();
    conditionsEval();
}

function handlehasSoldHouseChange(input) {
    hasSoldHouse = true ? input.checked : false;
    computevalueResidue();
    conditionsEval();
}

function handleprivateDebtChange(input) {
    privateDebt = text2num(input);
    computevalueResidue();
    conditionsEval();
}

function handlesellingPriceChange(input) {
    sellingPrice = text2num(input);
    computevalueResidue();
    conditionsEval();
}

function handlehasBoughtHouseChange(input) {
    hasBoughtHouse = true ? input.checked : false;
    computevalueResidue();
    conditionsEval();
}

// conditionals
function conditionsEval() {
    if (hasSoldHouse) {
        sellingPriceLabel.style.display = "block";
        privateDebtLabel.style.display = "block";
        valueResidueLabel.style.display = "block";
    } else {
        sellingPriceLabel.style.display = "none";
        privateDebtLabel.style.display = "none";
        valueResidueLabel.style.display = "none";
    }
}

// computed questions
function updatevalueResidueLabel() {
    valueResidueLabel.innerHTML = "Value residue:" + valueResidue + "<br><br>";
}

function computevalueResidue() {
    valueResidue = sellingPrice - privateDebt;
    updatevalueResidueLabel();
}