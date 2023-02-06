// generate labels
var x_1_5Label = document.getElementById('x_1_5Label');
var x_3_4Label = document.getElementById('x_3_4Label');
var answer_1_2Label = document.getElementById('answer_1_2Label');
var answer_3_4Label = document.getElementById('answer_3_4Label');
var answer_6_7Label = document.getElementById('answer_6_7Label');
var answer_7_8Label = document.getElementById('answer_7_8Label');
var answer_8_9Label = document.getElementById('answer_8_9Label');
var x_1_3Label = document.getElementById('x_1_3Label');
var x_5_6Label = document.getElementById('x_5_6Label');
var answer_2_3Label = document.getElementById('answer_2_3Label');
var x_5_7Label = document.getElementById('x_5_7Label');
var answer_9_10Label = document.getElementById('answer_9_10Label');
var x_7_8Label = document.getElementById('x_7_8Label');
var answer_4_5Label = document.getElementById('answer_4_5Label');
var x_8_9Label = document.getElementById('x_8_9Label');
var answer_5_6Label = document.getElementById('answer_5_6Label');
var x_1_10Label = document.getElementById('x_1_10Label');
var answer_19_20Label = document.getElementById('answer_19_20Label');
var x_17_18Label = document.getElementById('x_17_18Label');
var x_18_19Label = document.getElementById('x_18_19Label');
var x_10_11Label = document.getElementById('x_10_11Label');
var x_12_13Label = document.getElementById('x_12_13Label');
var x_13_14Label = document.getElementById('x_13_14Label');
var x_15_16Label = document.getElementById('x_15_16Label');
var x_10_12Label = document.getElementById('x_10_12Label');
var x_15_17Label = document.getElementById('x_15_17Label');
var x_10_15Label = document.getElementById('x_10_15Label');
var x_1_2Label = document.getElementById('x_1_2Label');
var answer_10_11Label = document.getElementById('answer_10_11Label');
var answer_11_12Label = document.getElementById('answer_11_12Label');
var answer_12_13Label = document.getElementById('answer_12_13Label');
var answer_13_14Label = document.getElementById('answer_13_14Label');
var answer_14_15Label = document.getElementById('answer_14_15Label');
var answer_15_16Label = document.getElementById('answer_15_16Label');
var answer_16_17Label = document.getElementById('answer_16_17Label');
var answer_17_18Label = document.getElementById('answer_17_18Label');
var answer_18_19Label = document.getElementById('answer_18_19Label');

// generate inputs
var x_1_5Input = document.getElementById('x_1_5Input');
var x_3_4Input = document.getElementById('x_3_4Input');
var x_1_3Input = document.getElementById('x_1_3Input');
var x_5_6Input = document.getElementById('x_5_6Input');
var x_5_7Input = document.getElementById('x_5_7Input');
var x_7_8Input = document.getElementById('x_7_8Input');
var x_8_9Input = document.getElementById('x_8_9Input');
var x_1_10Input = document.getElementById('x_1_10Input');
var x_17_18Input = document.getElementById('x_17_18Input');
var x_18_19Input = document.getElementById('x_18_19Input');
var x_10_11Input = document.getElementById('x_10_11Input');
var x_12_13Input = document.getElementById('x_12_13Input');
var x_13_14Input = document.getElementById('x_13_14Input');
var x_15_16Input = document.getElementById('x_15_16Input');
var x_10_12Input = document.getElementById('x_10_12Input');
var x_15_17Input = document.getElementById('x_15_17Input');
var x_10_15Input = document.getElementById('x_10_15Input');
var x_1_2Input = document.getElementById('x_1_2Input');

