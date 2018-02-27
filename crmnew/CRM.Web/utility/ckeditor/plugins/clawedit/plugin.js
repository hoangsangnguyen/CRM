/**
* @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
* For licensing, see LICENSE.html or http://ckeditor.com/license
*/

/**
* @fileOverview Claw Edit plugin.
*/

(function() {
    var saveCmd = { modes: { wysiwyg: 1, source: 1 },
        readOnly: 1,
        exec: function (editor) {
            
            var idUpdate = editor.element.$.attributes['data-pagecomponentid'].value;
            var className = editor.element.$.attributes['data-classname'].value;
            $('#cke_' + editor.name).find(".cke_button__clawedit").addClass("fancybox fancybox.iframe").attr("href", "/admin/modules/system/settings/"+ className + "settings" + "/savetextcontent/" + idUpdate );            
            //openPopup(editor);

            ////var lnk = $('.' + editor.name + ' .editlink>a');
            ////if (lnk.length > 0) {
            //    //var strScript = "$('#$id$').get(0).click();";
            //    //strScript = strScript.replace('$id$', lnk.attr('id'));
            //    //setTimeout(strScript, 100);
            //    window.open("http://localhost:64884/admin/modules/system/settings/TextContent/index/85");
            //    return false;
            ////}
        }
    };

    var pluginName = 'clawedit';

    // Register a plugin named "clawedit".
    CKEDITOR.plugins.add(pluginName, {
        lang: 'en,nb,no', // %REMOVE_LINE_CORE%
        icons: 'clawedit', // %REMOVE_LINE_CORE%
        
        init: function(editor) {

            // clawedit plugin is for inline mode only.
            if (editor.elementMode != CKEDITOR.ELEMENT_MODE_INLINE)
                return;           
            var command = editor.addCommand(pluginName, saveCmd);
            command.modes = { wysiwyg: 1 };

            editor.ui.addButton && editor.ui.addButton('clawedit', {
                label: editor.lang.clawedit.toolbar,
                command: pluginName,
                toolbar: 'save,2'
            });
        }
    });
})();

function openPopup(editor) {
        
    var idUpdate = editor.element.$.attributes['data-pagecomponentid'].value;
    var className = editor.element.$.attributes['data-classname'].value;
    var mode = editor.element.$.attributes['data-mode'].value;
    $.ajax({
        url: "/admin/modules/system/settings/" + className + "settings" + "/savetextcontent/" + idUpdate + "?mode=" + mode,
        type: "POST",        
        success: function (result) {
            //editor.setData(newData);
        }
    });  

}