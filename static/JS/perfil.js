$('.single-checkbox').on('change', function() {
   if($('.single-checkbox:checked').length > 5) {
       this.checked = false;
   }
});
