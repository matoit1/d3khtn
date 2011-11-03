function checkHoTen(e, args) {
    if (args.Value.length == 0)
        args.IsValid = false;
    else
        args.IsValid = true;
}
function checkMatKhau(e, args) {
    if (args.Value.length < 6)
        args.IsValid = false;
    else
        args.IsValid = true;
}
function checkEmail(e, args) {
    if (args.Value.length == 0)
        args.IsValid = false;
    else
        args.IsValid = true;
}