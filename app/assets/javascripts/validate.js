$( document ).on('turbolinks:load', function() {
  $('#new_book').validate({
    errorPlacement: function(error, element) {
      error.insertAfter(element);
    },
    rules: {
      'book[name]': {
        required: true,
        minlength: 6,
        maxlength: 255
      },
      'book[publisher_id]': {
        required: true
      },
      'book[category_id]': {
        required: true
      },
      'book[author_id]': {
        required: function() {
          if ($('#choose-author').attr('disabled', false)) {
            return true;
          }
        }
      },
      'book[author_attributes][name]': {
        minlength: 3,
        required: function() {
          if ($('#new-author').attr('disabled', false)) {
            return true;
          }
        }
      },
      'book[number_of_pages]': {
        required: true,
        number: true,
        min: 0
      },
      'book[quantity]': {
        required: true,
        number: true,
        min: 0
      },
      'book[price]': {
        required: true,
        number: true,
        min: 0
      }
    },
    messages: {
      'book[name]': {
        required: I18n
          .t('activerecord.errors.models.book.attributes.name.blank'),
        minlength: I18n
          .t('activerecord.errors.models.book.attributes.name.too_short'),
        maxlength: I18n
          .t('activerecord.errors.models.book.attributes.name.too_long')
      },
      'book[category_id]': {
        required: I18n
          .t('activerecord.errors.models.book.attributes.category_id.blank')
      },
      'book[publisher_id]': {
        required: I18n
          .t('activerecord.errors.models.book.attributes.publisher_id.blank')
      },
      'book[author_id]': {
        required: I18n
          .t('activerecord.errors.models.book.attributes.author_id.blank')
      },
      'book[author_attributes][name]': {
        required: I18n
          .t('activerecord.errors.models.book.attributes.author_name.blank'),
        minlength: I18n
          .t('activerecord.errors.models.book.attributes.author_name.too_short')
      },
      'book[number_of_pages]': {
        required: I18n
          .t('activerecord.errors.models.book.attributes.pages.blank'),
        number: I18n
          .t('activerecord.errors.models.book.attributes.pages.not_a_number'),
        min: I18n
          .t('activerecord.errors.models.book.attributes.pages.greater_than')
      },
      'book[quantity]': {
        required: I18n
          .t('activerecord.errors.models.book.attributes.quantity.blank'),
        number: I18n
          .t('activerecord.errors.models.book.attributes.quantity.not_a_number'),
        min: I18n
          .t('activerecord.errors.models.book.attributes.quantity.greater_than')
      },
      'book[price]': {
        required: I18n
          .t('activerecord.errors.models.book.attributes.price.blank'),
        number: I18n
          .t('activerecord.errors.models.book.attributes.price.not_a_number'),
        min: I18n
          .t('activerecord.errors.models.book.attributes.price.greater_than')
      }
    }
  });
});
