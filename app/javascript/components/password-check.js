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
  const passwordBox = document.getElementById('password-field');
  if (passwordBox) {
    passwordBox.addEventListener('keyup', (_event) => {
      const password = document.getElementById('password-field').value;
      const checks = schema.validate(password, { list: true });
      insertFields();
      checkLowercase(checks);
      checkUppercase(checks);
      checkDigits(checks);
      checkSymbols(checks);
      checkLength(checks);
  })};
};

const insertFields = () => {
  const edit_page = !!(document.getElementsByClassName("avatar-img-edit")[0]);
  if (edit_page) {
    const last_name_field = document.getElementsByClassName('form-group user_last_name')[0];
    const check = !!(document.getElementsByClassName('lower-password')[0]);
    if (!(check)) {
      last_name_field.insertAdjacentHTML('afterend',
        `<p class="form-hint lower-password">❌ Contains lowercase</p>
        <p class="form-hint upper-password">❌ Contains uppercase</p>
        <p class="form-hint digits-password">❌ Contains digits</p>
        <p class="form-hint symbols-password">❌ Contains symbols</p>
        <p class="form-hint length-password">❌ Has minimum 8 characters</p>`);
    };
  };
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
