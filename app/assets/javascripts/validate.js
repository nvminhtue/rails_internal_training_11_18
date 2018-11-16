$(document).ready(function(){
  $('#new_book').validate({
    errorPlacement: function(error, element){
      error.insertAfter(element);
    },
    rules: {
      'book[name]':{
        required: true,
        minlength: 6,
        maxlength: 255
      },
      'book[category_id]':{
        required: true
      },
      'book[author_id]': {
        required: function() {
          if($('#choose-author').attr('disabled', false)){
            return true;
          }else{
            return false;
          }
        }
      },
      'book[author_attributes][name]': {
        required: function() {
          if($('#new-author').attr('disabled', false)){
            return true;
          }else{
            return false;
          }
        }
      },
      'book[number_of_pages]':{
        required: true,
        number: true,
        min: 0
      },
      'book[quantity]':{
        required: true,
        number: true,
        min: 0
      },
      'book[price]':{
        required: true,
        number: true,
        min: 0
      }
    },
    messages:{
      'book[name]':{
        required: I18n
          .t('activerecord.errors.models.book.attributes.name.required'),
        minlength: I18n
          .t('activerecord.errors.models.book.attributes.name.minlength'),
        maxlength: I18n
          .t('activerecord.errors.models.book.attributes.name.maxlength')
      },
      'book[category_id]':{
        required: I18n
          .t('activerecord.errors.models.book.attributes.category_id.required')
      },
      'book[author_id]': {
        required: I18n
          .t('activerecord.errors.models.book.attributes.author_id.required')
      },
      'book[author_attributes][name]':{
        required: I18n
          .t('activerecord.errors.models.book.attributes.author_name.required')
      },
      'book[number_of_pages]':{
        required: I18n
          .t('activerecord.errors.models.book.attributes.pages.required'),
        number: I18n
          .t('activerecord.errors.models.book.attributes.pages.number'),
        min: I18n
          .t('activerecord.errors.models.book.attributes.pages.min')
      },
      'book[quantity]':{
        required: I18n
          .t('activerecord.errors.models.book.attributes.quantity.required'),
        number: I18n
          .t('activerecord.errors.models.book.attributes.quantity.number'),
        min: I18n
          .t('activerecord.errors.models.book.attributes.quantity.min')
      },
      'book[price]':{
        required: I18n
          .t('activerecord.errors.models.book.attributes.price.required'),
        number: I18n
          .t('activerecord.errors.models.book.attributes.price.number'),
        min: I18n
          .t('activerecord.errors.models.book.attributes.price.min')
      }
    }
  });
});
