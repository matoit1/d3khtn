<%-- 
    Document   : SubDangKy
    Created on : Nov 28, 2011, 2:02:56 PM
    Author     : TRANTRI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <!-- InstanceBeginEditable name="NoiDungThayDoi" -->
 
 
 
 
 
 
 
 
 
    <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0">
      <tr bgcolor="#666666">
        <td class="bgColorMain"><strong><font color="#FFFFFF">CREATE AN ACCOUNT</font></strong></td>
      </tr>
      <tr>
        <td valign="top"><table width="100%" cellpadding="5">
            <tr>
              <td width="50%"><table width="100%">
                      <form id="frmLogin" name="frmLogin" method="post" action="#" onsubmit="return Check_RegValid();">
                    <tr>
                      <td colspan="2"><strong>Account Information</strong></td>
                    </tr>
                    <tr>
                      <td>* Indicates a required field</td>
                    </tr>
                    <tr>
                      <td>
                          <label for="id">* Your ID</label>
                      </td>
                      <td>
                          <input type="text" name="id" />
                      </td>
                    </tr>
                    <tr>
                      <td><label for="password">* Password</label>
                      </td>
                      <td><input type="password" name="password" />
                      </td>
                    </tr>
                    <tr>
                      <td><label for="password2">* Retype Password</label>
                      </td>
                      <td><input type="password" name="password2" />
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2"><strong>Personal Information</strong></td>
                    </tr>
                    <tr>
                      <td><label for="fullname">Full Name</label>
                      </td>
                      <td><input type="text" name="fullname" />
                      </td>
                    </tr>
                    <tr>
                      <td><label for="email">* Email Address</label>
                      </td>
                      <td><input type="text" name="email" />
                      </td>
                    </tr>
                    <tr>
                      <td><label for="email2">* Retyoe Email Address </label>
                      </td>
                      <td><input type="text" name="email2" />
                      </td>
                    </tr>
                    <tr>
                      <td><label for="phone">Mobile Phone</label>
                      </td>
                      <td><input type="text" name="phone" />
                      </td>
                    </tr>
                    <tr>
                      <td>
                          <p>Recaptcha</p>
                      </td>
                      <td> 
                          ${recaptcha}
                      </td>
                    </tr>
                    <tr>
                      <td></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td><input type="submit" name="btnRegister" value="Register" onclick='return checkinput();'/>
                      </td>
                    </tr>
                  </form>
                </table></td>
            </tr>
          </table></td>
      </tr>
    </table>
                      
                      