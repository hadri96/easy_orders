import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $(".ingredient-select").select2({
    tags: true
  });
};
export { initSelect2 };
