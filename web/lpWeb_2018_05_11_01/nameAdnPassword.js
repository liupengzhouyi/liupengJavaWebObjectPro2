function nameAndPassword() {
    if (informationInput.username.value == "" ) {
        window.alert("请输入用户名！");
        informationInput.username.focus();
        return ;
    } else if (informationInput.password.value == "") {
        window.alert("请输入密码！");
        informationInput.password.focus();
        return ;
    } else {
        informationInput.submit();
    }
}