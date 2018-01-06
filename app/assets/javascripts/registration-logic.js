function registration_logic(){

  $('input').focusout(function(){ $(this).addClass('checked') })

  $('.validate_present').on('focusout', function(){
       $(this).val() == 0 ? $(this).addClass('validate') : $(this).removeClass('validate');
       $('.submit').trigger('mouseout');
    } )

    $('.validate_present').on('change', function(){
       $(this).val() == 0 ? $(this).addClass('validate') : $(this).removeClass('validate');
       $('.submit').trigger('mouseout');
    } )

      $('.validate_numbers').focusout( function(){
        var phoneNumberPattern = /^[0-9()-+ ]+$/;
       !phoneNumberPattern.test( $(this).val() ) ? $(this).addClass('validate') : $(this).removeClass('validate');
       $('.submit').trigger('mouseout');
    } )


    $('.validate_numbers').change( function(){
        var phoneNumberPattern = /^[0-9()-+ ]+$/;
       !phoneNumberPattern.test( $(this).val() ) ? $(this).addClass('validate') : $(this).removeClass('validate');
       $('.submit').trigger('mouseout');
    } )

      $('.validate_email').focusout( function(){
        var emailPattern = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
       !emailPattern.test( $(this).val() ) ? $(this).addClass('validate') : $(this).removeClass('validate');
       $('.submit').trigger('mouseout');
    } )

    $('.validate_email').change( function(){
        var emailPattern = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
       !emailPattern.test( $(this).val() ) ? $(this).addClass('validate') : $(this).removeClass('validate');
       $('.submit').trigger('mouseout');
    } )

      $('.validate_checkbox').change( function(){
         $(this).find('input').is(':checked') ? $(this).removeClass('validate') : $(this).addClass('validate');
       $('.submit').trigger('mouseout');
      } )

      $('.upload').find('input').change( function(){
        $(this).parent().removeClass('uploaded');
        var file = this.files[0];
        var label = $(this).siblings('label');

        if( file != undefined ){
        }else{
          label.find('span').html('upload file');
        if( $('.uploaded').length > 0 ){
          $('label').find('span').removeClass('validate')
        }else{
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

        $('.upload-desc').find('input').change( function(){
          var file = this.files[0];
          var label = $(this).siblings('label');
          $(this).parent().removeClass('uploaded');

          if( file != undefined ){
          }else{
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
          $(this).prop("disabled", false);
          $(this).prop("disabled", false);
       }else{
          $(this).addClass('disabled');
          $(this).prop("disabled", true);
          $(this).prop("disabled", true);
       }
      })

      function validate_format(file){
       return  ['png', 'jpg', 'jpeg'].indexOf( file.type.split('/').pop() ) >= 0 ? true : false;
      }

      function validate_format_text(file){
         return  ['docx', 'doc', 'odt', 'rtf'].indexOf( file.name.split('.').pop() ) >= 0 ? true : false;
      }
}