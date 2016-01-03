function addingCssRules(){

	var sheet = (function() {
	// Create the <style> tag
	var style = document.createElement("style");

	// WebKit hack :(
	style.appendChild(document.createTextNode(""));

	// Add the <style> element to the page
	document.head.appendChild(style);

	return style.sheet;
})();

	var primaryColor= $('body').data('primary-color');
	var secondaryColor = $('body').data('secondary-color');

	addCSSRule(sheet, "h2 span", "border-bottom: 2px solid " + secondaryColor );
	addCSSRule(sheet, ".main-nav", "border-bottom: 1px solid " + secondaryColor );

	addCSSRule(sheet, "h2", "color:" + primaryColor );
	addCSSRule(sheet, "p", "color:" + primaryColor );
	addCSSRule(sheet, "a", "color:" + primaryColor );
	addCSSRule(sheet, "p a", "border-bottom: 1px solid " + secondaryColor );
	addCSSRule(sheet, "h6", "color:" + primaryColor );
	addCSSRule(sheet, "li", "color:" + primaryColor );
	addCSSRule(sheet, ".localization-menu li a", "color:" + primaryColor );
	addCSSRule(sheet, ".blue", "color:" + primaryColor );
	addCSSRule(sheet, ".new_newsaddresse input[type='text']", "border: 1px solid " + primaryColor );

	addCSSRule(sheet, "h3", "color:" + secondaryColor );
	addCSSRule(sheet, ".blue", "color:" + primaryColor );
	addCSSRule(sheet, ".registration .upload", "background-color: " + primaryColor );
	addCSSRule(sheet, ".box", "border: 1px solid " + primaryColor );

	addCSSRule(sheet, ".upload-desc", "background-color: " + primaryColor );

	if( !isSafari ){ 
		addCSSRule(sheet, ".archive select", "border-color: #BDCCD4;" );
	}

	function addCSSRule(sheet, selector, rules, index) {
		if(sheet.insertRule) {
			sheet.insertRule(selector + "{" + rules + "}", index);
		}
		else {
			sheet.addRule(selector, rules, index);
		}
	}
}
