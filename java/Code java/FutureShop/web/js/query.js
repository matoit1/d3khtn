/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function GoIndex(){
    document.location.href = 'index.do';
}

function BackToCart(){
    document.location.href = 'GioHang.jsp';
}

function GoProfile(){
    document.location.href = 'TrangThongTinCaNhan.jsp';
}

function GoAdminProfile()
{
    document.location.href = 'AdminQuanLySanPham.jsp';
}

function Date_Check(str)
{
    if(str.indexOf("/") == -1){
        return false;
    }
    dt1 = str.split("/")
    mm1 = parseInt(dt1[0]);
    dd1 = parseInt(dt1[1]);
    yy1 = parseInt(dt1[2]);
    if(isNaN(dd1) || isNaN(mm1) || isNaN(yy1)){
        return false;
    }
    dt2 = new Date(mm1+'/'+dd1+'/'+yy1)
    dd2 = dt2.getDate();
    mm2 = dt2.getMonth()+1;
    yy2 = dt2.getFullYear();
		
    if(dd1==dd2 && mm1==mm2 && yy1==yy2)
        return true;
    else
        return false;
}

function AddressShow()
{
    if($('#Availability').val() == 0)
    {
        $('#OrderAddress').hide();
    }
    else
    {
        $('#OrderAddress').show();  
    }
}

function echeck(str) {

    var at="@"
    var dot="."
    var lat=str.indexOf(at)
    var lstr=str.length
    var ldot=str.indexOf(dot)
    if (str.indexOf(at)==-1){
        //alert("Invalid E-mail ID")
        return false
    }

    if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
        //alert("Invalid E-mail ID")
        return false
    }

    if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
        //alert("Invalid E-mail ID")
        return false
    }

    if (str.indexOf(at,(lat+1))!=-1){
        //alert("Invalid E-mail ID")
        return false
    }

    if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
        //alert("Invalid E-mail ID")
        return false
    }

    if (str.indexOf(dot,(lat+2))==-1){
        //alert("Invalid E-mail ID")
        return false
    }
                
    if (str.indexOf(" ")!=-1){
        //alert("Invalid E-mail ID")
        return false
    }

    return true                                 
}

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

    var email = $('#email').val().trim();
    
    if($('#email').val().trim().length == 0){
        $('#invalid_email').html('Email Address is required !');
        $('#email').focus();
        return false;
    }else{
        if(echeck(email)==false)
        {
            $('#invalid_email').html('Email Address is not correct !');
            $('#email').focus();
            return false;
        }
        else
        {
            $('#invalid_email').html('');
        }
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
    
    var dayofbirth = $('#dayofbirth').val().trim();
    
    if($('#dayofbirth').val().trim().length == 0)
    {
        $('#invalid_dayofbirth').html('Day Of Birth is required !');
        $('#dayofbirth').focus();
        return false;
    }
    else
    { 
        if(Date_Check(dayofbirth) == false)
        {
            $('#invalid_dayofbirth').html('Day Of Birth is invalid !');
            $('#dayofbirth').focus();
            return false;
        }
        else
        {
            $('#invalid_dayofbirth').html('');
        }
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
    
    if($('#address').val().trim().length == 0){
        $('#invalid_address').html('Address is required !');
        $('#address').focus();
        return false;
    }else{
        $('#invalid_address').html('');
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
    
    var newemail = $('#newemail').val().trim();
    if($('#newemail').val().trim().length == 0){
        $('#invalid_newemail').html('New Email Address is required !');
        $('#newemail').focus();
        return false;
    }else{
        if(echeck(newemail)==false)
        {
            $('#invalid_newemail').html('Email Address is not correct !');
            $('#newemail').focus();
            return false;
        }
        else
        {
            $('#invalid_newemail').html('');
        }
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

function ResetPassword()
{  
    if($('#id').val().trim().length == 0){
        $('#invalid_id').html('Your ID is required !');
        $('#id').focus();
        return false;
    }else{
        $('#invalid_id').html('');
    }
    
    var email = $('#email').val().trim();
    
    if($('#email').val().trim().length == 0){
        $('#invalid_email').html('Email Address is required !');
        $('#email').focus();
        return false;
    }else{
        if(echeck(email)==false)
        {
            $('#invalid_email').html('Email Address is not correct !');
            $('#email').focus();
            return false;
        }
        else
        {
            $('#invalid_email').html('');
        }
    }
    
    return true;
}

function OrderCheck()
{
    if($('#recaptcha_response_field').val().trim().length == 0){
        $('#invalid_captcha').html('Security value is required !');
        $('#recaptcha_response_field').focus();
        return false;
    }else{
        $('#invalid_captcha').html('');
    }
    
    return true;
    
}
