!function(window){"use strict";function keyDown(e,t){var a=e||window.event,r=t||getTargetKey(a.target),c=r.textContent.replace(/\s*/g,""),n=keyBoard[c];return n&&(keyUp(),pressedKey=n,n.className=n.className+" calc-press"),!1}function getTargetKey(e){for(;e!==calcSS3&&e.parentNode&&e.parentNode.style&&!/calc-(?:left|right)/.test(e.parentNode.className);)e=e.parentNode;return e}function keyUp(){pressedKey&&pressedKey!==secondActive&&(pressedKey.className=pressedKey.className.replace(" calc-press",""),pressedKey=null)}function freezeKey(e,t){var a=t&&2===t?e:frozenKey;return a&&(a.className=a.className.replace(" calc-active","")),t||(e.className=e.className+" calc-active",frozenKey=e),a}function saveState(){for(var n=sav.length;n--;)localStorage[sav[n]]=eval(sav[n])}function toggleOptions(e){helpButton.active=!!e}function toggleCalc(e){var t=calcSS3.className;e&&(bigger=!bigger),localStorage.bigger=bigger,calcSS3.className=bigger?t.replace(" calc-small",""):t+" calc-small",smallerButton.firstChild.data=bigger?">":"<",render(resBuffer)}function switchGrouping(e){e&&(ln=++ln>3?0:ln),lnButton.firstChild.data=ln?1===ln?",":2===ln?",.":".,":".",render(resBuffer),localStorage.ln=ln}function render(e,t){var a,r=/(\d+)(\d{3})/,c=e.match(/\./),n=Math.abs(+e),s=45,o=display.style,l=display.parentNode.style;if(e.match(/NaN|Inf|Error/))a="Error";else{for(resBuffer=e,n>=1e16&&(e=(+e).toExponential(13)+""),bigger||t&&"+/–"!==t||0===n||(e=(+e).toPrecision(9)),a=(e+"").split("."),a[1]&&(a[2]=a[1].split("e"),a[2][1]&&(a[1]=a[2][0]),t&&"+/–"!==t||(a[1]=(+("1."+a[1])).toPrecision(bigger?16:a[2][1]?7:9)+"",a[1]>=2&&(a[0]=+a[0]+1+""),a[1]=a[1].substr(2).replace(/0+$/,"")));r.test(a[0]);)a[0]=a[0].replace(r,"$1 $2");a=a[0]+(a[1]||c?"."+a[1]:"").replace(".undefined","").replace(t?"":/\.$/,"")+(a[2]&&a[2][1]?"e"+a[2][1]:"")}for(ln&&(a=a.replace(/\./g,"#").replace(/\s/g,1===ln?" ":2===ln?",":".").replace(/#/g,2===ln?".":",")),display.firstChild.data=a,o.fontSize="45px",l.lineHeight="61px";display.offsetWidth>display.parentNode.offsetWidth-(bigger?40:30);)o.fontSize=s--+"px",l.lineHeight=s+18+"px"}function doKey(e,t){var a=keyBoard[e];if("2nd"===e){secondActive=secondActive?null:!0,a.className=secondActive?"calc-press calc-second":"";for(var r=secondKeySet.length;r--;)secondKeySet[r].children[0].innerHTML=secondLayer[secondActive?1:0][r]}else e.match(/^[+|–|÷|×|yx|x√y|E]+$/)&&"√"!==e?freezeKey(a):e.match(/^[\d|\.|π]$/)?(freezeKey(a,!0),keyBoard.AC.children[0].firstChild.data="C"):"C"===e?(a.children[0].firstChild.data="AC",frozenKey&&freezeKey(frozenKey)):e.match(/AC|=/)?(bracketKey&&freezeKey(bracketKey,2),freezeKey(a,!0),frozenKey=null):e.match(/Deg|Rad/)?(radDeg.firstChild.data=deg?"Rad":"Deg",a.children[0].firstChild.data=deg?"Deg":"Rad",deg=!deg):"("===e?(bracketKey=a,freezeKey(bracketKey,2).className+=" calc-active"):")"===e&&1===brackets&&bracketKey?freezeKey(bracketKey,2):e.match(/^mr$/)&&memory&&(keyBoard.AC.children[0].firstChild.data="C");evalKey(e),t||keyUp(),e.match(/^m[c|+|-]/)&&(freezeKey(keyBoard.mr,2).className+=memory?" calc-active":"")}function evalKey(e){var t,a=resBuffer.replace(/\s/g,"").replace(/Error|∞|-∞/,"0")+"",r=Math.PI;if(e.match(/2nd|Deg|Rad|m/)||(buffStr.push(e),("="===buffStr[buffStr.length-2]&&"="!==e&&calculator[brackets].curr||"AC"===e)&&(buffStr=[e])),t=buffStr[buffStr.length-2],e.match(/^[\d|\.]$/)||"+/–"===e){if((calculator[brackets].curr&&"+/–"!==e||"+/–"===e&&t&&t.match(/^[+|–|÷|×|yx|x√y|E|^C]+$/))&&(a="0",calculator[brackets].curr=!1),(Math.abs(+(a+e))>(bigger?1e15:1e9)||a.replace(/^-/,"").length>15||a.replace("-","").replace(/\./g,"").length>(bigger?14:8)||a.match(/\.|\e\+/)&&"."===e)&&"+/–"!==e)return void buffStr.pop();"+/–"===e?render(a.replace(/e[\+|\-]/,"").match("-")?a.replace(/^-/,""):"-"+a,"+/–"):render((a+e).replace(/^(-)*?0(\d)$/,"$1$2"),!0)}else if(e.match(/^C|AC/))render(calculator[brackets].init(e)),hold.textContent="";else if(e.match(/^[+|–|÷|×|-|\/|*|yx|x√y|%|E]+$/)&&"√"!==e)render(calculator[brackets].calc(e,a));else switch(brackets>-1&&(calculator[brackets].curr="funk"),e){case"=":for(;brackets>-1;)render(a=calculator[brackets--].calc("=",a));brackets=0,calculator[brackets].curr=!0;break;case"(":calculator[++brackets]=new Calculator,calculator[brackets].curr=!0;break;case")":brackets&&render(calculator[brackets--].calc("=",a)),brackets>-1&&(calculator[brackets].curr=!1);break;case"mc":memory=0;break;case"m+":memory+=+a;break;case"m-":memory-=+a;break;case"mr":render(memory+"");break;case"1/x":render(1/a+"");break;case"x2":render(Math.pow(a,2)+"");break;case"x3":render(Math.pow(a,3)+"");break;case"x!":render(function c(e){return 0>e||e>170?NaN:1>=e?1:e*c(e-1)}(Math.round(+a))+"");break;case"√":render(Math.sqrt(a)+"");break;case"log":render(Math.log(a)/Math.log(10)+"");break;case"sin":render(deg||Math.abs(a)!==r?Math.sin(a*(deg?r/180:1))+"":"0");break;case"sin-1":render(Math.asin(a)*(deg?180/r:1)+"");break;case"cos":render(Math.cos(a*(deg?r/180:1))+"");break;case"cos-1":render(Math.acos(a)*(deg?180/r:1)+"");break;case"tan":render(deg||Math.abs(a)!==r?Math.tan(a*(deg?r/180:1))+"":"0");break;case"tan-1":render(Math.atan(a)*(deg?180/r:1)+"");break;case"ln":render(Math.log(a)+"");break;case"log2":render(Math.log(a)/Math.log(2)+"");break;case"sinh":render((Math.pow(Math.E,a)-Math.pow(Math.E,-a))/2+"");break;case"sinh-1":render(Math.log(+a+Math.sqrt(1+Math.pow(a,2)))+"");break;case"cosh":render((Math.pow(Math.E,a)+Math.pow(Math.E,-a))/2+"");break;case"cosh-1":render(2*Math.log(Math.sqrt((+a+1)/2)+Math.sqrt((+a-1)/2))+"");break;case"tanh":!function(e,t){render((e-t)/(e+t)+"")}(Math.pow(Math.E,a),Math.pow(Math.E,-a));break;case"tanh-1":render((Math.log(+a+1)-Math.log(1-a))/2+"");break;case"ex":render(Math.exp(a)+"");break;case"2x":render(Math.pow(2,a)+"");break;case"π":render(r+"");break;case"Rand":render(Math.random()+"")}}var calcSS3=document.querySelector(".calc-main"),display=calcSS3.querySelector(".calc-display span"),radDeg=calcSS3.querySelector(".calc-rad"),smallerButton=calcSS3.querySelector(".calc-smaller"),hold=calcSS3.querySelector(".calc-hold"),lnButton=calcSS3.querySelector(".calc-ln"),helpButton=calcSS3.querySelector(".calc-info"),secondKeySet=[].slice.call(calcSS3.querySelector(".calc-left").children,12,20),hiddenCopy=calcSS3.querySelector("textarea"),pressedKey,frozenKey,secondActive=!1,bracketKey,brackets=0,calculator=[],deg=!1,memory=0,resBuffer="0",bigger=!1,ln=0,buffStr=[],sav=["secondActive","deg","memory","buffStr","resBuffer"],keyBoard={},secondLayer=[["sin","cos","tan","ln","sinh","cosh","tanh","e<sup>x</sup>"],["sin<sup>-1</sup>","cos<sup>-1</sup>","tan<sup>-1</sup>","log<sub>2</sub>","sinh<sup>-1</sup>","cosh<sup>-1</sup>","tanh<sup>-1</sup>","2<sup>x</sup>"]],Calculator=function(){this.stack=[],this.num=0,this.res=0,this.buff=[!1,!1],this.curr=!0,this.rank={"=":0,"+":1,"-":1,"/":2,"*":2,yx:3,"x√y":3,EE:3}};Calculator.prototype.calc=function(key,val){var rank=this.rank;return"%"===key?(this.curr="funk",(this.stack[0]?this.stack[this.num-1][0]/100*val:val/100)+""):(key=key.replace("×","*").replace("÷","/").replace("–","-"),"="!==key?this.buff[1]=key:this.buff[0]===!1&&(this.buff[0]=val),"="===key&&!this.stack[0]&&this.curr&&this.buff[1]?("yx"===this.buff[1]?Math.pow(val,this.buff[0]):"x√y"===this.buff[1]?Math.pow(val,1/this.buff[0]):"EE"===[1]?val*Math.pow(10,this.buff[0]):eval("("+val+")"+this.buff[1]+"("+this.buff[0]+")"))+"":this.stack[0]||"="===key?this.stack[0]&&this.curr&&"funk"!==this.curr&&"="!==key?(this.stack[this.num-1]=[val,key],val+""):this.stack[0]?(rank[key]<=rank[this.stack[this.num-1][1]]&&(this.stack[this.num-1]=["yx"===this.stack[this.num-1][1]?Math.pow(this.stack[this.num-1][0],val):"x√y"===this.stack[this.num-1][1]?Math.pow(this.stack[this.num-1][0],1/val):"EE"===this.stack[this.num-1][1]?this.stack[this.num-1][0]*Math.pow(10,val):eval("("+this.stack[this.num-1][0]+")"+this.stack[this.num-1][1]+"("+val+")"),key]),rank[key]>rank[this.stack[this.num-1][1]]?this.stack[this.num++]=[val,key]:this.stack[this.num-2]&&rank[key]<=rank[this.stack[this.num-2][1]]&&this.calc(key,this.stack[--this.num][0]),this.res=(this.stack[this.num-1]?this.stack[this.num-1][0]:this.res)+"","="===key&&this.init("AX"),this.curr=!0,this.res):val+"":(this.buff[0]=!1,this.stack[this.num++]=[val,key],this.curr=!0,val+""))},Calculator.prototype.init=function(e){return e.match(/A/)&&(this.stack=[],this.num=0),"AC"===e&&(this.buff=[!1,!1]),"0"};for(var k=2;k--;)for(var l=calcSS3.children[k+1],m=l.children,n=m.length;n--;)keyBoard[l.children[n].textContent.replace(/\s*/g,"")]=l.children[n];keyBoard.C=keyBoard.AC,keyBoard.Rad=keyBoard.Deg;for(var m=secondLayer[0],n=m.length;n--;)keyBoard[secondLayer[1][n].replace(/<\/*\w+>/g,"")]=keyBoard[m[n]];keyBoard["2x"]=keyBoard.ex,calculator[0]=new Calculator,function(localStorage){if(localStorage&&localStorage.resBuffer){bigger=localStorage.bigger?eval(localStorage.bigger):!0,toggleCalc(),+localStorage.ln&&(ln=localStorage.ln,switchGrouping());try{(localStorage.secondActive.match(/false|null/)?1:0)||(keyDown(!1,keyBoard["2nd"]),doKey("2nd",!0)),eval(localStorage.deg)&&doKey("Deg",!0),localStorage.memory&&(render(localStorage.memory),doKey("m+",!0)),render(localStorage.resBuffer);for(var buffStrX=localStorage.buffStr.split(","),n=0,m=buffStrX.length;m>n;n++)buffStrX[n]&&doKey(buffStrX[n],!0);render(localStorage.resBuffer),resBuffer=localStorage.resBuffer}catch(e){for(var n=sav.length;n--;)localStorage.removeItem(sav[n])}}}(window.localStorage),document.addEventListener("keypress",function(e){var t=e.which,a=hold.textContent,r=",|.|-|–|/|÷|*|×|#|+/–|x|x!|E|EE|e|ex| |2nd|r|x√y|R|√|p|π|^|yx|'|yx|\"|yx|m|mr|v|mc|b|m+|n|m-|s|sin|c|cos|t|tan|S|sin-1|C|cos-1|T|tan-1|d|Deg|°|Deg|l|ln|L|log|\\|1/x|X|2x".split("|"),c="sin|sinh|cos|cosh|tan|tanh|m-|Rand|Deg|Rand|sin-1|sinh-1|cos-1|cosh-1|tan-1|tanh-1|1|1/x|2|x2|3|x3|x√y|√|ln|log2|ex|2x".split("|");13===t&&(t=61),t=String.fromCharCode(t);for(var n=0,s=r.length;s>n;n+=2)if(t===r[n]){t=t.replace(t,r[n+1]);break}if(a){for(var n=0,s=c.length;s>n;n+=2)if(t==c[n]){t=t.replace(t,c[n+1]);break}hold.textContent=""}return"h"!==t&&"H"!==t||a||(hold.textContent="hold"),"G"===t&&a&&switchGrouping(!0),keyBoard[t]?((t.match(/-1$|log2$|2x$/)&&!secondActive||t.match(/h$|n$|cos$|ex$/)&&secondActive)&&(keyDown(!1,keyBoard["2nd"]),doKey("2nd",!0)),keyDown(!1,keyBoard[t]),void doKey(t,!0)):!1},!1),document.addEventListener("keydown",function(e){var t=resBuffer.replace(/\s/g,""),a=t.split("").length-1;if(toggleOptions(),8===e.which&&calculator[brackets].curr!==!0&&"funk"!==calculator[brackets].curr&&"0"!==t){for(e.preventDefault();buffStr.length&&!keyBoard[buffStr[buffStr.length-1]];)buffStr.pop();"+/–"===buffStr[buffStr.length-1]?(doKey("+/–",!0),buffStr.pop()):resBuffer.match(/\-\d$/)||resBuffer.match(/^\d$/)?(buffStr.pop(),doKey("C",!0),render("0")):render(t.substring(0,a),!0),buffStr.pop(),"."===buffStr[buffStr.length-1]&&(render(t.substring(0,a-1)),buffStr.pop())}220===e.which&&keyDown(!1,keyBoard.xy),46===e.which&&(keyDown(!1,keyBoard.AC),doKey(keyBoard.AC.textContent,!0)),9===e.which&&(toggleCalc(!0),e.preventDefault())},!1),document.addEventListener("keyup",function(){keyUp(),saveState()},!1),document.body.addEventListener("paste",function(e){render(parseFloat(e.clipboardData.getData("Text")+"")+""),calculator[brackets].curr=!0,keyBoard.AC.children[0].firstChild.data="C",frozenKey&&freezeKey(frozenKey,!0),e.preventDefault()},!1),document.body.addEventListener("copy",function(e){hiddenCopy.textContent=resBuffer.replace(/\s/g,""),hiddenCopy.focus(),hiddenCopy.select()},!1),calcSS3.onmousedown=function(e){return keyDown(e),pressedKey?(document.addEventListener("mouseout",keyUp,!1),document.addEventListener("mouseover",keyDown,!1),!1):!1},document.addEventListener("mouseup",function(e){var t=e||window.event,a=getTargetKey(t.target),r=a.textContent.replace(/\s*/g,""),c=keyBoard[r];return t.target===helpButton&&(window.location="http://dematte.at/calculator#usage"),t.target===smallerButton&&toggleCalc(!0),t.target===lnButton&&switchGrouping(!0),t.target!==lnButton&&toggleOptions(),document.removeEventListener("mouseout",keyUp,!1),document.removeEventListener("mouseover",keyDown,!1),pressedKey?void(c&&(doKey(r),saveState())):!1},!1),display.parentElement.addEventListener("dblclick",function(){helpButton.active||toggleCalc(!0)},!1),helpButton.addEventListener("mouseover",function(){toggleOptions(!0)},!1)}(window);