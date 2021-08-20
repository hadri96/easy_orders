const selectPayment = () => {
  const paymentMethods = document.getElementsByClassName('ctn-show-list-pay')[0];
  console.log('coucou');
  console.log(paymentMethods);
  if (paymentMethods) {
    const methodsIds = ['paypal', 'twint', 'mastervisa'];
    let len = methodsIds.length
    for (let i = 0; i < len; ) {
      let paymentMethod = document.getElementById(methodsIds[i])
      paymentMethod.addEventListener('click', (_event) => {
        document.getElementById('paypal').style.backgroundColor = '#FFFFFF';
        document.getElementById('twint').style.backgroundColor = '#FFFFFF';
        document.getElementById('mastervisa').style.backgroundColor = '#FFFFFF';
        paymentMethod.style.backgroundColor = '#FF6663';
      });
      i++;
    };
  };
};

export { selectPayment };
