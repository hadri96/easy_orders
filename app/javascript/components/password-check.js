let passwordValidator = require('password-validator');

// Create a schema
let schema = new passwordValidator();

// Add properties to it
schema
  .is().min(8)                                    // Minimum length 8
  .is().max(100)                                  // Maximum length 100
  .has().uppercase()                              // Must have uppercase letters
  .has().lowercase()                              // Must have lowercase letters
  .has().digits()                                 // Must have  2 digits
  .has().symbols();                               // Must have symbols


const checkPassword = () => {
  const passwordBox = document.getElementsByClassName('form-control password required')[0];
  if (passwordBox) {
    passwordBox.addEventListener('keyup', (_event) => {
      const password = document.getElementById('user_password').value;
      const checks = schema.validate(password, { list: true });
      checkLowercase(checks);
      checkUppercase(checks);
      checkDigits(checks);
      checkSymbols(checks);
      checkLength(checks);
  })};
};

const checkLowercase = (list) => {
  const lowerValidation = document.getElementsByClassName('lower-password')[0];
  if (list.includes('lowercase')) {
    lowerValidation.innerHTML = "❌ Contains lowercase";
  } else {
    lowerValidation.innerHTML = "✅ Contains lowercase";
  }
}

const checkUppercase = (list) => {
  const upperValidation = document.getElementsByClassName('upper-password')[0];
  if (list.includes('uppercase')) {
    upperValidation.innerHTML = "❌ Contains uppercase";
  } else {
    upperValidation.innerHTML = "✅ Contains uppercase";
  }
}

const checkDigits = (list) => {
  const digitValidation = document.getElementsByClassName('digits-password')[0];
  if (list.includes('digits')) {
    digitValidation.innerHTML = "❌ Contains digits";
  } else {
    digitValidation.innerHTML = "✅ Contains digits";
  }
}

const checkSymbols = (list) => {
  const symbolValidation = document.getElementsByClassName('symbols-password')[0];
  if (list.includes('symbols')) {
    symbolValidation.innerHTML = "❌ Contains symbols";
  } else {
    symbolValidation.innerHTML = "✅ Contains symbols";
  }
}

const checkLength = (list) => {
  const lengthValidation = document.getElementsByClassName('length-password')[0];
  if (list.includes('min')) {
    lengthValidation.innerHTML = "❌ Has 8 characters minimum";
  } else {
    lengthValidation.innerHTML = "✅ Has 8 characters minimum";
  }
}

export { checkPassword };
