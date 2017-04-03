<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
<html>
	<head>
    <title>${storename}</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<script src="/css/ie/html5shiv.js"></script>
		<script src="/js/jquery.min.js"></script>
		<script src="/js/jquery.dropotron.min.js"></script>
		<script src="/js/jquery.scrollgress.min.js"></script>
		<script src="/js/skel.min.js"></script>
		<script src="/js/skel-layers.min.js"></script>
		<script src="/js/init.js"></script>
		<script src="/js/cnt.js"></script>
    <script type='text/javascript' src='/js/simpleCart.js?ver=3.4.1'></script>
    <script type="text/javascript" language="JavaScript" src="/js/gen_validatorv4.js"></script>
		<noscript>
			<link rel="stylesheet" href="/css/skel.css" />
			<link rel="stylesheet" href="/css/style.css" />
			<link rel="stylesheet" href="/css/style-wide.css" />
      <!--link rel='stylesheet' href='/css/cart/style.css?ver=3.1.5' type='text/css' media='all' /-->
		</noscript>
		<link rel="stylesheet" href="/css/ie/v8.css" />
    <style>
      .selspecial {
        background:#e89980;
      }
    </style>
<%
    Locale locale = request.getLocale();
    String homeString = null;
    if(session.getAttribute("home")!=null){
      homeString = session.getAttribute("home").toString();
    }
    String currency = "USD";
    String currencySymbol = "$";
    if(session.getAttribute("currency")!=null){
      currency = session.getAttribute("currency").toString();
      System.out.println(currency);
      if(currency.equalsIgnoreCase("CNY")){
        currencySymbol = "￥";
      }
    }
%>
	</head>
	<body class="landing">

		<!-- Header -->
			<header id="header" class="alt">
				<h1><a href="/">Store</a> by HTML5U</h1>
				<nav id="nav">
					<ul>
<%
    if(homeString==null || homeString.equals("MotherOfAll")){
%>
            <li><a href="/"><%= locale.getISO3Country().equalsIgnoreCase("CHN")?"主页":"Home" %></a></li>
            <li><a href="/store"><%= locale.getISO3Country().equalsIgnoreCase("CHN")?"商店主页":"Store Home" %></a></li>
<%
    if(session.getAttribute("user")!=null){
      String useremail = session.getAttribute("user").toString();
      out.println("<li><a href=\"\" class=\"icon fa-angle-down\">"+useremail+"</a>");
%>
							<ul>
                <li><a href="/control?ModelName=PpMod&FunctionName=order"><%= locale.getISO3Country().equalsIgnoreCase("CHN")?"我的订单":"Orders" %></a></li>
                <li><a href="/control?ModelName=SysLogin&FunctionName=signout"><%= locale.getISO3Country().equalsIgnoreCase("CHN")?"退出":"Sign out" %></a></li>
							</ul>
						</li>
<%
    } else{
%>
            <li><a href="/storelogin" class="icon fa-angle-down"><%= locale.getISO3Country().equalsIgnoreCase("CHN")?"会员登录":"Member Signin" %></a>
						</li>
<%
    }
%>
            <li><a href="#contactsection" class="button"><%= locale.getISO3Country().equalsIgnoreCase("CHN")?"会员注册":"Sign Up For Membership" %></a></li>
<%
    } else{
      String cartlink = session.getAttribute("cartlink").toString();
      String tagName = "Store Home";
      if(locale.getISO3Country().equalsIgnoreCase("CHN")){
        tagName="商店主页";
      }
      out.println("<li><a href=\""+cartlink+"\">"+tagName+"</a></li>");
      if(session.getAttribute("user")!=null){
        String useremail = session.getAttribute("user").toString();
        out.println("<li><a href=\"\" class=\"icon fa-angle-down\">"+useremail+"</a>");
%>
							<ul>
                <li><a href="/control?ModelName=PpMod&FunctionName=order"><%= locale.getISO3Country().equalsIgnoreCase("CHN")?"我的订单":"Orders" %></a></li>
                <li><a href="/control?ModelName=SysLogin&FunctionName=signout"><%= locale.getISO3Country().equalsIgnoreCase("CHN")?"退出":"Sign out" %></a></li>
							</ul>
						</li>
<%
    } else{
%>
            <li><a href="/storelogin" class="icon fa-angle-down"><%= locale.getISO3Country().equalsIgnoreCase("CHN")?"会员登录":"Member Signin" %></a>
						</li>
<%
    }
%>
            <li><a href="#contactsection" class="button"><%= locale.getISO3Country().equalsIgnoreCase("CHN")?"会员注册":"Sign Up For Membership" %></a></li>
<%
    }
