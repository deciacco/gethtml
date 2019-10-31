HELP/INFORMATION
===============================

This program was developed with Visual Foxpro 9 SP1 and it is used to "GET" the HTML of a web page. It only works with a get request to a server, so it will not get the HTML of a form posting. For more information please visit the links listed at the bottom of this document.

Enter a URL in the text box, then press the Get HTML button. Make sure the url is includes the protocol. 
http://www.google.com 	== Good
www.google.com		== Bad
google.com		== Bad

You can right click to cut, copy, paste. 
You can shift click to highlight all.

The main purpose of this program is to get the HTML of a web page. After experimenting with the West Wind Internet and Client Tools and then with my own version of a wininet.dll wrapper, I decided the easiest way was to use the WinHTTP service. I didn't even know it existed until I found it on Calvin Hsia's Weblog. (See link below)

Below is the main code of the application. Look at the links provided for more information on the oHTTP object instantiated in the code.

Thisform.MousePointer = 11
Try

	Local oHTTP As "winhttp.winhttprequest.5.1"

	oHTTP=Newobject("winhttp.winhttprequest.5.1")

	oHTTP.Open("GET",Trim(Thisform.txtUrl.Value),.F.)
	
	oHTTP.Option(4) = 13056 && Ignore ssl errors
	
	* Lets look like IE
	oHTTP.SetRequestHeader("user-agent", ;
		"Mozilla/4.0 (compatible; MSIE 6.0; Windows ;
		NT 5.2; .NET CLR 1.0.3705;)")
		
	oHTTP.Send()

	Thisform.txtHtml.Value = oHTTP.ResponseText
	Thisform.txtHeaders.Value = oHTTP.GetAllResponseHeaders
Catch To ex
	Thisform.txtHtml.Value = ex.Message
Finally
	Thisform.MousePointer = 0
Endtry


Comments, Questions, or Suggestions please contact Deciacco.com.


deciacco.com
contact@deciacco.com


THANKS
===================
Thanks to all the wonderful people in the Foxpro community that took a few minutes out of their day to answer questions.

LINKS
===================

http://blogs.msdn.com/calvin_hsia/archive/2006/05/25/607588.aspx

http://msdn.microsoft.com/library/default.asp?url=/library/en-us/winhttp/http/what_s_new_in_winhttp_5_1.asp

http://www.west-wind.com/wwClientTools.asp

http://www.ctl32.com.ar/default.asp

OTHER
===================
Microsoft and Visual FoxPro are either registered trademarks or trademarks of Microsoft Corporation in the United States and/or other countries.

This program and deciacco.com are not affiliated with or endorsed by Microsoft in any way.