// generate vars
var x_1_5 = false;
var x_3_4 = false;
var answer_1_2 = 0;
var answer_3_4 = 0;
var answer_6_7 = 0;
var answer_7_8 = 0;
var answer_8_9 = 0;
var x_1_3 = false;
var x_5_6 = false;
var answer_2_3 = 0;
var x_5_7 = false;
var answer_9_10 = 0;
var x_7_8 = false;
var answer_4_5 = 0;
var x_8_9 = false;
var answer_5_6 = 0;
var x_1_10 = false;
var answer_19_20 = 0;
var x_17_18 = false;
var x_18_19 = false;
var x_10_11 = false;
var x_12_13 = false;
var x_13_14 = false;
var x_15_16 = false;
var x_10_12 = false;
var x_15_17 = false;
var x_10_15 = false;
var x_1_2 = false;
var answer_10_11 = 0;
var answer_11_12 = 0;
var answer_12_13 = 0;
var answer_13_14 = 0;
var answer_14_15 = 0;
var answer_15_16 = 0;
var answer_16_17 = 0;
var answer_17_18 = 0;
var answer_18_19 = 0;

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
function handlex_1_5Change(input) {
  x_1_5 = true ? input.checked : false;
  computeanswer_1_2();
  computeanswer_3_4();
  computeanswer_6_7();
  computeanswer_7_8();
  computeanswer_8_9();
  computeanswer_2_3();
  computeanswer_9_10();
  computeanswer_4_5();
  computeanswer_5_6();
  computeanswer_19_20();
  computeanswer_10_11();
  computeanswer_11_12();
  computeanswer_12_13();
  computeanswer_13_14();
  computeanswer_14_15();
  computeanswer_15_16();
  computeanswer_16_17();
  computeanswer_17_18();
  computeanswer_18_19();
  conditionsEval();
}

function handlex_3_4Change(input) {
  x_3_4 = true ? input.checked : false;
  computeanswer_1_2();
  computeanswer_3_4();
  computeanswer_6_7();
  computeanswer_7_8();
  computeanswer_8_9();
  computeanswer_2_3();
  computeanswer_9_10();
  computeanswer_4_5();
  computeanswer_5_6();
  computeanswer_19_20();
  computeanswer_10_11();
  computeanswer_11_12();
  computeanswer_12_13();
  computeanswer_13_14();
  computeanswer_14_15();
  computeanswer_15_16();
  computeanswer_16_17();
  computeanswer_17_18();
  computeanswer_18_19();
  conditionsEval();
}

function handlex_1_3Change(input) {
  x_1_3 = true ? input.checked : false;
  computeanswer_1_2();
  computeanswer_3_4();
  computeanswer_6_7();
  computeanswer_7_8();
  computeanswer_8_9();
  computeanswer_2_3();
  computeanswer_9_10();
  computeanswer_4_5();
  computeanswer_5_6();
  computeanswer_19_20();
  computeanswer_10_11();
  computeanswer_11_12();
  computeanswer_12_13();
  computeanswer_13_14();
  computeanswer_14_15();
  computeanswer_15_16();
  computeanswer_16_17();
  computeanswer_17_18();
  computeanswer_18_19();
  conditionsEval();
}

function handlex_5_6Change(input) {
  x_5_6 = true ? input.checked : false;
  computeanswer_1_2();
  computeanswer_3_4();
  computeanswer_6_7();
  computeanswer_7_8();
  computeanswer_8_9();
  computeanswer_2_3();
  computeanswer_9_10();
  computeanswer_4_5();
  computeanswer_5_6();
  computeanswer_19_20();
  computeanswer_10_11();
  computeanswer_11_12();
  computeanswer_12_13();
  computeanswer_13_14();
  computeanswer_14_15();
  computeanswer_15_16();
  computeanswer_16_17();
  computeanswer_17_18();
  computeanswer_18_19();
  conditionsEval();
}

function handlex_5_7Change(input) {
  x_5_7 = true ? input.checked : false;
  computeanswer_1_2();
  computeanswer_3_4();
  computeanswer_6_7();
  computeanswer_7_8();
  computeanswer_8_9();
  computeanswer_2_3();
  computeanswer_9_10();
  computeanswer_4_5();
  computeanswer_5_6();
  computeanswer_19_20();
  computeanswer_10_11();
  computeanswer_11_12();
  computeanswer_12_13();
  computeanswer_13_14();
  computeanswer_14_15();
  computeanswer_15_16();
  computeanswer_16_17();
  computeanswer_17_18();
  computeanswer_18_19();
  conditionsEval();
}

