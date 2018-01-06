/* global $ */

function registration_logic () {
  $('input').focusout(function (){ $(this).addClass('checked'); });

  $('.validate_present').on('focusout', function(){
    validatePresence(this);
    $('.submit').trigger('mouseout');
  } )

  $('.validate_present').on('change', function(){
    validatePresence(this);
    $('.submit').trigger('mouseout');
  } )

  $('.validate_numbers').focusout( function(){
    validateNumbers(this);
    $('.submit').trigger('mouseout');
  } )

  $('.validate_numbers').change( function(){
    validateNumbers(this);
    $('.submit').trigger('mouseout');
  } )

  $('.validate_email').focusout( function(){
    validateEmail(this);
    $('.submit').trigger('mouseout');
  } )

  $('.validate_email').change( function(){
    validateEmail(this);
    $('.submit').trigger('mouseout');
  } )

  $('.validate_checkbox').change( function(){
    $(this).find('input').is(':checked') ? $(this).removeClass('validate') : $(this).addClass('validate');
    $('.submit').trigger('mouseout');
  })

  $('.upload').find('input').change( function() {
    $(this).parent().removeClass('uploaded');
    var file = this.files[0];
    var label = $(this).siblings('label');

    if( file !== undefined ) {
    } else {
      label.find('span').html('upload file');
      if( $('.uploaded').length > 0 ){
        $('label').find('span').removeClass('validate')
      } else {
        label.find('span').addClass('validate')
      }
      $('.submit').trigger('mouseout');
      return false;
    }

    if(validate_format( file ) ){
      label.find('span').html('hurray!');
      $(this).parent().addClass('uploaded')
    }else{
      label.find('span').html('wrong file format');
      label.find('span').addClass('validate');
      $('.submit').trigger('mouseout');
    }

    if( $('.uploaded').length > 0 ){
      $('label').find('span').removeClass('validate')
    }else{
      label.find('span').addClass('validate')
    }

    $('.submit').trigger('mouseout');
  } )

  $('.upload-desc').find('input').change( function() {
    var file = this.files[0];
    var label = $(this).siblings('label');
    $(this).parent().removeClass('uploaded');

    if ( file != undefined ) {
    } else {
      label.find('span').html('upload file');
      label.find('span').addClass('validate')
      return
    }

    if(validate_format_text( file ) ){
      label.find('span').html('hurray!');
      label.find('span').removeClass('validate')
      $(this).parent().addClass('uploaded');
      $('.submit').trigger('mouseout');
    }else{
      label.find('span').html('wrong file format');
      label.find('span').addClass('validate')
      return
    }
  } )

  $('.submit').mouseout( function(){
    if ($('.registration').find('.validate').length == 0){
      $(this).removeClass('disabled')
      $(this).prop('disabled', false);
    } else {
      $(this).addClass('disabled');
      $(this).prop('disabled', true);
    }
  })

  function validateAll () {
    $('.validate').each((index, input) => {
      if ($(input).hasClass('validate_present')) { validatePresence(input); }
      if ($(input).hasClass('validate_numbers')) { validateNumbers(input); }
      if ($(input).hasClass('validate_email')) { validateEmail(input); }

      if($('.tick-container').find('input').is(':checked')) {
        $('.tick-container').removeClass('validate')
      } else {
        $('.tick-container').addClass('validate');
      }
    })
  }

  validateAll();

  function validatePresence (input) {
    $(input).val() === '' ? $(input).addClass('validate') : $(input).removeClass('validate');
  }

  function validateNumbers (input) {
    var phoneNumberPattern = /^[0-9()-+ ]+$/;
    !phoneNumberPattern.test( $(input).val() ) ? $(input).addClass('validate') : $(input).removeClass('validate');
  }

  function validateEmail (input) {
    var emailPattern = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
    !emailPattern.test( $(input).val() ) ? $(input).addClass('validate') : $(input).removeClass('validate');
  }

  function validate_format(file){
    return  ['png', 'jpg', 'jpeg'].indexOf( file.type.split('/').pop() ) >= 0 ? true : false;
  }

  function validate_format_text(file){
    return  ['docx', 'doc', 'odt', 'rtf'].indexOf( file.name.split('.').pop() ) >= 0 ? true : false;
  }
}