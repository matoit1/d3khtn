<%-- 
    Document   : SubDangNhap
    Created on : Dec 2, 2011, 1:37:02 AM
    Author     : Nguyen Anh Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="info">
    <form action="#" method="post" name="frm_DangKy" onsubmit="return IsValid();">
        <h3>
            SIGN IN
        </h3>
        <p> If you have an account already, please sign in for fast and easy check out.</p>
        <p> If you don't, please create a new one.</p>
        <fieldset>
            <table>
                <tbody> 
                    <tr>
                        <td class="label">Your ID</td>
                        <td class="value"><input type="text" name="id" id="id" /></td>
                        <td class="warning" id="invalid_id"></td>
                    </tr>
                    <tr>
                        <td class="label">Your Password</td>
                        <td class="value"><input type="password" name="password" id="password"/></td>
                        <td class="warning" id="invalid_pass"></td>
                    </tr>
                </tbody>
            </table>
        </fieldset>
        <p style="text-align: center;">
            <input class="btn" type="submit" value="Sign In"/>
            <input class="btn" type="button" value="Cancel"  />
        </p> 
        <a href=""><font> Create an account now!</font></a>
    </form>
</div>