function handlex_7_8Change(input) {
  x_7_8 = true ? input.checked : false;
  computeanswer_1_2();
  computeanswer_3_4();
  computeanswer_6_7();
  computeanswer_7_8();
  computeanswer_8_9();
  computeanswer_2_3();
  computeanswer_9_10();
  computeanswer_4_5();
  computeanswer_5_6();
  computeanswer_19_20();
  computeanswer_10_11();
  computeanswer_11_12();
  computeanswer_12_13();
  computeanswer_13_14();
  computeanswer_14_15();
  computeanswer_15_16();
  computeanswer_16_17();
  computeanswer_17_18();
  computeanswer_18_19();
  conditionsEval();
}

function handlex_8_9Change(input) {
  x_8_9 = true ? input.checked : false;
  computeanswer_1_2();
  computeanswer_3_4();
  computeanswer_6_7();
  computeanswer_7_8();
  computeanswer_8_9();
  computeanswer_2_3();
  computeanswer_9_10();
  computeanswer_4_5();
  computeanswer_5_6();
  computeanswer_19_20();
  computeanswer_10_11();
  computeanswer_11_12();
  computeanswer_12_13();
  computeanswer_13_14();
  computeanswer_14_15();
  computeanswer_15_16();
  computeanswer_16_17();
  computeanswer_17_18();
  computeanswer_18_19();
  conditionsEval();
}

function handlex_1_10Change(input) {
  x_1_10 = true ? input.checked : false;
  computeanswer_1_2();
  computeanswer_3_4();
  computeanswer_6_7();
  computeanswer_7_8();
  computeanswer_8_9();
  computeanswer_2_3();
  computeanswer_9_10();
  computeanswer_4_5();
  computeanswer_5_6();
  computeanswer_19_20();
  computeanswer_10_11();
  computeanswer_11_12();
  computeanswer_12_13();
  computeanswer_13_14();
  computeanswer_14_15();
  computeanswer_15_16();
  computeanswer_16_17();
  computeanswer_17_18();
  computeanswer_18_19();
  conditionsEval();
}

function handlex_17_18Change(input) {
  x_17_18 = true ? input.checked : false;
  computeanswer_1_2();
  computeanswer_3_4();
  computeanswer_6_7();
  computeanswer_7_8();
  computeanswer_8_9();
  computeanswer_2_3();
  computeanswer_9_10();
  computeanswer_4_5();
  computeanswer_5_6();
  computeanswer_19_20();
  computeanswer_10_11();
  computeanswer_11_12();
  computeanswer_12_13();
  computeanswer_13_14();
  computeanswer_14_15();
  computeanswer_15_16();
  computeanswer_16_17();
  computeanswer_17_18();
  computeanswer_18_19();
  conditionsEval();
}

function handlex_18_19Change(input) {
  x_18_19 = true ? input.checked : false;
  computeanswer_1_2();
  computeanswer_3_4();
  computeanswer_6_7();
  computeanswer_7_8();
  computeanswer_8_9();
  computeanswer_2_3();
  computeanswer_9_10();
  computeanswer_4_5();
  computeanswer_5_6();
  computeanswer_19_20();
  computeanswer_10_11();
  computeanswer_11_12();
  computeanswer_12_13();
  computeanswer_13_14();
  computeanswer_14_15();
  computeanswer_15_16();
  computeanswer_16_17();
  computeanswer_17_18();
  computeanswer_18_19();
  conditionsEval();
}

function handlex_10_11Change(input) {
  x_10_11 = true ? input.checked : false;
  computeanswer_1_2();
  computeanswer_3_4();
  computeanswer_6_7();
  computeanswer_7_8();
  computeanswer_8_9();
  computeanswer_2_3();
  computeanswer_9_10();
  computeanswer_4_5();
  computeanswer_5_6();
  computeanswer_19_20();
  computeanswer_10_11();
  computeanswer_11_12();
  computeanswer_12_13();
  computeanswer_13_14();
  computeanswer_14_15();
  computeanswer_15_16();
  computeanswer_16_17();
  computeanswer_17_18();
  computeanswer_18_19();
  conditionsEval();
}