%>
					</ul>
				</nav>
			</header>

		<!-- Banner -->
			<section id="banner">
        <a name="top"></a>
        <h2>${storename}</h2>
			</section>

		<!-- Main -->
			<section id="main" class="container">
				<section class="box special features">


          <a class="cartlink button" href="#cartsection">
            <%= locale.getISO3Country().equalsIgnoreCase("CHN")?"购物车":"Cart: " %> (<span class="simpleCart_quantity"></span> <%= locale.getISO3Country().equalsIgnoreCase("CHN")?"件":"items" %>)
          </a>
					<header class="major">
				<!--nav id="nav">
            <h2><%= locale.getISO3Country().equalsIgnoreCase("CHN")?"商品目录":"Featured Products" %></h2>
            <ul class="align-right"><a href="" class="icon fa-angle-down"><%= locale.getISO3Country().equalsIgnoreCase("CHN")?"分类":"Category" %></a>
							<ul>
                <li><a href="/store"><%= locale.getISO3Country().equalsIgnoreCase("CHN")?"商店":"Store" %></a></li>
                <li><a href="/cloudoffice"><%= locale.getISO3Country().equalsIgnoreCase("CHN")?"云办公室":"CloudOffice" %></a></li>
                <li><a href="/retrieve-password"><%= locale.getISO3Country().equalsIgnoreCase("CHN")?"找回密码":"Retrieve Password" %></a></li>
							</ul>
          </ul>
				</nav-->
					</header>
					<!--span class="image featured"><img src="unsplash/cafe.jpeg" alt="" /></span-->
<%
    int i = 0;
    Vector tResMapFood = (Vector) request.getAttribute("list");
    Iterator it = tResMapFood.iterator();
    while (it.hasNext())
    {
      if(i%2==0){
        out.println("<div class=\"features-row\">");
      }
      Hashtable row = (Hashtable) it.next();
      String title = row.get("fFoodName").toString();
      String desc = row.get("fResFoodIntr").toString();
      String photo = row.get("fResFoodPic").toString();
      String id = row.get("fResFoodID").toString();
      String price = row.get("fBasePrice").toString();
      String sh = row.get("fCost").toString();

      out.println("<section>"
                +"<div class=\"simpleCart_shelfItem\">"
                +"<h3><a href=\"/control?ModelName=MenuModel&FunctionName=product&p=pro"+id+"\" class=\"item_name\">"+title+"</a></h3>"
                +"<h3 class=\"item_xoxo\" style=\"display:none\">"+id+"</h3>"
                +"<h3 class=\"item_sipping\" style=\"display:none\">"+sh+"</h3>"
                +"<a href=\"/control?ModelName=MenuModel&FunctionName=product&p=pro"+id+"\"><img class=\"image fit\" src="+photo+" /></a>");
      if(locale.getISO3Country().equalsIgnoreCase("CHN")){
                out.println("<strong class=\"item_price\">￥"+price+"</strong> <input type=\"button\" class=\"item_add\" value=\"加入购物车\" />"
                +"</div>"
						    +"</section>");
      }
      else{
                out.println("<strong class=\"item_price\">"+currencySymbol+price+"</strong> <input type=\"button\" class=\"item_add\" value=\"add to cart\" />"
                +"</div>"
						    +"</section>");
      }
      i++;
      if(i%2==0){
        out.println("</div>");
      }
    }
%>
				</section>
					
				<div class="row uniform">
					<div class="12u 12u(2)">
						<section class="box special">
					    <a name="cartsection"></a>
<%
      if(locale.getISO3Country().equalsIgnoreCase("CHN")){
			  out.println("<h3>购物车</h3>"
            +"<p class=\"align-right\"><a href=\"javascript:;\" class=\"simpleCart_empty button\">清空购物车</a> <br /> </p>");
      }
      else{
			  out.println("<h3>Shopping Cart</h3>"
            +"<p class=\"align-right\"><a href=\"javascript:;\" class=\"simpleCart_empty button\">empty cart</a> <br /> </p>");
      }
%>
    <div class="simpleCart_items"></div>
    <div id="cartTotal" class="align-right">
<%
      if(locale.getISO3Country().equalsIgnoreCase("CHN")){
        out.println("小计: <span class=\"simpleCart_total\"></span>"); 
      }
      else{
        out.println("SubTotal: <span class=\"simpleCart_total\"></span>"); 
      }
