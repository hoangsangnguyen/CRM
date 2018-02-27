/**
* @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
* For licensing, see LICENSE.html or http://ckeditor.com/license
*/

/**
* @fileOverview Claw Edit plugin.
*/

(function () {
    var saveCmd = {
        modes: { wysiwyg: 1, source: 1 },
        readOnly: 1,
        exec: function (editor) {
            var oldData = $('#' + editor.name + '_inlineEditCloneId').val();
            editor.setData(oldData);
            var tempPa = $(editor.element.$).closest(".element");
            //console.log(tempPa);
            if (tempPa.length > 0) {
                //var tempFirst = tempPa.children(":first");
                tempPa.prepend("<div class='overlay'></div>");
            }           
            $(editor.element.$).blur();
            editor.destroy();
            $(".js-editor[contenteditable=true]").attr("contenteditable", false);
        }
    };

    var pluginName = 'clawcancel';

    // Register a plugin named "clawedit".
    CKEDITOR.plugins.add(pluginName, {
        lang: 'en,nb,no', // %REMOVE_LINE_CORE%
        icons: 'clawcancel', // %REMOVE_LINE_CORE%

        init: function (editor) {

            // clawedit plugin is for inline mode only.
            if (editor.elementMode != CKEDITOR.ELEMENT_MODE_INLINE)
                return;
            var command = editor.addCommand(pluginName, saveCmd);
            command.modes = { wysiwyg: 1 };

            editor.ui.addButton && editor.ui.addButton('clawcancel', {
                label: editor.lang.clawcancel.toolbar,
                command: pluginName,
                toolbar: 'save,3'
            });
           
        }
    });
})();