function handlex_12_13Change(input) {
  x_12_13 = true ? input.checked : false;
  computeanswer_1_2();
  computeanswer_3_4();
  computeanswer_6_7();
  computeanswer_7_8();
  computeanswer_8_9();
  computeanswer_2_3();
  computeanswer_9_10();
  computeanswer_4_5();
  computeanswer_5_6();
  computeanswer_19_20();
  computeanswer_10_11();
  computeanswer_11_12();
  computeanswer_12_13();
  computeanswer_13_14();
  computeanswer_14_15();
  computeanswer_15_16();
  computeanswer_16_17();
  computeanswer_17_18();
  computeanswer_18_19();
  conditionsEval();
}

function handlex_13_14Change(input) {
  x_13_14 = true ? input.checked : false;
  computeanswer_1_2();
  computeanswer_3_4();
  computeanswer_6_7();
  computeanswer_7_8();
  computeanswer_8_9();
  computeanswer_2_3();
  computeanswer_9_10();
  computeanswer_4_5();
  computeanswer_5_6();
  computeanswer_19_20();
  computeanswer_10_11();
  computeanswer_11_12();
  computeanswer_12_13();
  computeanswer_13_14();
  computeanswer_14_15();
  computeanswer_15_16();
  computeanswer_16_17();
  computeanswer_17_18();
  computeanswer_18_19();
  conditionsEval();
}

function handlex_15_16Change(input) {
  x_15_16 = true ? input.checked : false;
  computeanswer_1_2();
  computeanswer_3_4();
  computeanswer_6_7();
  computeanswer_7_8();
  computeanswer_8_9();
  computeanswer_2_3();
  computeanswer_9_10();
  computeanswer_4_5();
  computeanswer_5_6();
  computeanswer_19_20();
  computeanswer_10_11();
  computeanswer_11_12();
  computeanswer_12_13();
  computeanswer_13_14();
  computeanswer_14_15();
  computeanswer_15_16();
  computeanswer_16_17();
  computeanswer_17_18();
  computeanswer_18_19();
  conditionsEval();
}

function handlex_10_12Change(input) {
  x_10_12 = true ? input.checked : false;
  computeanswer_1_2();
  computeanswer_3_4();
  computeanswer_6_7();
  computeanswer_7_8();
  computeanswer_8_9();
  computeanswer_2_3();
  computeanswer_9_10();
  computeanswer_4_5();
  computeanswer_5_6();
  computeanswer_19_20();
  computeanswer_10_11();
  computeanswer_11_12();
  computeanswer_12_13();
  computeanswer_13_14();
  computeanswer_14_15();
  computeanswer_15_16();
  computeanswer_16_17();
  computeanswer_17_18();
  computeanswer_18_19();
  conditionsEval();
}

function handlex_15_17Change(input) {
  x_15_17 = true ? input.checked : false;
  computeanswer_1_2();
  computeanswer_3_4();
  computeanswer_6_7();
  computeanswer_7_8();
  computeanswer_8_9();
  computeanswer_2_3();
  computeanswer_9_10();
  computeanswer_4_5();
  computeanswer_5_6();
  computeanswer_19_20();
  computeanswer_10_11();
  computeanswer_11_12();
  computeanswer_12_13();
  computeanswer_13_14();
  computeanswer_14_15();
  computeanswer_15_16();
  computeanswer_16_17();
  computeanswer_17_18();
  computeanswer_18_19();
  conditionsEval();
}

function handlex_10_15Change(input) {
  x_10_15 = true ? input.checked : false;
  computeanswer_1_2();
  computeanswer_3_4();
  computeanswer_6_7();
  computeanswer_7_8();
  computeanswer_8_9();
  computeanswer_2_3();
  computeanswer_9_10();
  computeanswer_4_5();
  computeanswer_5_6();
  computeanswer_19_20();
  computeanswer_10_11();
  computeanswer_11_12();
  computeanswer_12_13();
  computeanswer_13_14();
  computeanswer_14_15();
  computeanswer_15_16();
  computeanswer_16_17();
  computeanswer_17_18();
  computeanswer_18_19();
  conditionsEval();
}

