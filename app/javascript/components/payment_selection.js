const selectPayment = () => {
  const paymentMethods = document.getElementsByClassName('ctn-show-list-pay')[0];
  if (paymentMethods) {
    const methodsIds = ['paypal-info', 'twint-info', 'mastervisa-info', 'cash-info'];
    let len = methodsIds.length
    for (let i = 0; i < len; ) {
      let paymentMethod = document.getElementById(methodsIds[i])
      paymentMethod.addEventListener('click', (_event) => {
        document.getElementById('paypal').style.backgroundColor = '#FFFFFF';
        document.getElementById('twint').style.backgroundColor = '#FFFFFF';
        document.getElementById('mastervisa').style.backgroundColor = '#FFFFFF';
        document.getElementById('cash').style.backgroundColor = '#FFFFFF';
        document.getElementById(`${methodsIds[i-1].slice(0, -5)}`).style.backgroundColor = '#FF6663';
      });
      i++;
    };
  };
};

export { selectPayment };
