/*!
 * froala_editor v2.0.1 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms
 * Copyright 2014-2015 Froala Labs
 */


!function(a){"function"==typeof define&&define.amd?module.exports=function(b,c){return void 0===c&&(c="undefined"!=typeof window?require("jquery"):require("jquery")(b)),a(c),c}:a(jQuery)}(function(a){"use strict";a.extend(a.FroalaEditor.POPUP_TEMPLATES,{"video.insert":"[_BUTTONS_][_BY_URL_LAYER_][_EMBED_LAYER_]","video.edit":"[_BUTTONS_]","video.size":"[_BUTTONS_][_SIZE_LAYER_]"}),a.extend(a.FroalaEditor.DEFAULTS,{videoInsertButtons:["videoBack","|","videoByURL","videoEmbed"],videoEditButtons:["videoDisplay","videoAlign","videoSize","videoRemove"],videoResize:!0,videoSizeButtons:["videoBack","|"],videoTextNear:!0,videoDefaultAlign:"center",videoDefaultDisplay:"block"}),a.FroalaEditor.VIDEO_PROVIDERS=[{test_regex:/^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/,url_regex:/(?:https?:\/\/)?(?:www\.)?(?:m\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=|embed\/)?([0-9a-zA-Z_\-]+)(.+)?/g,url_text:"//www.youtube.com/embed/$1",html:'<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen></iframe>'},{test_regex:/^.*(vimeo\.com\/)((channels\/[A-z]+\/)|(groups\/[A-z]+\/videos\/))?([0-9]+)/,url_regex:/(?:https?:\/\/)?(?:www\.)?(?:vimeo\.com)\/(?:channels\/[A-z]+\/|groups\/[A-z]+\/videos\/)?(.+)/g,url_text:"//player.vimeo.com/video/$1",html:'<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen></iframe>'},{test_regex:/^.+(dailymotion.com|dai.ly)\/(video|hub)?\/?([^_]+)[^#]*(#video=([^_&]+))?/,url_regex:/(?:https?:\/\/)?(?:www\.)?(?:dailymotion\.com|dai\.ly)\/(?:video|hub)?\/?(.+)/g,url_text:"//www.dailymotion.com/embed/video/$1",html:'<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen></iframe>'},{test_regex:/^.+(screen.yahoo.com)\/[^_&]+/,url_regex:"",url_text:"",html:'<iframe width="640" height="360" src="{url}?format=embed" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" allowtransparency="true"></iframe>'},{test_regex:/^.+(rutube.ru)\/[^_&]+/,url_regex:/(?:https?:\/\/)?(?:www\.)?(?:rutube\.ru)\/(?:video)?\/?(.+)/g,url_text:"//rutube.ru/play/embed/$1",html:'<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" allowtransparency="true"></iframe>'}],a.FroalaEditor.PLUGINS.video=function(b){function c(){var a=b.popups.get("video.insert"),c=a.find(".fr-video-by-url-layer input");c.val("").trigger("change");var d=a.find(".fr-video-embed-layer textarea");d.val("").trigger("change")}function d(){var a=b.$tb.find('.fr-command[data-cmd="insertVideo"]'),c=b.popups.get("video.insert");if(c||(c=f()),!c.hasClass("fr-active")){b.popups.refresh("video.insert"),b.popups.setContainer("video.insert",b.$tb);var d=a.offset().left+a.outerWidth()/2,e=a.offset().top+(b.opts.toolbarBottom?10:a.outerHeight()-10);b.popups.show("video.insert",d,e,a.outerHeight())}}function e(){var c=b.popups.get("video.edit");c||(c=y()),b.popups.setContainer("video.edit",a(b.opts.scrollableContainer)),b.popups.refresh("video.edit");var d=R.find("iframe, embed, video"),e=d.offset().left+d.outerWidth()/2,f=d.offset().top+d.outerHeight();b.popups.show("video.edit",e,f,d.outerHeight())}function f(){var a="";b.opts.videoInsertButtons.length>1&&(a='<div class="fr-buttons">'+b.button.buildList(b.opts.videoInsertButtons)+"</div>");var d="";b.opts.videoInsertButtons.indexOf("videoByURL")>=0&&(d='<div class="fr-video-by-url-layer fr-layer fr-active" id="fr-video-by-url-layer-'+b.id+'"><div class="fr-input-line"><input type="text" placeholder="http://" tabIndex="1"></div><div class="fr-action-buttons"><button type="button" class="fr-command fr-submit" data-cmd="videoInsertByURL" tabIndex="2">'+b.language.translate("Insert")+"</button></div></div>");var e="";b.opts.videoInsertButtons.indexOf("videoEmbed")>=0&&(e='<div class="fr-video-embed-layer fr-layer" id="fr-video-embed-layer-'+b.id+'"><div class="fr-input-line"><textarea type="text" placeholder="'+b.language.translate("Embedded Code")+'" tabIndex="1" rows="5"></textarea></div><div class="fr-action-buttons"><button type="button" class="fr-command fr-submit" data-cmd="videoInsertEmbed" tabIndex="2">'+b.language.translate("Insert")+"</button></div></div>");var f={buttons:a,by_url_layer:d,embed_layer:e},g=b.popups.create("video.insert",f);return b.popups.onRefresh("video.insert",c),b.popups.onHide("video.insert",j),g}function g(a){var c,d,e=b.popups.get("video.insert");if(!R&&!b.opts.toolbarInline){var f=b.$tb.find('.fr-command[data-cmd="insertVideo"]');c=f.offset().left+f.outerWidth()/2,d=f.offset().top+(b.opts.toolbarBottom?10:f.outerHeight()-10)}b.opts.toolbarInline&&(d=e.offset().top-b.helpers.getPX(e.css("margin-top")),e.hasClass("fr-above")&&(d+=e.outerHeight())),e.find(".fr-layer").removeClass("fr-active"),e.find(".fr-"+a+"-layer").addClass("fr-active"),b.popups.show("video.insert",c,d,0)}function h(a){var c=b.popups.get("video.insert");c.find(".fr-video-by-url-layer").hasClass("fr-active")&&a.addClass("fr-active")}function i(a){var c=b.popups.get("video.insert");c.find(".fr-video-embed-layer").hasClass("fr-active")&&a.addClass("fr-active")}function j(){}function k(a){b.events.focus(!0),b.selection.restore(),b.html.insert('<span contenteditable="false" class="fr-jiv fr-video fr-dv'+b.opts.videoDefaultDisplay[0]+("center"!=b.opts.videoDefaultAlign?" fr-fv"+b.opts.videoDefaultAlign[0]:"")+'">'+a+"<span>"),b.popups.hide("video.insert");var c=b.$el.find(".fr-jiv");c.removeClass("fr-jiv"),b.events.trigger("video.inserted",[c])}function l(c){if("undefined"==typeof c){var d=b.popups.get("video.insert");c=d.find('.fr-video-by-url-layer input[type="text"]').val()||""}var e=null;if(b.helpers.isURL(c))for(var f=0;f<a.FroalaEditor.VIDEO_PROVIDERS.length;f++){var g=a.FroalaEditor.VIDEO_PROVIDERS[f];if(g.test_regex.test(c)){e=c.replace(g.url_regex,g.url_text),e=g.html.replace(/\{url\}/,e);break}}e?k(e):b.events.trigger("video.linkError",[c])}function m(a){if("undefined"==typeof a){var c=b.popups.get("video.insert");a=c.find(".fr-video-embed-layer textarea").val()||""}0===a.length?b.events.trigger("video.codeError",[a]):k(a)}function n(c){c.preventDefault(),c.stopPropagation();var d=c.pageX||(c.originalEvent.touches?c.originalEvent.touches[0].pageX:null),e=c.pageY||(c.originalEvent.touches?c.originalEvent.touches[0].pageY:null);return d&&e?(P=a(this),P.data("start-x",d),P.data("start-y",e),O.show(),void b.popups.hideAll()):!1}function o(a){if(P){a.preventDefault();var b=a.pageX||(a.originalEvent.touches?a.originalEvent.touches[0].pageX:null),c=a.pageY||(a.originalEvent.touches?a.originalEvent.touches[0].pageY:null);if(!b||!c)return!1;var d=P.data("start-x"),e=P.data("start-y");P.data("start-x",b),P.data("start-y",c);var f=b-d,g=c-e,h=R.find("iframe, embed, video"),i=h.width(),j=h.height();(P.hasClass("fr-hnw")||P.hasClass("fr-hsw"))&&(f=0-f),(P.hasClass("fr-hnw")||P.hasClass("fr-hne"))&&(g=0-g),h.css("width",i+f),h.css("height",j+g),h.removeAttr("width"),h.removeAttr("height"),s()}}function p(a){P&&(a&&a.preventDefault(),P=null,O.hide(),s(),e())}function q(a){return'<div class="fr-handler fr-h'+a+'"></div>'}function r(){if(Q=a('<div class="fr-video-resizer"></div>'),b.$wp.append(Q),a(b.original_window).on("resize.video"+b.id,u),b.events.on("destroy",function(){Q.html("").removeData().remove(),a(b.original_window).off("resize.video"+b.id)},!0),b.opts.videoResize){Q.append(q("nw")+q("ne")+q("sw")+q("se"));var c=Q.get(0).ownerDocument;Q.on(b._mousedown+".vidresize"+b.id,".fr-handler",n),a(c).on(b._mousemove+".vidresize"+b.id,o),a(c.defaultView||c.parentWindow).on(b._mouseup+".vidresize"+b.id,p),O=a('<div class="fr-video-overlay"></div>'),a(c).find("body").append(O),O.on("mouseleave",p),b.events.on("destroy",function(){Q.off(b._mousedown+".vidresize"+b.id),a(c).off(b._mousemove+".vidresize"+b.id),a(c.defaultView||c.parentWindow).off(b._mouseup+".vidresize"+b.id),O.off("mouseleave").remove()},!0)}}function s(){Q||r();var a=R.find("iframe, embed, video");Q.css("top",(b.opts.iframe?a.offset().top-1:a.offset().top-b.$wp.offset().top-1)+b.$wp.scrollTop()).css("left",(b.opts.iframe?a.offset().left-1:a.offset().left-b.$wp.offset().left-1)+b.$wp.scrollLeft()).css("width",a.outerWidth()).css("height",a.height()).addClass("fr-active")}function t(c){return c&&"touchend"==c.type&&S?!0:(c.preventDefault(),c.stopPropagation(),b.edit.isDisabled()?!1:(c.stopPropagation(),b.toolbar.disable(),b.helpers.isMobile()&&(b.events.disableBlur(),b.$el.blur(),b.events.enableBlur()),R=a(this),a(this).addClass("fr-active"),b.opts.iframe&&b.height.syncIframe(),s(),e(),b.selection.clear(),b.button.bulkRefresh(),void b.events.trigger("image.hideResizer")))}function u(a){a===!0&&(T=!0),R&&T&&(Q.removeClass("fr-active"),b.toolbar.enable(),R.removeClass("fr-active"),R=null),T=!1}function v(){T=!0}function w(){T=!1}function x(){b.events.on("mousedown",v),b.events.on("window.mousedown",v),b.events.on("window.touchmove",w),b.events.on("mouseup",u),b.events.on("window.mouseup",u),b.events.on("commands.mousedown",function(a){a.parents(".fr-toolbar").length>0&&u()}),b.events.on("video.hideResizer",function(){u(!0)}),b.events.on("commands.undo",function(){u(!0)}),b.events.on("commands.redo",function(){u(!0)})}function y(){var a="";b.opts.videoEditButtons.length>1&&(a+='<div class="fr-buttons">',a+=b.button.buildList(b.opts.videoEditButtons),a+="</div>");var c={buttons:a},d=b.popups.create("video.edit",c);return b.$wp.on("scroll.video-edit",function(){R&&b.popups.isVisible("video.edit")&&e()}),b.events.on("destroy",function(){b.$wp.off("scroll.video-edit")}),d}function z(){if(R){var a=b.popups.get("video.size"),c=R.find("iframe, embed, video");a.find('input[name="width"]').val(c.get(0).style.width||c.attr("width")).trigger("change"),a.find('input[name="height"]').val(c.get(0).style.height||c.attr("height")).trigger("change")}}function A(){var c=b.popups.get("video.size");c||(c=B()),b.popups.refresh("video.size"),b.popups.setContainer("video.size",a(b.opts.scrollableContainer));var d=R.find("iframe, embed, video"),e=d.offset().left+d.width()/2,f=d.offset().top+d.height();b.popups.show("video.size",e,f,d.height())}function B(){var a="";a='<div class="fr-buttons">'+b.button.buildList(b.opts.videoSizeButtons)+"</div>";var c="";c='<div class="fr-video-size-layer fr-layer fr-active" id="fr-video-size-layer-'+b.id+'"><div class="fr-video-group"><div class="fr-input-line"><input type="text" name="width" placeholder="'+b.language.translate("Width")+'" tabIndex="1"></div><div class="fr-input-line"><input type="text" name="height" placeholder="'+b.language.translate("Height")+'" tabIndex="1"></div></div><div class="fr-action-buttons"><button type="button" class="fr-command fr-submit" data-cmd="videoSetSize" tabIndex="2">'+b.language.translate("Update")+"</button></div></div>";var d={buttons:a,size_layer:c},e=b.popups.create("video.size",d);return b.popups.onRefresh("video.size",z),b.$wp.on("scroll.video-size",function(){R&&b.popups.isVisible("video.size")&&A()}),b.events.on("destroy",function(){b.$wp.off("scroll.video-size")}),e}function C(a){R.removeClass("fr-fvr fr-fvl"),"left"==a?R.addClass("fr-fvl"):"right"==a&&R.addClass("fr-fvr"),s(),e()}function D(a){R.hasClass("fr-fvl")?a.find("> i").attr("class","fa fa-align-left"):R.hasClass("fr-fvr")?a.find("> i").attr("class","fa fa-align-right"):a.find("> i").attr("class","fa fa-align-justify")}function E(a,b){var c="justify";R.hasClass("fr-fvl")?c="left":R.hasClass("fr-fvr")&&(c="right"),b.find('.fr-command[data-param1="'+c+'"]').addClass("fr-active")}function F(a){R.removeClass("fr-dvi fr-dvb"),"inline"==a?R.addClass("fr-dvi"):"block"==a&&R.addClass("fr-dvb"),s(),e()}function G(a,b){var c="block";R.hasClass("fr-dvi")&&(c="inline"),b.find('.fr-command[data-param1="'+c+'"]').addClass("fr-active")}function H(){if(R&&b.events.trigger("video.beforeRemove",[R])!==!1){var a=R;b.popups.hideAll(),u(!0),b.selection.setBefore(a.get(0))||b.selection.setAfter(a.get(0)),a.remove(),b.selection.restore(),b.html.fillEmptyBlocks(!0),b.events.trigger("video.removed",[a])}}function I(a){if(!a.hasClass("fr-dvi")&&!a.hasClass("fr-dvb")){var c=a.css("float");a.css("float","none"),"block"==a.css("display")?(a.css("float",c),0===parseInt(a.css("margin-left"),10)&&(a.attr("style")||"").indexOf("margin-right: auto")>=0?a.addClass("fr-fvl"):0===parseInt(a.css("margin-right"),10)&&(a.attr("style")||"").indexOf("margin-left: auto")>=0&&a.addClass("fr-fvr"),a.addClass("fr-dvb")):(a.css("float",c),"left"==a.css("float")?a.addClass("fr-fvl"):"right"==a.css("float")&&a.addClass("fr-fvr"),a.addClass("fr-dvi")),a.css("margin",""),a.css("float",""),a.css("display",""),a.css("z-index",""),a.css("position",""),a.css("overflow",""),a.css("vertical-align","")}b.opts.videoTextNear||a.removeClass("fr-dvi").addClass("fr-dvb")}function J(){b.$el.find("video").filter(function(){return 0===a(this).parents("span.fr-video").length}).wrap('<span class="fr-video" contenteditable="false"></span>'),b.$el.find("embed, iframe").filter(function(){if(b.browser.safari&&this.getAttribute("src")&&this.setAttribute("src",this.src),a(this).parents("span.fr-video").length>0)return!1;for(var c=a(this).attr("src"),d=0;d<a.FroalaEditor.VIDEO_PROVIDERS.length;d++){var e=a.FroalaEditor.VIDEO_PROVIDERS[d];if(e.test_regex.test(c))return!0}return!1}).map(function(){return 0===a(this).parents("object").length?this:a(this).parents("object").get(0)}).wrap('<span class="fr-video" contenteditable="false"></span>');for(var c=b.$el.find("span.fr-video"),d=0;d<c.length;d++)I(a(c[d]))}function K(){x(),b.helpers.isMobile()&&(b.$el.on("touchstart","span.fr-video",function(){S=!1}),b.$el.on("touchmove",function(){S=!0})),b.events.on("html.set",J),J(),b.$el.on("mousedown","span.fr-video",function(a){a.stopPropagation()}),b.$el.on("click touchend","span.fr-video",t),b.events.on("keydown",function(c){var d=c.which;return!R||d!=a.FroalaEditor.KEYCODE.BACKSPACE&&d!=a.FroalaEditor.KEYCODE.DELETE?R&&d==a.FroalaEditor.KEYCODE.ESC?(u(!0),c.preventDefault(),!1):R&&!b.keys.ctrlKey(c)?(c.preventDefault(),!1):void 0:(c.preventDefault(),H(),!1)},!0),b.events.on("keydown",function(){b.$el.find("span.fr-video:empty").remove()})}function L(){R?R.trigger("click"):(b.popups.hide("video.insert"),b.toolbar.showInline())}function M(a,c){if(R){var d=b.popups.get("video.size"),e=R.find("iframe, embed, video");e.css("width",a||d.find('input[name="width"]').val()),e.css("height",c||d.find('input[name="height"]').val()),e.get(0).style.width&&e.removeAttr("width"),e.get(0).style.height&&e.removeAttr("height"),d.find("input").blur(),setTimeout(function(){R.trigger("click")},b.helpers.isAndroid()?50:0)}}function N(){return R}var O,P,Q,R,S,T=!1;return{_init:K,showInsertPopup:d,showLayer:g,refreshByURLButton:h,refreshEmbedButton:i,insertByURL:l,insertEmbed:m,insert:k,align:C,refreshAlign:D,refreshAlignOnShow:E,display:F,refreshDisplayOnShow:G,remove:H,showSizePopup:A,back:L,setSize:M,get:N}},a.FroalaEditor.RegisterCommand("insertVideo",{title:"Insert Video",undo:!1,focus:!0,refreshAfterCallback:!1,popup:!0,callback:function(){this.popups.isVisible("video.insert")?(this.$el.find(".fr-marker")&&(this.events.disableBlur(),this.selection.restore()),this.popups.hide("video.insert")):this.video.showInsertPopup()}}),a.FroalaEditor.DefineIcon("insertVideo",{NAME:"video-camera"}),a.FroalaEditor.DefineIcon("videoByURL",{NAME:"link"}),a.FroalaEditor.RegisterCommand("videoByURL",{title:"By URL",undo:!1,focus:!1,callback:function(){this.video.showLayer("video-by-url")},refresh:function(a){this.video.refreshByURLButton(a)}}),a.FroalaEditor.DefineIcon("videoEmbed",{NAME:"code"}),a.FroalaEditor.RegisterCommand("videoEmbed",{title:"Embedded Code",undo:!1,focus:!1,callback:function(){this.video.showLayer("video-embed")},refresh:function(a){this.video.refreshEmbedButton(a)}}),a.FroalaEditor.RegisterCommand("videoInsertByURL",{undo:!0,focus:!0,callback:function(){this.video.insertByURL()}}),a.FroalaEditor.RegisterCommand("videoInsertEmbed",{undo:!0,focus:!0,callback:function(){this.video.insertEmbed()}}),a.FroalaEditor.DefineIcon("videoDisplay",{NAME:"star"}),a.FroalaEditor.RegisterCommand("videoDisplay",{title:"Display",type:"dropdown",options:{inline:"Inline",block:"Break Text"},callback:function(a,b){this.video.display(b)},refresh:function(a){this.opts.videoTextNear||a.addClass("fr-hidden")},refreshOnShow:function(a,b){this.video.refreshDisplayOnShow(a,b)}}),a.FroalaEditor.DefineIcon("videoAlign",{NAME:"align-center"}),a.FroalaEditor.RegisterCommand("videoAlign",{type:"dropdown",title:"Align",options:{left:"Align Left",justify:"None",right:"Align Right"},html:function(){var b='<ul class="fr-dropdown-list">',c=a.FroalaEditor.COMMANDS.videoAlign.options;for(var d in c)b+='<li><a class="fr-command fr-title" data-cmd="videoAlign" data-param1="'+d+'" title="'+this.language.translate(c[d])+'"><i class="fa fa-align-'+d+'"></i></a></li>';return b+="</ul>"},callback:function(a,b){this.video.align(b)},refresh:function(a){this.video.refreshAlign(a)},refreshOnShow:function(a,b){this.video.refreshAlignOnShow(a,b)}}),a.FroalaEditor.DefineIcon("videoRemove",{NAME:"trash"}),a.FroalaEditor.RegisterCommand("videoRemove",{title:"Remove",callback:function(){this.video.remove()}}),a.FroalaEditor.DefineIcon("videoSize",{NAME:"arrows-alt"}),a.FroalaEditor.RegisterCommand("videoSize",{undo:!1,focus:!1,title:"Change Size",callback:function(){this.video.showSizePopup()}}),a.FroalaEditor.DefineIcon("videoBack",{NAME:"arrow-left"}),a.FroalaEditor.RegisterCommand("videoBack",{title:"Back",undo:!1,focus:!1,back:!0,callback:function(){this.video.back()},refresh:function(a){var b=this.video.get();b||this.opts.toolbarInline?(a.removeClass("fr-hidden"),a.next(".fr-separator").removeClass("fr-hidden")):(a.addClass("fr-hidden"),a.next(".fr-separator").addClass("fr-hidden"))}}),a.FroalaEditor.RegisterCommand("videoSetSize",{undo:!0,focus:!1,callback:function(){this.video.setSize()}})});