function handlex_1_2Change(input) {
  x_1_2 = true ? input.checked : false;
  computeanswer_1_2();
  computeanswer_3_4();
  computeanswer_6_7();
  computeanswer_7_8();
  computeanswer_8_9();
  computeanswer_2_3();
  computeanswer_9_10();
  computeanswer_4_5();
  computeanswer_5_6();
  computeanswer_19_20();
  computeanswer_10_11();
  computeanswer_11_12();
  computeanswer_12_13();
  computeanswer_13_14();
  computeanswer_14_15();
  computeanswer_15_16();
  computeanswer_16_17();
  computeanswer_17_18();
  computeanswer_18_19();
  conditionsEval();
}


// generate conditionals
function conditionsEval() {
  if (true && x_1_10) {
    x_1_5Label.style.display = "block";
  } else {
    x_1_5Label.style.display = "none";
  }
  if (true && x_1_10 && x_1_5 && !x_1_3) {
    x_3_4Label.style.display = "block";
  } else {
    x_3_4Label.style.display = "none";
  }
  if (true && x_1_10 && x_1_5 && x_1_3 && x_1_2) {
    answer_1_2Label.style.display = "block";
  } else {
    answer_1_2Label.style.display = "none";
  }
  if (true && x_1_10 && x_1_5 && !x_1_3 && x_3_4) {
    answer_3_4Label.style.display = "block";
  } else {
    answer_3_4Label.style.display = "none";
  }
  if (true && x_1_10 && !x_1_5 && x_5_7 && !x_5_6) {
    answer_6_7Label.style.display = "block";
  } else {
    answer_6_7Label.style.display = "none";
  }
  if (true && x_1_10 && !x_1_5 && !x_5_7 && x_7_8) {
    answer_7_8Label.style.display = "block";
  } else {
    answer_7_8Label.style.display = "none";
  }
  if (true && x_1_10 && !x_1_5 && !x_5_7 && !x_7_8 && x_8_9) {
    answer_8_9Label.style.display = "block";
  } else {
    answer_8_9Label.style.display = "none";
  }
  if (true && x_1_10 && x_1_5) {
    x_1_3Label.style.display = "block";
  } else {
    x_1_3Label.style.display = "none";
  }
  if (true && x_1_10 && !x_1_5 && x_5_7) {
    x_5_6Label.style.display = "block";
  } else {
    x_5_6Label.style.display = "none";
  }
  if (true && x_1_10 && x_1_5 && x_1_3 && !x_1_2) {
    answer_2_3Label.style.display = "block";
  } else {
    answer_2_3Label.style.display = "none";
  }
  if (true && x_1_10 && !x_1_5) {
    x_5_7Label.style.display = "block";
  } else {
    x_5_7Label.style.display = "none";
  }
  if (true && x_1_10 && !x_1_5 && !x_5_7 && !x_7_8 && !x_8_9) {
    answer_9_10Label.style.display = "block";
  } else {
    answer_9_10Label.style.display = "none";
  }
  if (true && x_1_10 && !x_1_5 && !x_5_7) {
    x_7_8Label.style.display = "block";
  } else {
    x_7_8Label.style.display = "none";
  }
  if (true && x_1_10 && x_1_5 && !x_1_3 && !x_3_4) {
    answer_4_5Label.style.display = "block";
  } else {
    answer_4_5Label.style.display = "none";
  }
  if (true && x_1_10 && !x_1_5 && !x_5_7 && !x_7_8) {
    x_8_9Label.style.display = "block";
  } else {
    x_8_9Label.style.display = "none";
  }
  if (true && x_1_10 && !x_1_5 && x_5_7 && x_5_6) {
    answer_5_6Label.style.display = "block";
  } else {
    answer_5_6Label.style.display = "none";
  }
  if (true) {
    x_1_10Label.style.display = "block";
  } else {
    x_1_10Label.style.display = "none";
  }
  if (true && !x_1_10 && !x_10_15 && !x_15_17 && !x_17_18 && !x_18_19) {
    answer_19_20Label.style.display = "block";
  } else {
    answer_19_20Label.style.display = "none";
  }
  if (true && !x_1_10 && !x_10_15 && !x_15_17) {
    x_17_18Label.style.display = "block";
  } else {
    x_17_18Label.style.display = "none";
  }
  if (true && !x_1_10 && !x_10_15 && !x_15_17 && !x_17_18) {
    x_18_19Label.style.display = "block";
  } else {
    x_18_19Label.style.display = "none";
  }
  if (true && !x_1_10 && x_10_15 && x_10_12) {
    x_10_11Label.style.display = "block";
  } else {
    x_10_11Label.style.display = "none";
  }
  if (true && !x_1_10 && x_10_15 && !x_10_12) {
    x_12_13Label.style.display = "block";
  } else {
    x_12_13Label.style.display = "none";
  }
  if (true && !x_1_10 && x_10_15 && !x_10_12 && !x_12_13) {
    x_13_14Label.style.display = "block";
  } else {
    x_13_14Label.style.display = "none";
  }
  if (true && !x_1_10 && !x_10_15 && x_15_17) {
    x_15_16Label.style.display = "block";
  } else {
    x_15_16Label.style.display = "none";
  }
  if (true && !x_1_10 && x_10_15) {
    x_10_12Label.style.display = "block";
  } else {
    x_10_12Label.style.display = "none";
  }
  if (true && !x_1_10 && !x_10_15) {
    x_15_17Label.style.display = "block";
  } else {
    x_15_17Label.style.display = "none";
  }
  if (true && !x_1_10) {
    x_10_15Label.style.display = "block";
  } else {
    x_10_15Label.style.display = "none";
  }
  if (true && x_1_10 && x_1_5 && x_1_3) {
    x_1_2Label.style.display = "block";
  } else {
    x_1_2Label.style.display = "none";
  }
  if (true && !x_1_10 && x_10_15 && x_10_12 && x_10_11) {
    answer_10_11Label.style.display = "block";
  } else {
    answer_10_11Label.style.display = "none";
  }
  if (true && !x_1_10 && x_10_15 && x_10_12 && !x_10_11) {
    answer_11_12Label.style.display = "block";
  } else {
    answer_11_12Label.style.display = "none";
  }
  if (true && !x_1_10 && x_10_15 && !x_10_12 && x_12_13) {
    answer_12_13Label.style.display = "block";
  } else {
    answer_12_13Label.style.display = "none";
  }
  if (true && !x_1_10 && x_10_15 && !x_10_12 && !x_12_13 && x_13_14) {
    answer_13_14Label.style.display = "block";
  } else {
    answer_13_14Label.style.display = "none";
  }
  if (true && !x_1_10 && x_10_15 && !x_10_12 && !x_12_13 && !x_13_14) {
    answer_14_15Label.style.display = "block";
  } else {
    answer_14_15Label.style.display = "none";
  }
  if (true && !x_1_10 && !x_10_15 && x_15_17 && x_15_16) {
    answer_15_16Label.style.display = "block";
  } else {
    answer_15_16Label.style.display = "none";
  }
  if (true && !x_1_10 && !x_10_15 && x_15_17 && !x_15_16) {
    answer_16_17Label.style.display = "block";
  } else {
    answer_16_17Label.style.display = "none";
  }
  if (true && !x_1_10 && !x_10_15 && !x_15_17 && x_17_18) {
    answer_17_18Label.style.display = "block";
  } else {
    answer_17_18Label.style.display = "none";
  }
  if (true && !x_1_10 && !x_10_15 && !x_15_17 && !x_17_18 && x_18_19) {
    answer_18_19Label.style.display = "block";
  } else {
    answer_18_19Label.style.display = "none";
  }
}


