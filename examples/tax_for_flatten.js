// generate labels
var jjjjjjLabel = document.getElementById('jjjjjjLabel');
var hasMaintLoanLabel = document.getElementById('hasMaintLoanLabel');
var hasSoldHouseLabel = document.getElementById('hasSoldHouseLabel');
var privateDebtLabel = document.getElementById('privateDebtLabel');
var has222Label = document.getElementById('has222Label');
var sellingPriceLabel = document.getElementById('sellingPriceLabel');
var valueResidueLabel = document.getElementById('valueResidueLabel');
var hasBoughtHouseLabel = document.getElementById('hasBoughtHouseLabel');

// generate inputs
var jjjjjjInput = document.getElementById('jjjjjjInput');
var hasMaintLoanInput = document.getElementById('hasMaintLoanInput');
var hasSoldHouseInput = document.getElementById('hasSoldHouseInput');
var privateDebtInput = document.getElementById('privateDebtInput');
var has222Input = document.getElementById('has222Input');
var sellingPriceInput = document.getElementById('sellingPriceInput');
var hasBoughtHouseInput = document.getElementById('hasBoughtHouseInput');

// generate vars
var jjjjjj = false;
var hasMaintLoan = false;
var hasSoldHouse = false;
var privateDebt = 0;
var has222 = false;
var sellingPrice = 0;
var valueResidue = 0;
var hasBoughtHouse = false;

// additional functions
conditionsEval();
function text2num(text) {
  if (text == "") {
    return 0;
  } else {
    return parseFloat(text);
  }
}

// generate functions
function handlejjjjjjChange(input) {
  jjjjjj = true ? input.checked : false;
  computevalueResidue();
  conditionsEval();
}

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

function handlehas222Change(input) {
  has222 = true ? input.checked : false;
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


// generate conditionals
function conditionsEval() {
  if (true && !hasSoldHouse) {
    jjjjjjLabel.style.display = "block";
  } else {
    jjjjjjLabel.style.display = "none";
  }
  if (true) {
    hasMaintLoanLabel.style.display = "block";
  } else {
    hasMaintLoanLabel.style.display = "none";
  }
  if (true) {
    hasSoldHouseLabel.style.display = "block";
  } else {
    hasSoldHouseLabel.style.display = "none";
  }
  if (true && hasSoldHouse) {
    privateDebtLabel.style.display = "block";
  } else {
    privateDebtLabel.style.display = "none";
  }
  if (true && hasSoldHouse && !hasMaintLoan) {
    has222Label.style.display = "block";
  } else {
    has222Label.style.display = "none";
  }
  if (true && hasSoldHouse) {
    sellingPriceLabel.style.display = "block";
  } else {
    sellingPriceLabel.style.display = "none";
  }
  if (true && hasSoldHouse && hasMaintLoan) {
    valueResidueLabel.style.display = "block";
  } else {
    valueResidueLabel.style.display = "none";
  }
  if (true) {
    hasBoughtHouseLabel.style.display = "block";
  } else {
    hasBoughtHouseLabel.style.display = "none";
  }
}


// generate computed
function updatevalueResidueLabel() {
  valueResidueLabel.innerHTML = "Value residue:" + valueResidue + "<br><br>"
}

function computevalueResidue(){
  valueResidue = sellingPrice - privateDebt;
  updatevalueResidueLabel();
}

