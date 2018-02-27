/**
* @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
* For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function(config) {
    // Define changes to default configuration here.
    // For the complete reference:
    // http://docs.ckeditor.com/#!/api/CKEDITOR.config

    config.pasteFromWordRemoveFontStyles = true;
    config.pasteFromWordRemoveStyles = true;
    
    config.disableNativeSpellChecker = false;
    config.scayt_autoStartup = false;

    config.toolbar = 'Custom';
    config.toolbar_Custom =
	[
		['Source', 'Preview'],
        ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord'],
        ['Undo', 'Redo', '-', 'Find', 'Replace', '-', 'SelectAll', 'RemoveFormat'],
        ['Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript'],
		'/',
		['Link', 'Unlink', 'Anchor'],
        ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote', 'CreateDiv', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
        ['Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar'],
		['TextColor', 'BGColor'],
		'/',
		['Styles', 'Format', 'Font', 'FontSize']
	];

    config.toolbar_Basic =
	[
		['Source', 'Preview'],
        ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord'],
		['Undo', 'Redo', '-', 'Find', 'Replace', '-', 'SelectAll', 'RemoveFormat'],
		 '/',
		['TextColor', 'BGColor'],
		['Bold', 'Italic', 'Underline'],
		['JustifyLeft', 'JustifyCenter', 'JustifyRight'],
		['Link', 'Unlink', 'Anchor'],
		['Image', 'Flash', 'Table'],
		['NumberedList', 'BulletedList'],
	];

/*
    config.toolbar =
	[
		['Source', 'Preview'],
        ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord'],
        ['Undo', 'Redo', '-', 'Find', 'Replace', '-', 'SelectAll', 'RemoveFormat'],
        ['Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript'],
		'/',
		['Link', 'Unlink', 'Anchor'],
        ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote', 'CreateDiv', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
        ['Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar'],
		['TextColor', 'BGColor'],
		['Styles', 'Format', 'Font', 'FontSize']
	];
*/
    // Remove some buttons, provided by the standard plugins, which we don't
    // need to have in the Standard(s) toolbar.
    config.removeButtons = 'scayt,Underline,Subscript,Superscript';
};
