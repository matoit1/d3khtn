/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function IsValid(){
    
    if($('#id').val().trim().length == 0){
        $('#invalid_id').html('Your ID is required !');
        $('#id').focus();
        return false;
    }else{
        $('#invalid_id').html('');
    }

    if($('#password').val().trim().length == 0){
        $('#invalid_pass').html('Password is required !');
        $('#password').focus();
        return false;
    }else{
        $('#invalid_pass').html('');
    }

    if($('#password2').val().trim().length == 0){
        $('#invalid_pass2').html('Retype Password is required !');
        $('#password2').focus();
        return false;
    }else{
        $('#invalid_pass2').html('');
    }

    //Kiểm tra khớp mật khẩu:
    if($('#password').val() != $('#password2').val()){
        $('#invalid_pass2').html('Retype Password does not match !');
        $('#password2').focus();
        return false;
    }else{
        $('#invalid_pass2').html('');
    }

    if($('#fullname').val().trim().length == 0){
        $('#invalid_name').html('Full Name is recommend !');
        $('#fullname').focus();
        return false;
    }else{
        $('#invalid_name').html('');
    }


    if($('#email').val().trim().length == 0){
        $('#invalid_email').html('Email Address is is required !');
        $('#email').focus();
        return false;
    }else{
        $('#invalid_email').html('');
    }
    
    if($('#email2').val().trim().length == 0){
        $('#invalid_email2').html('Retype Email Address is required !');
        $('#email2').focus();
        return false;
    }else{
        $('#invalid_email2').html('');
    }
    
    //Kiểm tra khớp email:
    if($('#email').val() != $('#email2').val()){
        $('#invalid_email2').html('Retype Email Address does not match !');
        $('#email2').focus();
        return false;
    }else{
        $('#invalid_email2').html('');
    }
    
    if($('#phone').val().trim().length == 0){
        $('#invalid_phone').html('Mobile Phone is recommend !');
        $('#phone').focus();
        return false;
    }else{
        var phone = $('#phone').val().toString();
        if(isNaN(phone)){
            $('#invalid_phone').html('Mobile Phone number is invalid !');
            $('#phone').focus();
            return false;
        }
        else
        {
            $('#invalid_phone').html('');
        }
    }
    
    
    if($('#recaptcha_response_field').val().trim().length == 0){
        $('#invalid_captcha').html('Security value is required !');
        $('#recaptcha_response_field').focus();
        return false;
    }else{
        $('#invalid_captcha').html('');
    }    
    return true;
}
