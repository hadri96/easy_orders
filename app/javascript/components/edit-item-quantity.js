const editItemQuantity = () => {
  document.addEventListener('click', (event) => {
    if (event.target.id === 'plus-button') {
      document.getElementById('item-quantity').value++
    }
    if (event.target.id === 'minus-button') {
      if (document.getElementById('item-quantity').value > 1) {
        document.getElementById('item-quantity').value--;
      }
    }
  });
};

export { editItemQuantity };
