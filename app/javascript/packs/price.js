$(function(){
  $('#item-price').on('input', function(){
    let tax = $('#item-price').val();
    $('#add-tax-price').text(Math.ceil(tax * 0.1));
    $('#profit').text(Math.ceil(tax - (tax * 0.1)));
  });
});