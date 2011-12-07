/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function RegisterAccount(){
    
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
        $('#invalid_name').html('Full Name is required !');
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
        $('#invalid_phone').html('Mobile Phone is required !');
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

function SigninAccount()
{
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
    
    return true;
}

function UpdateAccount()
{
    if($('#fullname').val().trim().length == 0){
        $('#invalid_name').html('Full Name is required !');
        $('#fullname').focus();
        return false;
    }else{
        $('#invalid_name').html('');
    }
    
    if($('#phone').val().trim().length == 0){
        $('#invalid_phone').html('Mobile Phone is required !');
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
    
    return true;
}

function ChangeEmail()
{
    if($('#email').val().trim().length == 0){
        $('#invalid_email').html('Email Address is is required !');
        $('#email').focus();
        return false;
    }else{
        $('#invalid_email').html('');
    }
    
    if($('#password').val().trim().length == 0){
        $('#invalid_pass').html('Password is required !');
        $('#password').focus();
        return false;
    }else{
        $('#invalid_pass').html('');
    }
    
    if($('#newemail').val().trim().length == 0){
        $('#invalid_newemail').html('New Email Address is required !');
        $('#newemail').focus();
        return false;
    }else{
        $('#invalid_newemail').html('');
    }
    
    if($('#newemail2').val().trim().length == 0){
        $('#invalid_newemail2').html('Retype Email Address is required !');
        $('#newemail2').focus();
        return false;
    }else{
        $('#invalid_newemail2').html('');
    }
    
    // Kiểm tra khớp email mới
    if($('#newemail').val() != $('#newemail2').val()){
        $('#invalid_newemail2').html('Retype Email Address does not match !');
        $('#newemail2').focus();
        return false;
    }else{
        $('#invalid_newemail2').html('');
    }
    return true;
}

function ChangePassword()
{
    if($('#password').val().trim().length == 0){
        $('#invalid_pass').html('Password is required !');
        $('#password').focus();
        return false;
    }else{
        $('#invalid_pass').html('');
    }
    
    if($('#newpass').val().trim().length == 0){
        $('#invalid_newpass').html('New Password is required !');
        $('#newpass').focus();
        return false;
    }else{
        $('#invalid_newpass').html('');
    }
    
    if($('#newpass2').val().trim().length == 0){
        $('#invalid_newpass2').html('Retype Password is required !');
        $('#newpass2').focus();
        return false;
    }else{
        $('#invalid_newpass2').html('');
    }
    
    // Kiểm tra khớp password mới
    if($('#newpass').val() != $('#newpass2').val()){
        $('#invalid_newpass2').html('Retype Password does not match !');
        $('#newpass2').focus();
        return false;
    }else{
        $('#invalid_newpass2').html('');
    }
    
    return true;
}