%>
    </div>
    <div id="cartTotal" class="align-right">
<%
    if(homeString!=null && !homeString.equals("MotherOfAll")){
      if(locale.getISO3Country().equalsIgnoreCase("CHN")){
      out.println("<span>运费打折计算方式见&nbsp;**&nbsp; &nbsp; &nbsp; </span>");
      }
      else{
        out.println("<span>See ** for how shipping fee discount is calculated&nbsp;&nbsp;</span>");
      }
    }
%>
      <%= locale.getISO3Country().equalsIgnoreCase("CHN")?"快递费":"Shipping" %> <span class="simpleCart_shipping"></span>
    </div>
    <div id="cartTotal" class="align-right">
<%
      if(locale.getISO3Country().equalsIgnoreCase("CHN")){
        out.println("合计: <span class=\"simpleCart_grandTotal\"></span>");
      }
      else{
        out.println("Total: <span class=\"simpleCart_grandTotal\"></span>");
      }
%>
    </div>
    <div class="clear">&nbsp;</div>

    <div id="cartTotal">
    <p class="align-right">
<%
    if(locale.getISO3Country().equalsIgnoreCase("CHN")){
%>
      <a class="button alt" href="">返回购物</a>
        <span><a href="javascript:;" class="simpleCart_checkout button">结算</a></span>
<%
    }
    else{
%>
      <a class="button alt" href="">Continue Shopping</a>
        <span><a href="javascript:;" class="simpleCart_checkout button">Checkout</a></span>
<%
    }
%>
    </p>
    </div>
              
      <p>${shippingpolicy}</p>
      <p>${reminder}</p>
<%
    if(homeString==null || homeString.equals("MotherOfAll")){
%>
							<ul class="actions">
<%
              String agent = request.getHeader("User-Agent");
              if(agent.toLowerCase().contains("ipad; cpu") ||
                  agent.toLowerCase().contains("iphone; cpu")){
                agent = "sms:sales@vendease.com";
              }
              else if(agent.toLowerCase().contains("mac os")){
                agent = "imessage:sales@vendease.com";
              }
              else{
                agent = "mailto:sales@vendease.com";
              }
%>
                <li><a href="<%= agent %>" class="button alt"><%= locale.getISO3Country().equalsIgnoreCase("CHN")?"联系客服":"Learn More" %></a></li>
							</ul>
<%
    }
%>
						</section>
						
					</div>
				</div>
			</section>
			
      <%@ include file="/WEB-INF/storesignup.jsp" %>

<script type='text/javascript'>
/* <![CDATA[ */
//Initialize simpleCartjs
simpleCart({
  checkout: {
    type: "SendForm", 
    url: "https://www.vendease.com/control?ModelName=PpMod&FunctionName=expco", 
    method: "POST"
  },
  cartStyle: 'table', 
<%
if(locale.getISO3Country().equalsIgnoreCase("CHN")){
%>
  cartColumns: [
    {attr: "name" , label: "名称" },
    {attr: "price" , label: "价格", view: 'currency' },
    {attr: "sipping" , label: "单件运费", view: 'currency' },
    {view: "decrement" , label: false },
    {attr: "quantity" , label: "数量" },
    {view: "increment" , label: false },
    //{view: "remove" , text: "删除" , label: false },
    {attr: "total" , label: "小计", view: 'currency'}
  ],
<%
}
else{
%>
  cartColumns: [
    {attr: "name" , label: "Name" },
    { attr: "price" , label: "Price", view: 'currency' },
    {attr: "sipping" , label: "Shipping", view: 'currency' },
    {view: "decrement" , label: false },
    {attr: "quantity" , label: "Qty" },
    {view: "increment" , label: false },
    {attr: "total" , label: "SubTotal", view: 'currency'}
  ],
<%
}
  out.println("currency: \""+currency+"\",");
%>
  taxRate: 0 
});

simpleCart.bind("beforeCheckout", function(data){
  if(simpleCart.quantity()==0){ 
    return false;
  }
});

<%
if(homeString!=null){
%>
simpleCart.shipping(function(){
  var total = 0;
  var cnt = 0;
  var sip = 0;
  simpleCart.each( function( item ){
    cnt += item.quantity();
    sip = item.get('sipping');
  });
  if(cnt>12) cnt=12;
  total+= cnt*sip * (1 - cnt/12);
  return total;
});
<%
}
%>
/* ]]> */
</script>
	</body>
</html>
