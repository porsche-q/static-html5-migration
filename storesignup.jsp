<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%
    Locale localeInScope = request.getLocale();
%>
      <!-- CTA -->
			<section id="cta">
				<a name="contactsection"></a>
        <h2><%= localeInScope.getISO3Country().equalsIgnoreCase("CHN")?"商店会员注册":"Member Sign up" %></h2>
          <form method="post" action="https://www.vendease.com/control" id="cform">
            <div class="row uniform 80%">
              <div class="12u 12u(3)">
                <input type="email" name="lg" id="email" value="" 
                placeholder=<%= localeInScope.getISO3Country().equalsIgnoreCase("CHN")?"Email":"Email" %> />
              </div>
              <div class="12u 12u(3)">
                <input type="password" name="ps" id="passwd" value="" 
                placeholder=<%= localeInScope.getISO3Country().equalsIgnoreCase("CHN")?"密码":"Password" %> />
              </div>
              <div class="12u 12u(3)">
                <input type="password" name="pstoo" id="passwd2" value="" 
                placeholder=<%= localeInScope.getISO3Country().equalsIgnoreCase("CHN")?"确认密码":"Enter&nbsp;Password&nbsp;Again" %> />
              </div>
              <div class="12u 12u(3)">
                <input type="email" name="rm" id="remail" value="" 
                placeholder=<%= localeInScope.getISO3Country().equalsIgnoreCase("CHN")?"邀请人&nbsp;Email":"Referer's&nbsp;Email" %> />
              </div>
            </div>
            <input type="hidden" name="ModelName" value="SysLogin" /> 
            <input type="hidden" name="FunctionName" value="nmem" />
            <div class="row uniform">
              <div class="12u">
                <ul class="actions">
                  <li><input type="submit" value=<%= localeInScope.getISO3Country().equalsIgnoreCase("CHN")?"提交":"Submit" %> /></li>
                  <li><input type="reset" value=<%= localeInScope.getISO3Country().equalsIgnoreCase("CHN")?"清空":"Reset" %> class="alt" /></li>
                </ul>
              </div>
            </div>
            <div class="row uniform">
              <div id="cform_errorloc"></div>
            </div>
          </form>
        <script type="text/javascript" language="JavaScript" xml:space="preserve">
          //You should create the validator only after the definition of the HTML form   
          var frmvalidator  = new Validator("cform");   
          frmvalidator.EnableOnPageErrorDisplaySingleBox();
          frmvalidator.EnableMsgsTogether();      
          frmvalidator.addValidation("passwd","req","Password can not be blank");
          frmvalidator.addValidation("email","email","Please enter an valid email address");
          frmvalidator.addValidation("email","req","Email can not be blank");
          frmvalidator.addValidation("remail","email","Please enter an valid email address");
          frmvalidator.addValidation("remail","req","Referer's Email can not be blank");
          frmvalidator.addValidation("passwd2","eqelmnt=passwd","The confirmed password is not same as password");
        </script>
			</section>