// generate computed
function updateanswer_1_2Label() {
  answer_1_2Label.innerHTML = "The answer is" + answer_1_2 + "<br><br>"
}

function computeanswer_1_2(){
  answer_1_2 = ( 1 );
  updateanswer_1_2Label();
}

function updateanswer_3_4Label() {
  answer_3_4Label.innerHTML = "The answer is" + answer_3_4 + "<br><br>"
}

function computeanswer_3_4(){
  answer_3_4 = ( 3 );
  updateanswer_3_4Label();
}

function updateanswer_6_7Label() {
  answer_6_7Label.innerHTML = "The answer is" + answer_6_7 + "<br><br>"
}

function computeanswer_6_7(){
  answer_6_7 = ( 6 );
  updateanswer_6_7Label();
}

function updateanswer_7_8Label() {
  answer_7_8Label.innerHTML = "The answer is" + answer_7_8 + "<br><br>"
}

function computeanswer_7_8(){
  answer_7_8 = ( 7 );
  updateanswer_7_8Label();
}

function updateanswer_8_9Label() {
  answer_8_9Label.innerHTML = "The answer is" + answer_8_9 + "<br><br>"
}

function computeanswer_8_9(){
  answer_8_9 = ( 8 );
  updateanswer_8_9Label();
}

function updateanswer_2_3Label() {
  answer_2_3Label.innerHTML = "The answer is" + answer_2_3 + "<br><br>"
}

