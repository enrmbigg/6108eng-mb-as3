

function getCookieVal (offset) {
var endstr = document.cookie.indexOf (";", offset);
if (endstr == -1)
endstr = document.cookie.length;
return unescape(document.cookie.substring(offset, endstr));
}

function GetCookie (name) {
var arg = name + "=";
var alen = arg.length;
var clen = document.cookie.length;
var i = 0;
while (i < clen) {
var j = i + alen;
if (document.cookie.substring(i, j) == arg)
return getCookieVal (j);
i = document.cookie.indexOf(" ", i) + 1;
if (i == 0) 
break; 
}
return null;
}

function SetCookie (name, value) {
var argv = SetCookie.arguments;
var argc = SetCookie.arguments.length;
var expires = (2 < argc) ? argv[2] : null;
var path = (3 < argc) ? argv[3] : null;
var domain = (4 < argc) ? argv[4] : null;
var secure = (5 < argc) ? argv[5] : false;
document.cookie = name + "=" + escape (value) +
((expires == null) ? "" : ("; expires=" + expires.toGMTString())) +
((path == null) ? "" : ("; path=" + path)) +
((domain == null) ? "" : ("; domain=" + domain)) +
((secure == true) ? "; secure" : "");
}

function DisplayInfo() {
var expdate = new Date();
var visit;
expdate.setTime(expdate.getTime() +  (24 * 60 * 60 * 1000 * 365)); 
if(!(visit = GetCookie("visit"))) 
visit = 0;
visit++;
SetCookie("visit", visit, expdate, "/", null, false);
var message;
if(visit <= 10) 
message="Welcome To Oval Ski Club!";
if(visit <= 20 && visit > 10) 
message="Welcome Back!";
if(visit <= 30 && visit > 20) 
message="Biggest Ski Club In Merseyside!";
if(visit <= 50 && visit > 30)
message="Why Dont You Become A Member?"; 
if(visit <= 60 && visit > 30) 
message="Dont Forget To Check The Annoucments!";
if(visit <= 70 && visit > 60) 
message="Keep Update To Date With The Latest Events!";
if(visit <= 80 && visit > 70)
message="Nothing But The Best Join OSC!"; 
if(visit <= 90 && visit > 80) 
message="OSC Rules!";
if(visit <= 110 && visit > 90)
message="OSC 4 Life!"; 
if(visit >= 111 ) 
message="WOW You Made It This Far!";
x=document.getElementById("demo");  // Find the element
x.innerHTML=("\n"+"Your browser has visited this page               \n"
            +"                              "+visit+"\n"
            +"                          time(s)."+"\n"+"\n"
            + " "+message);
y = document.getElementById("tag")   // Find the element
y.innerHTML =(message)
}

function ResetCounts() {
var expdate = new Date();
expdate.setTime(expdate.getTime() +  (24 * 60 * 60 * 1000 * 365)); 
visit = 0;
SetCookie("visit", visit, expdate , "/", null, false);
history.go(0);
}

window.onload=DisplayInfo

