var IDRViewer=function(){var u={View:{MultiFile:0,SplitSpreads:1,SingleFile:2,IDR:3}},m=1,w=0,x=0,d=0,p=0,sa=0,f,n,q,r,aa=[],ba,B,ha=!0,ta,F,k=u.View,P=k.MultiFile,A,D,Q,I,ca,ua,R,L,ka,la,G,M,va,wa,xa,ya,da,S,ea,T,fa,za,Aa,Ba,H={},t;u.makeNavBar=function(a,b,c,e){ba=/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);/iPhone|iPad|iPod/i.test(navigator.userAgent);F=!e;t=c;n=g("contentContainer");q=g("mainContent");p=a;g("pgCount").innerHTML="/"+p;A=g("goBtn");
D=g("zoomBtn");Q=g("btnFullscreen");I=g("btnOutlines");ca=g("btnThumbnails");ua=g("btnPrev");g("btnNext");R=g("btnMove");L=g("btnSelect");ka=g("btnZoomIn");la=g("btnZoomOut");S=0;ea=1;M=0;va=1;wa=2;xa=3;ya=4;B=da=5;f=g("jpedal");U.setup(t,b);document.fullscreenEnabled||document.msFullscreenEnabled||document.mozFullScreenEnabled||document.webkitFullscreenEnabled?(V("fullscreenchange",document,ia),V("MSFullscreenChange",document,ia),V("mozfullscreenchange",document,ia),V("webkitfullscreenchange",document,
ia)):Q.parentNode.removeChild(Q);this.setSelectMode(S);a=Da("page");a=""!=a?parseInt(a):1;if(ba){D.parentNode.removeChild(D);R.parentNode.removeChild(R);L.parentNode.removeChild(L);ka.parentNode.removeChild(ka);la.parentNode.removeChild(la);q.style.overflow="hidden";W.setup(a);var h=window.innerWidth,y=window.innerHeight;c=function(){setTimeout(function(){if(h!==window.innerWidth||y!==window.innerHeight)n.innerHTML="",m=1,h=window.innerWidth,y=window.innerHeight,W.setup(d)},300)};window.onorientationchange=
c;window.onresize=c}else{for(b=0;b<p;b++)if(c[b][0]!=c[0][0]||c[b][1]!=c[0][1]){ha=!1;break}ha&&!ta&&1<p&&(G=document.createElement("select"),G.id="viewBtn",c=document.createElement("option"),c.innerHTML="Single Pages",G.appendChild(c),c=document.createElement("option"),c.innerHTML="Magazine",G.appendChild(c),c=document.createElement("option"),c.innerHTML="Continuous",G.appendChild(c),G.onchange=Ea,g("mainNav").appendChild(G),G.selectedIndex=P);H.setViewMode(P);ha&&P===k.SplitSpreads?X.setup(a):ha&&
P===k.SingleFile?N.setup(a):O.setup(a);B=da;D.selectedIndex=B;window.onresize=E}};var U=function(){var a={},b=[],c=0,e,h,y,f=!1,l=!1,v=!1,na=!0;a.setup=function(a,c){h=g("leftContent");e=g("left");y=c;n(a);for(var d=0;d<p;d++)b[d]=!1;l=f=!1;V("scroll",h,k);d=document.createElement("script");d.setAttribute("src","bookmarks/bookmarks.js");d.setAttribute("onload","IDRViewer.setBookmarks(bookmarks);");d.onreadystatechange=function(){"complete"==this.readyState&&IDRViewer.setBookmarks(bookmarks)};(document.head||
document.getElementsByTagName("head")[0]).appendChild(d)};a.toggleThumbnails=function(){f?(e.style.width="0",e.style.left="-20px"):(m(-1),e.style.width="200px",e.style.left="0",k());f=!f};a.toggleOutlines=function(a){l&&!a?(g("thumbnailPanel").style.display="inline",g("outlinePanel").style.display="none",h.scrollTop=g("thumb"+d).getBoundingClientRect().top-80,l=!l,ca.className="inactive navBtn",I.className="navBtn"):a&&"inactive navBtn"!=I.className&&(g("thumbnailPanel").style.display="none",g("outlinePanel").style.display=
"inline",l=!l,ca.className="navBtn",I.className="inactive navBtn")};var n=function(a){for(var b=[],c=0;c<p;c++){var d=Math.floor(160/a[c][0]*a[c][1]);b[c]=a[c][0]>a[c][1]||200>=d?d:200}for(a=1;a<=p;a++){var e=document.createElement("a");e.style.height=b[a-1]+"px";e.className="thumbnail";e.href="?page="+a;e.id="thumb"+a;(function(a){e.onclick=function(){na=!1;IDRViewer.goToPage(a);return!1}})(a);e.setAttribute("title","Page "+a);e.innerHTML='<img src="assets/loading.gif"/>';h.children[0].appendChild(e)}},
k=function(a){var b=h.scrollTop;c=b;setTimeout(function(){m(b)},500)},m=function(a){if(a==c||-1==a)for(a=0;a<p;a++)if(!b[a]){var d=h.children[0].children[a];if(d.offsetTop>h.scrollTop+h.clientHeight)break;d.offsetTop+d.clientHeight>h.scrollTop&&(d=a,b[d]||(h.children[0].children[d].children[0].setAttribute("src","thumbnails/"+(d+1)+y),b[d]=!0))}};a.scrollToPage=function(a,b){var c=g("thumb"+a);if("thumbnail currentPageThumbnail"!=c.className){for(var d=1;d<=p;d++)g("thumb"+d).className="thumbnail";
c.className="thumbnail currentPageThumbnail";na&&(d=v?80:40,h.scrollTop=h.scrollTop+c.getBoundingClientRect().top-d)}"undefined"!=typeof b&&(g("thumb"+b).className="thumbnail currentPageThumbnail");na=!0};a.setBookmarks=function(a){g("leftContent").style.top="40px";g("leftNav").style.display="block";q(g("outlinePanel"),a);l?ca.className="navBtn":I.className="navBtn";v=!0};var q=function(a,b){for(var c=document.createElement("ul"),d=0;d<b.length;d++)(function(){var a=b[d],e=document.createElement("li");
e.setAttribute("title","Page "+a.page);e.innerHTML=a.title;e.onclick=function(){IDRViewer.goToPage(parseInt(a.page))};c.appendChild(e);"undefined"!=typeof a.children&&q(c,a.children)})();a.appendChild(c)};return a}(),Ca=function(){A.style.width="65px";A.innerHTML="";var a=document.createElement("option");a.value=1;a.innerHTML="1";A.appendChild(a);for(var b,c=2;c<=p;c+=2)a=document.createElement("option"),a.value=c,b=c!==p||1===p%2?String(c+"-"+(c+1)):String(c),a.innerHTML=b,A.appendChild(a);A.selectedIndex=
d/2},oa=function(){A.innerHTML="";for(var a=1;a<=p;a++){var b=document.createElement("option");b.value=a;b.innerHTML=String(a);A.appendChild(b)}A.selectedIndex=d-1},C={applyTransform:function(a,b){a.style.webkitTransform=b;a.style.mozTransform=b;a.style.msTransform=b;a.style.oTransform=b;a.style.transform=b},applyTransformOrigin:function(a,b){a.style.webkitTransformOrigin=b;a.style.mozTransformOrigin=b;a.style.msTransformOrigin=b;a.style.oTransformOrigin=b;a.style.transformOrigin=b},applyTransitionDuration:function(a,
b){a.style.webkitTransitionDuration=b;a.style.mozTransitionDuration=b;a.style.msTransitionDuration=b;a.style.oTransitionDuration=b;a.style.transitionDuration=b}},X=function(){var a={},b,c,d,h,y;a.setup=function(c){r=k.SplitSpreads;Ca();w=t[0][0];x=t[0][1];b=w;window.onpopstate=function(b){a.goToPage(b.state.page,!1)};a.goToPage(c,!1)};a.goToPage=function(a,c){a>p&&(a=p);1!==a&&0!==a%2&&--a;f.parentNode.removeChild(f);h=d=void 0;H.setPage(a);var l=1<a&&a<p,k=l?a+1:void 0;U.scrollToPage(a,k);w=b;l&&
(w*=2);n.style.width=w+"px";var q="container"+a;A.selectedIndex=a/2;if(c&&history.pushState)try{history.pushState({page:a},null,"?page="+a)}catch(t){}f=document.createElement("div");f.id=q;f.style.width=w+"px";n.appendChild(f);C.applyTransformOrigin(f,"top left");f.style.margin="0";E();if(F)d=document.createElement("object"),d.setAttribute("width",""+b),d.setAttribute("height",""+x),d.setAttribute("data",a+".svg"),d.setAttribute("type","image/svg+xml"),f.appendChild(d),E();else{var r=function(){y||
(m(),y=!0);var c=document.createElement("iframe");c.setAttribute("src",a+".html");c.setAttribute("style","width: "+b+"px; height: "+x+"px; position: absolute; border: 0;");c.onload=function(){d=c};f.appendChild(c)};$.ajax({url:a+".html",success:function(b){try{var c=$("<div />").html(b).find("#jpedal").attr("id","page"+a).css({position:"absolute"});$(f).append(c);setTimeout(function(){if("file:"==window.location.protocol){var b=g("fonts"+a),c=document.createElement("style");c.setAttribute("type",
"text/css");c.innerHTML=b.innerHTML;f.appendChild(c)}},1)}catch(d){r()}},error:r})}if(l)if(F)h=document.createElement("object"),h.setAttribute("width",""+b),h.setAttribute("height",""+x),h.setAttribute("data",k+".svg"),h.setAttribute("type","image/svg+xml"),h.setAttribute("style","position: absolute; left: "+b+"px;"),f.appendChild(h),E();else{var u=function(){y||(m(),y=!0);var a=document.createElement("iframe");a.setAttribute("src",k+".html");a.setAttribute("style","width: "+b+"px; height: "+x+"px; position: absolute; border: 0; left: "+
b+"px;");a.onload=function(){h=a};f.appendChild(a)};$.ajax({url:k+".html",success:function(a){try{var c=$("<div />").html(a).find("#jpedal").attr("id","page"+k).css({position:"absolute",left:b});$(f).append(c);setTimeout(function(){if("file:"==window.location.protocol){var a=g("fonts"+k),b=document.createElement("style");b.setAttribute("type","text/css");b.innerHTML=a.innerHTML;f.appendChild(b)}},1)}catch(d){u()}},error:u})}};var m=function(){Y.currentSelectMode==ea?a.enablePanning():a.enableTextSelection()};
a.enableTextSelection=function(){if(y||F)l(),c.style.visibility="hidden"};a.enablePanning=function(){if(y||F)"undefined"!=typeof d&&Z(d.contentWindow),"undefined"!=typeof h&&Z(h.contentWindow),l(),c.style.visibility="visible"};var l=function(){"undefined"==typeof c&&(c=document.createElement("div"),c.id="jpedalOverlay",c.setAttribute("style","width: inherit; height: inherit; position: absolute; z-index: 10; visibility: hidden;"),n.insertBefore(c,n.firstChild))};return a}(),O=function(){var a={},b,
c,e;a.setup=function(b){r=k.MultiFile;oa();window.onpopstate=function(b){a.goToPage(b.state.page,!1)};a.goToPage(b,!1)};a.goToPage=function(c,h){f.parentNode.removeChild(f);b=void 0;H.setPage(c);U.scrollToPage(d);w=t[d-1][0];x=t[d-1][1];n.style.width=w+"px";n.style.height=x+"px";q.scrollTop=0;A.selectedIndex=d-1;if(h&&history.pushState)try{history.pushState({page:d},null,"?page="+d)}catch(k){}if(F)f=document.createElement("object"),f.setAttribute("width",""+w),f.setAttribute("height",""+x),f.setAttribute("data",
d+".svg"),f.setAttribute("type","image/svg+xml"),f.setAttribute("id","jpedal"),n.appendChild(f),b=f,C.applyTransformOrigin(f,"top left"),E();else{var l=function(){e||(Y.currentSelectMode==ea?a.enablePanning():a.enableTextSelection(),e=!0);f=document.createElement("iframe");f.setAttribute("id","jpedal");f.setAttribute("src",d+".html");f.setAttribute("style","width: "+w+"px; height: "+x+"px; position: relative; border: 0;");f.onload=function(){b=f};n.appendChild(f);C.applyTransformOrigin(f,"top left");
E()};$.ajax({url:d+".html",success:function(a){try{var b=$("<div />").html(a).find("#jpedal").css({margin:"0",overflow:"hidden",position:"relative"});$(n).append(b);setTimeout(function(){f=g("jpedal");C.applyTransformOrigin(f,"top left");E();if("file:"==window.location.protocol){var a=g("fonts"+d),b=document.createElement("style");b.setAttribute("type","text/css");b.innerHTML=a.innerHTML;a.parentNode.removeChild(a);g("jpedal").appendChild(b)}},1)}catch(c){l()}setTimeout(function(){H.pageLoad(d)},
0)},error:l})}};a.enableTextSelection=function(){if(e||F)h(),c.style.visibility="hidden"};a.enablePanning=function(){if(e||F)"undefined"!=typeof b&&Z(b.contentWindow),h(),c.style.visibility="visible"};var h=function(){"undefined"==typeof c&&(c=document.createElement("div"),c.id="jpedalOverlay",c.setAttribute("style","width: inherit; height: inherit; position: absolute; z-index: 10; visibility: hidden;"),n.insertBefore(c,n.firstChild))};return a}(),N=function(){var a={},b=[],c=0,e,h,y;a.setup=function(c){r=
k.SingleFile;oa();e=[];window.onpopstate=function(b){a.goToPage(b.state.page,!1)};C.applyTransformOrigin(f,"top left");x=0;w=t[0][0];for(var d=0;d<p;d++){b[d]=!1;var g=document.createElement("div");g.id="page"+(d+1);g.setAttribute("style","position:relative; overflow: hidden; background-color: white; margin: 0 auto 10px; width: "+t[d][0]+"px; height: "+t[d][1]+"px;");f.appendChild(g);x+=t[d][1]+10}n.style.height=x+"px";q.onscroll=m;a.goToPage(c,!1)};var m=function(a){var e=window.pageYOffset;c=e;
setTimeout(function(){if(e==c){if(0<g("page1").getBoundingClientRect().top)H.setPage(1),A.selectedIndex=d-1;else for(var a=1;a<=p;a++){var h=g("page"+a).getBoundingClientRect(),f=h.top,h=h.bottom-h.top;if(f<=.25*h&&f>.5*-h){H.setPage(a);A.selectedIndex=d-1;break}}U.scrollToPage(d);for(a=1;a<=p;a++)b[a]||(h=g("page"+a),f=h.getBoundingClientRect().top,f<=h.clientHeight&&f>=-h.clientHeight&&l(a))}},250)};a.goToPage=function(a,c){q.scrollTop=q.scrollTop+g("page"+a).getBoundingClientRect().top-45;b[a]||
l(a)};var l=function(c){b[c]=!0;if(F){var d=document.createElement("object");d.setAttribute("width",""+t[c-1][0]);d.setAttribute("height",""+t[c-1][1]);d.setAttribute("data",c+".svg");d.setAttribute("type","image/svg+xml");e[c-1]=d;g("page"+c).appendChild(d)}else{var f=function(){h||(Y.currentSelectMode==ea?a.enablePanning():a.enableTextSelection(),h=!0);var b=document.createElement("iframe");b.setAttribute("src",c+".html");b.setAttribute("style","width: "+t[c-1][0]+"px; height: "+t[c-1][1]+"px; position: relative; border: 0;");
e[c-1]=b;g("page"+c).appendChild(b)};$.ajax({url:c+".html",success:function(a){try{var b=$("<div />").html(a).find("#jpedal").html();$("#page"+c).html(b);setTimeout(function(){if("file:"==window.location.protocol){var a=g("fonts"+c),b=document.createElement("style");b.setAttribute("type","text/css");b.innerHTML=a.innerHTML;a.parentNode.removeChild(a);g("jpedal").appendChild(b)}},1)}catch(d){f()}},error:f})}};a.enableTextSelection=function(){if(h||F)v(),y.style.visibility="hidden"};a.enablePanning=
function(){if(h||F){for(var a=0;a<e.length;a++)"undefined"!=typeof e[a]&&Z(e[a].contentWindow);v();y.style.visibility="visible"}};var v=function(){"undefined"==typeof y&&(y=document.createElement("div"),y.id="jpedalOverlay",y.setAttribute("style","width: inherit; height: inherit; position: absolute; z-index: 10; visibility: hidden;"),n.insertBefore(y,n.firstChild))};return a}(),W=function(){var a={},b=[],c=[],e=[],h,f,u,l=0,v=0,w,x,B=0,D,E,G,M,z,S=!1;a.next=function(){this.goToPage(z?d+2:d+1,!0,!0)};
a.prev=function(){this.goToPage(d-1,!0,!0)};a.setup=function(Fa){r=k.IDR;n.removeAttribute("style");n.style.overflow="visible";n.style.padding="0";n.style.margin="0";n.style.webkitBackfaceVisibility="hidden";n.style.webkitPerspective="1000";S||(q.addEventListener("touchstart",ia),q.addEventListener("touchmove",ka),q.addEventListener("touchend",la),S=!0);z=window.innerWidth>window.innerHeight;H.setViewMode(k.IDR,z?"landscape":"portrait");if(!ha||t[0][0]>t[0][1])z=!1;z?Ca():oa();for(var c=1;c<=p;c++)b[c]=
!1;window.onpopstate=function(b){b.state&&a.goToPage(b.state.page,b.state.slide,!1)};setTimeout(function(){a.goToPage(Fa,!1,!1)},0)};var P=!1,I=!1,ga,R,L=!1,ea,T,V,W,X,N,O,Y,Z,aa,ba,Q,J,K,ca,da,fa,ia=function(a){D=P=!1;1!==a.touches.length||L||1!==m||(R=a.touches[0].clientX,T=a.touches[0].clientX,V=a.touches[0].clientY,W=T,X=V,P=!0,ea=Date.now());ca&&(da=!0);1===a.touches.length&&1<m&&(E=a.touches[0].clientX,G=a.touches[0].clientY,M=!0,N=v,O=l,Y=N,Z=O,aa=Date.now(),ba=Date.now(),Q||(Q=setInterval(function(){N=
Y;O=Z;Y=v;Z=l;ba=aa;aa=Date.now()},200)));if(2===a.touches.length&&!I){D=!0;M=!1;pa(d);var b=a.touches[0].clientX-h,c=a.touches[1].clientX-h,e=a.touches[0].clientY;a=a.touches[1].clientY;u=Math.sqrt(Math.pow(Math.abs(b-c),2)+Math.pow(Math.abs(e-a),2));w=b-(b-c)/2;x=e-(e-a)/2}},ka=function(a){a.preventDefault();a.stopPropagation();if(1===a.touches.length&&P&&1===m){I=!0;var b=R-a.touches[0].clientX;0!==b&&(R=a.touches[0].clientX,W=a.touches[0].clientX,X=a.touches[0].clientY,ga-=b,C.applyTransform(n,
"translate3d("+ga+"px, 0, 0)"))}else if(1===a.touches.length&&M){fa=!0;b=a.touches[0].clientX;a=a.touches[0].clientY;var c=a-G;v+=b-E;l+=c;E=b;G=a;qa();requestAnimationFrame(function(){ma(v,l,m,!0)},g("main"))}else if(2===a.touches.length&&!L&&a.cancelable&&D&&!I&&(B=(B+1)%2,1!==B)){var d=a.touches[0].clientX-h,e=a.touches[1].clientX-h,c=a.touches[0].clientY,f=a.touches[1].clientY;a=Math.sqrt(Math.pow(Math.abs(d-e),2)+Math.pow(Math.abs(c-f),2));b=a/u;1>m*b&&(m=b=1);4<m*b&&(b=1);m*=b;d-=(d-e)/2;c-=
(c-f)/2;v=v+d-w;l=l+c-x;e=-v+d;v-=e*b-e;e=-l+c;l-=e*b-e;qa();w=d;x=c;requestAnimationFrame(function(){ma(v,l,m,!0)},g("main"));u=a}},la=function(b){var c;if(0===b.touches.length){if(I){var e=I=!1;300>Date.now()-ea&&(b=T-W,c=V-X,100<Math.abs(b)&&Math.abs(b)>.25*Math.abs(c)&&(e=!0,0<b?a.next():a.prev()));e||(b=-window.innerWidth*(d-1),z&&(b=-window.innerWidth*Math.floor(d/2)),ga>b+window.innerWidth/2?a.prev():ga<b-window.innerWidth/2?a.next():a.goToPage(d,!0,!1))}clearInterval(Q);Q=null;fa&&(fa=!1,
e=Date.now()-ba,b=N-v,c=O-l,J=b/(e/16),K=c/(e/16),.5>Math.abs(J)&&(J=0),.5>Math.abs(K)&&(K=0),0===J&&0===K||window.requestAnimationFrame(ja,g("main")))}},ja=function(){ca=!0;!da&&(-.5>J||.5<J||-.5>K||.5<K)?(v-=J,l-=K,J*=.95,K*=.95,qa(),ma(v,l,m,!0),window.requestAnimationFrame(ja,g("main"))):da=ca=!1},qa=function(){0<v&&(J=v=0);0<l&&(K=l=0);var a=t[d-1][0]*e[d];z&&(a*=2);var b=a*m;v<a-b&&(v=a-b,J=0);a=t[d-1][1]*e[d];b=a*m;l<a-b&&(l=a-b,K=0)},ma=function(a,b,f,h){a=Math.round(2*a)/2;b=Math.round(2*
b)/2;a=h?"translate3d("+(a+c[d])+"px, "+b+"px, 0) scale("+f*e[d]+")":"translateX("+(a+c[d])+"px) translateY("+b+"px) scale("+f*e[d]+")";b=g("page"+d);C.applyTransform(b,a)},ra=function(a){if(!b[a]){var d=document.createElement("div");d.setAttribute("id","page"+a);d.style.width=z&&1!=a&&(a<p||1===p%2)?2*t[a][0]+"px":t[a-1][0]+"px";d.style.height=t[a-1][1]+"px";pa(a);c[a]=z&&1!=a?window.innerWidth*Math.floor(a/2)+h:window.innerWidth*(a-1)+h;C.applyTransform(d,"translate3d("+c[a]+"px, 0, 0) scale("+
e[a]+")");C.applyTransformOrigin(d,"top left");d.style.marginTop=f+"px";d.style.position="absolute";n.appendChild(d)}b[a]||(F?(b[a]=!0,d=document.createElement("div"),d.setAttribute("style","position: absolute"),g("page"+a).appendChild(d),$(d).load(a+".svg")):$.ajax({url:a+".html",success:function(c){b[a]||(b[a]=!0,c=$("<div />").html(c).find("#jpedal").css("position","absolute"),$("#page"+a).append(c))}}));z&&1!=a&&!b[a+1]&&a!=p&&(F?(b[a+1]=!0,d=document.createElement("div"),d.setAttribute("style",
"position: absolute; left: "+t[a][0]+"px"),g("page"+a).appendChild(d),$(d).load(a+1+".svg")):$.ajax({url:a+1+".html",success:function(c){b[a+1]||(b[a+1]=!0,c=$("<div />").html(c).find("#jpedal").css("position","absolute"),(a<p||1===p%2)&&c.css("left",t[a][0]),$("#page"+a).append(c))}}))},pa=function(a){var b;b=z&&1!=a&&(a<p||1===p%2)?(window.innerWidth-20)/(2*t[a][0]):(window.innerWidth-20)/t[a-1][0];var c=(window.innerHeight-40-20)/t[a-1][1];b<c?(e[a]=b,h=10):(e[a]=c,h=(window.innerWidth-20-(z&&
1!=a&&(a<p||1===p%2)?2*t[a][0]*e[a]:t[a-1][0]*e[a]))/2+10);return f=(window.innerHeight-40-t[a-1][1]*e[a])/2};a.goToPage=function(c,e,f){if(1<m)m=1,requestAnimationFrame(function(){ma(0,0,m,!0);a.goToPage(c,e,f)},g("main"));else{1>c&&(c=1);c>p&&(c=p);z&&1!==c&&1===c%2&&--c;c!==d&&(L=!0);pa(c);b[c]||ra(c);ga=z?-(window.innerWidth*Math.floor(c/2)):-(window.innerWidth*(c-1));e&&C.applyTransitionDuration(n,"200ms");C.applyTransform(n,"translate3d("+ga+"px, 0, 0)");z&&1!==c&&1===c%2&&--c;z&&1!==c&&c<p?
U.scrollToPage(c,c+1):U.scrollToPage(c);H.setPage(c);if(f&&history.pushState)try{history.pushState({page:d,slide:e},null,"?page="+d)}catch(h){}A.selectedIndex=z?Math.floor(d/2):d-1;var k=function(){var a;L=!1;a=c;z&&1===a&&(a=0);var e=a-1,f=a+1;z&&(--e,f+=1,2===a&&(e=1));1<=e&&!b[e]&&ra(e);f<=p&&!b[f]&&ra(f);C.applyTransitionDuration(n,"");n.removeEventListener("transitionend",k,!1);n.removeEventListener("webkitTransitionEnd",k,!1);if(z)for(e=2;e<=p;e+=2)b[e]&&(e<d-2||e>d+2)&&(b[e]=!1,a=g("page"+
e),a.parentNode.removeChild(a),e<p&&(b[e+1]=!1));else for(e=1;e<=p;e++)b[e]&&(e<d-1||e>d+1)&&(b[e]=!1,a=g("page"+e),a.parentNode.removeChild(a))};e?(n.addEventListener("transitionend",k,!1),n.addEventListener("webkitTransitionEnd",k,!1)):k()}};return a}();u.setBookmarks=U.setBookmarks;u.setDefaultViewMode=function(a){if(a===k.MultiFile||a===k.SplitSpreads||a===k.SingleFile)P=a};var Da=function(a){for(var b=document.URL,c=b.toString().indexOf("?"),b=-1!=c?b.substr(c+1).split("&"):"",c=0;c<b.length;c++)if(b[c]=
b[c].split("="),b[c][0]==a)return b[c][1];return""};u.toggleOutlines=U.toggleOutlines;var Z=function(a){try{a.getSelection?a.getSelection().empty?a.getSelection().empty():a.getSelection().removeAllRanges&&a.getSelection().removeAllRanges():a.document.selection&&a.document.selection.empty()}catch(b){}},Y=function(){var a={},b,c,d=!1,f=!!window.opera||0<=navigator.userAgent.indexOf(" OPR/"),f=!!window.chrome&&!f;"undefined"!==typeof InstallTrigger?(T="-moz-grab",fa="-moz-grabbing"):f?(T="-webkit-grab",
fa="-webkit-grabbing"):fa=T="all-scroll";a.currentSelectMode=S;a.enableTextSelection=function(){this.currentSelectMode=S;L.className="inactive navBtn";R.className="navBtn";q.style.cursor="";var a=function(a){};q.onmousedown=a;document.onmouseup=a;q.onmousemove=a;r===k.MultiFile?O.enableTextSelection():r===k.SplitSpreads?X.enableTextSelection():r===k.SingleFile&&N.enableTextSelection()};a.enablePanning=function(){this.currentSelectMode=ea;L.className="navBtn";R.className="inactive navBtn";Z(window);
q.style.cursor=T;q.onmousedown=function(a){a=a||window.event;q.style.cursor=fa;b=a.clientX;c=a.clientY;d=!0;return!1};document.onmouseup=function(a){q.style.cursor=T;d=!1};q.onmousemove=function(a){if(d)return a=a||window.event,q.scrollLeft=q.scrollLeft+b-a.clientX,q.scrollTop=q.scrollTop+c-a.clientY,b=a.clientX,c=a.clientY,!1};r===k.MultiFile?O.enablePanning():r===k.SplitSpreads?X.enablePanning():r===k.SingleFile&&N.enablePanning()};return a}();u.setSelectMode=function(a){ba||(a==S?Y.enableTextSelection():
Y.enablePanning())};var Ga=function(){var a=0;self.innerHeight?a=self.innerWidth:document.documentElement&&document.documentElement.clientHeight?a=document.documentElement.clientWidth:document.body&&(a=document.body.clientWidth);return a},ja=function(){var a=q.scrollTop,b=n.offsetHeight;B===M&&(D.selectedIndex=M);4<m?m=4:.25>m&&(m=.25);"undefined"!==typeof isIE&&isIE&&(f.style.zoom=m);C.applyTransform(f,"translateX(0px) translateY(0px) scale("+m+")");n.style.width=w*m+"px";n.style.height=x*m+"px";
var c=Math.floor(100*m);ba||(D.options[0].innerHTML=c+"%");r==k.SingleFile&&(f.style.width=Math.floor(100/c*100)+"%");q.scrollTop=n.offsetHeight/b*a;sa++;1===sa%2&&E()};u.zoomIn=function(){B=M;m*=1.2;ja()};var Ea=function(){var a=G.selectedIndex;a!=r&&(H.setViewMode(a),IDRViewer.setSelectMode(S),r===k.SingleFile&&(q.onscroll=function(a){},D.style.display=""),r=k.IDR,n.innerHTML="",n.setAttribute("style",""),f=document.createElement("div"),f.id="jpedal",n.appendChild(f),B=da,D.selectedIndex=B,a===
k.MultiFile?O.setup(d):a===k.SplitSpreads?X.setup(d):a===k.SingleFile&&(D.style.display="none",N.setup(d),E()))};u.zoomUpdate=function(){B=D.selectedIndex;B!=M&&E()};var E=function(){var a,b,c,e,f,g=function(){a=q.clientWidth;r===k.SingleFile&&(w=aa[d].width);m=(a-6)/w},n=function(){a=q.clientWidth;b=q.clientHeight;r==k.SingleFile&&(w=aa[d].width,f=aa[d].height);e=r!=k.SplitSpreads||1!==d&&d!==p?(a-6)/w:(a-6)/(2*w);c=(b-6)/x;r==k.SingleFile&&(c=(b-6)/f);m=e>c?c:e};switch(B){case da:var l=w;r!==k.SplitSpreads||
1!==d&&d!==p||(l=2*w);l>x&&x>q.clientHeight?n():l>Ga()&&ha?g():m=1;break;case wa:g();break;case xa:b=q.clientHeight;c=(b-6)/x;r==k.SingleFile&&(f=aa[d].height,c=(b-6)/f);m=c;break;case ya:n();break;case va:m=1}ja()};u.zoomOut=function(){B=M;m/=1.2;ja()};u.goToPage=function(a){0===a&&(a=parseInt(A.options[A.selectedIndex].value));r===k.IDR?W.goToPage(a,!1,!0):r===k.SplitSpreads?X.goToPage(a,!0):r===k.MultiFile?O.goToPage(a,!0):r===k.SingleFile&&N.goToPage(a,!0)};u.next=function(){r===k.IDR?W.next():
r===k.SplitSpreads?d+1<=p&&this.goToPage(d+2):d<p&&this.goToPage(d+1)};u.prev=function(){r===k.IDR?W.prev():1<d&&this.goToPage(d-1)};var V=function(a,b,c){if(b.addEventListener)b.addEventListener(a,c,!1);else if(b.attachEvent)return b.attachEvent("on"+a,c)},g=function(a){return document.getElementById(a)};u.toggleThumbnails=U.toggleThumbnails;var ia=function(){Q.className=document.fullscreenElement||document.msFullscreenElement||document.mozFullScreenElement||document.webkitFullscreenElement?"navBtn open":
"navBtn closed"};u.toggleFullScreen=function(){document.fullscreenElement||document.msFullscreenElement||document.mozFullScreenElement||document.webkitFullscreenElement?document.exitFullscreen?document.exitFullscreen():document.msExitFullscreen?document.msExitFullscreen():document.mozCancelFullScreen?document.mozCancelFullScreen():document.webkitCancelFullScreen&&document.webkitCancelFullScreen():document.body.requestFullscreen?document.body.requestFullscreen():document.body.msRequestFullscreen?document.body.msRequestFullscreen():
document.body.mozRequestFullScreen?document.body.mozRequestFullScreen():document.body.webkitRequestFullscreen&&document.body.webkitRequestFullscreen()};u.addToolBarHyperlink=function(a,b){var c=new Image;c.src=a;var d=document.createElement("a");d.href=b;d.className="customNavLink";d.appendChild(c);d.setAttribute("target","_blank");g("mainNav").insertBefore(d,ua)};u.disableViewModeSwitching=function(){ta=!0};u.on=function(a,b){"pagechange"===a?za=b:"viewmodechange"===a?Aa=b:"pageload"===a&&(Ba=b)};
H.setPage=function(a){if(a!=d){var b=za;b&&b({page:a});d=a}};H.setViewMode=function(a,b){var c=Aa;if(c){var d={viewmode:a};""!=b&&(d.orientation=b);c(d)}};H.pageLoad=function(a){var b=Ba;b&&b({page:a})};return u}();