function computeanswer_2_3(){
  answer_2_3 = ( 2 );
  updateanswer_2_3Label();
}

function updateanswer_9_10Label() {
  answer_9_10Label.innerHTML = "The answer is" + answer_9_10 + "<br><br>"
}

function computeanswer_9_10(){
  answer_9_10 = ( 9 );
  updateanswer_9_10Label();
}

function updateanswer_4_5Label() {
  answer_4_5Label.innerHTML = "The answer is" + answer_4_5 + "<br><br>"
}

function computeanswer_4_5(){
  answer_4_5 = ( 4 );
  updateanswer_4_5Label();
}

function updateanswer_5_6Label() {
  answer_5_6Label.innerHTML = "The answer is" + answer_5_6 + "<br><br>"
}

function computeanswer_5_6(){
  answer_5_6 = ( 5 );
  updateanswer_5_6Label();
}

function updateanswer_19_20Label() {
  answer_19_20Label.innerHTML = "The answer is" + answer_19_20 + "<br><br>"
}

function computeanswer_19_20(){
  answer_19_20 = ( 19 );
  updateanswer_19_20Label();
}

function updateanswer_10_11Label() {
  answer_10_11Label.innerHTML = "The answer is" + answer_10_11 + "<br><br>"
}

function computeanswer_10_11(){
  answer_10_11 = ( 10 );
  updateanswer_10_11Label();
}

function updateanswer_11_12Label() {
  answer_11_12Label.innerHTML = "The answer is" + answer_11_12 + "<br><br>"
}

function computeanswer_11_12(){
  answer_11_12 = ( 11 );
  updateanswer_11_12Label();
}

function updateanswer_12_13Label() {
  answer_12_13Label.innerHTML = "The answer is" + answer_12_13 + "<br><br>"
}

function computeanswer_12_13(){
  answer_12_13 = ( 12 );
  updateanswer_12_13Label();
}

function updateanswer_13_14Label() {
  answer_13_14Label.innerHTML = "The answer is" + answer_13_14 + "<br><br>"
}

function computeanswer_13_14(){
  answer_13_14 = ( 13 );
  updateanswer_13_14Label();
}

function updateanswer_14_15Label() {
  answer_14_15Label.innerHTML = "The answer is" + answer_14_15 + "<br><br>"
}

function computeanswer_14_15(){
  answer_14_15 = ( 14 );
  updateanswer_14_15Label();
}

function updateanswer_15_16Label() {
  answer_15_16Label.innerHTML = "The answer is" + answer_15_16 + "<br><br>"
}

function computeanswer_15_16(){
  answer_15_16 = ( 15 );
  updateanswer_15_16Label();
}

function updateanswer_16_17Label() {
  answer_16_17Label.innerHTML = "The answer is" + answer_16_17 + "<br><br>"
}

function computeanswer_16_17(){
  answer_16_17 = ( 16 );
  updateanswer_16_17Label();
}

function updateanswer_17_18Label() {
  answer_17_18Label.innerHTML = "The answer is" + answer_17_18 + "<br><br>"
}

function computeanswer_17_18(){
  answer_17_18 = ( 17 );
  updateanswer_17_18Label();
}

function updateanswer_18_19Label() {
  answer_18_19Label.innerHTML = "The answer is" + answer_18_19 + "<br><br>"
}

function computeanswer_18_19(){
  answer_18_19 = ( 18 );
  updateanswer_18_19Label();
}


