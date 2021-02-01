function write_history(e){return!is_user_debug_enabled()||("undefined"!=typeof LPhistory&&null!==LPhistory||(LPhistory=new LPhistory_lib),LPhistory.write(e))}function show_history(){return dump_history()}function clear_history(){return reset_history()}function reset_history(){return LPhistory=LPhistory||new LPhistory_lib,LPhistory.reset()}function dump_history(){return LPhistory=LPhistory||new LPhistory_lib,LPhistory.dump(null,g_isadmin?LPhistory.LOG_ADMIN:LPhistory.LOG_USER)}function gethistorybuf(){return LPhistory=LPhistory||new LPhistory_lib,is_user_debug_enabled()?LPhistory.getbuf():""}function LPhistory_lib(){var s=8192,H=[],Z=this;function r(e){if(!e)return Z.LOG_DEBUG;var s=Z.LOG_USER;switch(e.cmd){case"LoadData":s=Z.LOG_DEBUG;break;case"":case null:console_log("bad history object"),s=Z.LOG_DEBUG}return s}function a(e){return!is_user_debug_enabled()||(H=H||[],!!e&&(void 0===e.timestamp&&(e.timestamp=(new Date).getTime()),H.length>s&&H.shift(),H.push(e),!0))}function J(e){if(!e)return null;var s=e.prop,i=e.dflt;void 0===i&&(i=null);var t=s;return null==s&&(t=i),t}this.LOG_ADMIN=2,this.LOG_DEBUG=1,this.LOG_USER=0,this.write=function(e){if(!is_user_debug_enabled())return!0;if(!e)return!1;var s;void 0===e.timestamp&&(e.timestamp=(new Date).getTime()),void 0===e.loglevel&&(e.loglevel=r(e));var i=e.tabid,t=e.docnum;if(void 0===e.docnum&&null!==g_CS_tops&&i&&(t=g_CS_tops[i]),null!=t&&i){var o="";if("all"==t)o=ftd_get_topurl(i);else if((s=getcsinfo(i,t))&&s.url)o=s.url;else if(g_CS[i]&&g_CS[i][t]){var n=g_CS[i][t];o=(o=gettaburl(n))||n.name}else o="";e.url=o}return a(e)},this.getbuf=function(){return Z.dump(!0,g_isadmin?LPhistory.LOG_ADMIN:LPhistory.LOG_USER)},this.dump=function(e,s){var i="",t;if(!is_user_debug_enabled())return!e||i;if(void 0===s&&(s=Z.LOG_USER),!H)return console.error("empty history !"),!!e&&i;for(t=0;t<H.length;t++){var o=H[t];if(o){var n=o.loglevel;if(void 0===o.loglevel&&(n=Z.LOG_USER),s<n)continue;var r="",a=o.timestamp;r=void 0===a||null===r?"none?":void 0!==new Date(a).toUTCString?new Date(a).toUTCString():parseInt(a/1e3).toString();var l=J({prop:o.aid,dflt:""}),d=J({prop:o.tabid,dflt:""}),f=J({prop:o.cmd,dflt:"none?"}),c=J({prop:o.url,dflt:""}),p=J({prop:o.msg,dflt:""}),u=J({prop:o.docnum,dflt:""}),m=J({prop:o.docstate,dflt:""}),g="";p.match(/^\w{2}\d+$/)&&Y[p]&&(g=sprintf(Y[p],o.param1,o.param2,o.param3,o.param4,o.param5,o.param6,o.param7,o.param8,o.param9))&&(p=g);var b=J({prop:o.submit,dflt:"none"}),h=J({prop:o.doconfirm,dflt:"none"}),_=J({prop:o.allowforce,dflt:"none"}),D=J({prop:o.name,dflt:""}),E=J({prop:o.custom_js,dflt:""}),y=J({prop:o.is_launch,dflt:""}),v=J({prop:o.manualfill,dflt:""}),A=J({prop:o.originator,dflt:""}),k=J({prop:o.delay,dflt:0}),C=J({prop:o.submit_js,dflt:""}),L=J({prop:o.submit_id,dflt:""}),S=J({prop:o.username,dflt:""}),I=J({prop:o.result,dflt:""}),w=J({prop:o.force_fillbest,dflt:"none"}),N=J({prop:o.ready_state,dflt:-1}),P=J({prop:o.status,dflt:-1}),F=J({prop:o.sz,dflt:-1}),O=J({prop:o.status_s,dflt:-1}),T=J({prop:o.lver,dflt:-1}),U=J({prop:o.sver,dflt:-1}),V=J({prop:o.spin,dflt:""}),M=J({prop:o.flavor,dflt:""}),G=J({prop:o.color,dflt:""}),R=J({prop:o.num,dflt:-1}),q=J({prop:o.file,dflt:""}),X=J({prop:o.line,dflt:0}),x=J({prop:o.stack,dflt:""}),W=J({prop:o.name,dflt:""}),j=J({prop:o.message,dflt:""}),z="";switch(f){case"fill_A1":case"fill_A2":case"fill_A3":case"fill_A4":case"FILL_F2":case"FILL_F3":case"FILL_F4":case"FILL_F5":case"FILL_F6":case"fill_PW":case"FILLBASIC":case"autofillaid":case"autologinaid":z=sprintf("[submit=%s][doconfirm=%s][allowforce=%s]",b,h,_);break;case"fillfieldCS":z=sprintf("[name=%s][manualfill=%s][is_launch=%s][originator=%s][delay=%dms][custom_js=%s]",D,v,y,A,k,E);break;case"fillbestCS":z=sprintf("[username=%s][force_fillbest=%s][custom_js=%s]",S,w,E);break;case"submitCS":z=sprintf("[submit_id=%s][delay=%dms][submit_js=%s]",L,k,C);break;case"check_autologin1":case"check_autologin2":case"check_autologin3":z=sprintf("[dosubmit=%s]",b);break;case"fillfieldconfirm":z=sprintf("[result=%s][manualfill=%s][allowforce=%s][fieldname=%s][force_fillbest=%s]",I,v,_,D,w);break;case"get_accts_success":case"get_accts_fail":z=sprintf("[size=%d][ready_state=%d][status=%d][lver=%d][sver=%d]",F,N,P,T,U);break;case"get_accts_local":z=sprintf("[size=%d][status=%s][lver=%d][sver=%d]",F,O,T,U);break;case"showchangenotification":z=sprintf("[spin=%s]",V);break;case"showaddnotification":z=sprintf("[spin=%s][username=%s]",V,S);break;case"LoadData":z=sprintf("[file=%s][num=%d]",q,R);break;case"errtrap":case"errtrapCS":z=sprintf("[errtype=%s][errmsg=%s][line=%d][stack=%s]",W,j,X,x);break;case"info":case"decision":default:z=""}var B=sprintf("[%s][%s]%s%s%s%s%s%s%s",f,r,d?sprintf("[tabid=%s]",d):"",u||0===u?sprintf("[docnum=%s]",u):"",c?sprintf("[url=%s]",c):"",l||0===l?sprintf("[aid=%s]",l):"",p?sprintf("[msg=%s]",LPPerl.chomp(p)):"",m?sprintf("[docstate=%s]",m):"",z);e?i=i+B+"\n":console.log(B)}}return!e||i},this.reset=function(){return H=[],!0};var Y={DE1:"created %s icons on ASP page",DE2:"created %s icons on generic page",DE3:"created %s icons the old way",DE4:"created %s icons by filling",DE5:"executing NEXT double-password hack to get website to activate %s",DE6:"retrying setval_bestmatch INPUT field detection; not ignoring hidden fields",DE7:"no form, no id/name, no joy",DE8:"executing PREV double-password hack to get website to activate %s",DE9:"executing double-secret password hack to get website to activate %s",DE10:"switching field from text to password from LP_setval",DE11:"switching field from text to password from chk_form_has_password",DE12:"ASP/bgicon login",DE13:"EVALUATING HIDDEN FORM, NOT IGNORING HIDDEN FIELD ANYMORE %s",DE14:"looking for orphaned INPUT elements",DE15:"entered setupIcons()",DE16:"trying generic strategy %s",DE17:"creating icon on input %s",DE18:"create failed on %s",DE19:"detected ASP.NET form, two if by sea",DE20:"detected ASP.NET form, one if by land",DE21:"trying alternate strategy for ASP page %s",DE22:"combineddummy ignore on %s/%s",DE23:"Skipping field that smells like a search field",DE24:"Skipping disabled field",DE25:"Skipping non-displayed field",DE26:"too many orphan password fields found",DE27:"orphan and isolated login field found",DE28:"fieldname %s is blacklisted, skipping",DE29:"form %s has no password field?  Ignored",DE30:"form is not visible: cannot be signup form",DE31:"form %s smells like a sign up form: name/classname",DE32:"form is not signup: prelim test failed",DE33:"form %s has a signup button, loosening detection requirements",DE34:"found visible non-pw field for signup form, eltid=%s",DE35:"chk_form_ask_generate OTP field ignore on %s",DE36:"skipping invisible non-pw field for signup form, eltid=%s",DE37:"form %s is not a signup form, too many pw fields [PW:%s/NON:%s]",DE38:"form %s is not a signup form, too many non-pw fields [PW:%s/NON:%s]",DE39:"form %s is a signup form, has enough pw fields [PW:%s/NON:%s]",DE40:"form %s is a signup form, has enough pw and non-pw fields [PW:%s/NON:%s]",DE41:"form %s does not smell like signup form, not enough fields [PW:%s/NON:%s]",DE42:"[%s] form=%s field=%s appears to be current PW field in a change password form, offergenerate=false",DE43:"[%s] form=%s field=%s appears to be current PW field in a change password form, offergenerate=false",DE44:"[%s] form=%s field=%s setting up generate click listener on icon",DE45:"[%s] orphan field=%s setting up generate click listener on icon",DE46:"form %s appears to be a search form based on name/action, do not try to fill",DE47:"form %s is not visible: cannot be non-login form",DE48:"form %s appears to be a search form based on name/classname, do not try to fill",DE49:"form %s appears to be a non-login form",CA1:"Change in Progress, skipping %s",CA2:"Executing PW Change - perhaps skip some processing in this context?",CA3:"unexpected click flavor",CA4:"[docnum:%s][state:%s] clicking element ty=%s val=%s",CA5:"[docnum:%s][state:%s] unable to find element in this frame to click : ty=%s val=%s",CA6:"comparing %s with %s",CA7:"failed javascript consistency check",CA8:"[%s] executing JS: %s",CA9:"running validate_page_fields in frame %s for %s",CA10:"[%s] returning true, matched success url %s",CA11:"[%s] returning false, matched failure url %s",CA12:"[%s] DID NOT FIND REQUIRED FIELD ty=%s val=%s",CA13:"[%s] FOUND REJECT FIELD %s",CA14:"[%s] FOUND INTERACTIVE FIELD %s",CA15:"[%s] retry %s in %s ms doc state is %s",CA16:"terminate loop [%s] VT:%s T:%s ctr%s elapsed time is %s sec",CA17:"WTF?? [%s] VT:%s T:%s ctr%s elapsed time is %s sec",CA18:"[%s] warning: interrogate rcvd no inputs or urls to check against",CA19:"[%s] ctr=%s elapsed=%s sec, validate_page_fields %s retry in %s second",CA20:"[%s] cpwbot_validate_state_result retval===null FIXME",CA21:"show overlay msg=%s",CA22:"failure, !msg",CA23:"filling element ty=%s val=%s should_click=%d should_fill_via_keys=%d",CA24:"unable to find element ty=%s val=%s",CA25:"Change in Progress, skipping setupIcons",CA26:"skipping setupIcons() due to url test",CA27:"setupIcons() proceeding on %s",CA28:"setupIcons() probably caught cross-domain error, abort : %s",CV1:"specialsite TRUE",CV2:"fillfield : Setting g_passedequivdomains %s=%s",CV3:"fillfield : Setting g_passedequivdomains to NULL",CV4:"LP_compare_tlds : comparing tlds: tld1=%s tld2=%s",CV5:"LP_compare_tlds : tlds are equal",CV6:"LP_compare_tlds : tlds are equal because of equivdomains",CV7:"LP_compare_tlds : tlds are different",CV8:"XDOMAIN:uniqid=%s index=%s time=%s from=%s : valset:DIFFERENT TLD : tld=%s actiontld=%s v.length=%s type=%s",CV9:"XDOMAIN:uniqid=%s : creating cuz tld didn't exist",CV10:"XDOMAIN:uniqid=%s : tld already created but actiontld not created yet, so sleeping and retrying later",CV11:"XDOMAIN:uniqid=%s : showing security prompt cuz we never did it before for actiontld",CV12:"XDOMAIN:uniqid=%s : valset:Allowing autofilling because user accepted security prompt to allow fill. Removing neverurl for url=%s",CV13:"XDOMAIN:uniqid=%s : valset:Skipping autofilling because user refused security prompt to allow fill. Adding neverurl for url=%s",CV14:"XDOMAIN:uniqid=%s : valset:Using cached value on whether to allow autofill for %s val: %s",CV15:"XDOMAIN:uniqid=%s : valset:Skipping field autofilling because user refused to allow fill on: %s val: %s",CV16:"XDOMAIN:uniqid=%s valset:Allowing field autofilling because user accepted to allow fill on: %s val: %s",CV17:"XDOMAIN:uniqid=%s : valset:Skipping field autofilling because field is not visible on: %s val: %s",CV18:"XDOMAIN:valset:NOT DOING ANYTHING CUZ reqinfo IS NULL tld=%s actiontld=%s",CV19:"XDOMAIN:valset:SAME TLD : tld=%s actiontld=%s",CV20:"XDOMAIN:valset:NOT COMPARING TLD : tld=%s",CV21:"hotkey or contextmenu triggered autofill detect & force",SS1:"picked submit %s by ID %s",SS2:"picked submit %s by NAME %s",SS3:"warning: multiple elements with NAME %s",SS4:"picked submit INPUT by VALUE %s",SS5:"picked submit Anchor by HREF %s",SS6:"picked submit %s by XPATH %s",SS7:"picked submit %s by CSS Selector %s",SS8:"issuing click to %s",SS9:"picked an INPUT type=submit after password field and issued click to it",SS10:"picked an INPUT type=image after password field and issued click to it",SS11:"picked an INPUT type=button after password field and issued click to it",SS12:"fallback submit",SS13:"issued submit event to form %s",SS14:"NO ACTIVE FORM, defer submit",SS15:"picked a DIV or A styled to look like a button and issued a click to it",FF1:"deleting iframe named %s",FF2:"SPECIAL SITE: create icon on field %s",FF3:"SPECIAL SITE: create icon on field %s",FF4:"SPECIAL SITE: ignoring field %s",FF5:"skipping loginform icon create on %s because field is too thin",FF6:"skipping nonloginform icon create on %s because field is too thin",FF7:"skipping default-icon create on %s because field is too thin",FF8:"skipping nonloginform icon create on %s because it looks like a search field",FF9:"skipping nonloginform icon create on %s because it is read-only",FF10:"CONFLICT: form %s is a signup form and login form; treat as a signup form and present formfill options",FF11:"icon create on displayed field %s for form %s",FF12:"CLICK ON INPUT, process it",FF13:"skip icon create on hidden field %s for form %s",AO1:"",AO2:"",AO3:"",AO4:"",AO5:"",ZZZ:"final placeholder"}}LPhistory=new LPhistory_lib;