/**
* @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
* For licensing, see LICENSE.html or http://ckeditor.com/license
*/

/**
* @fileOverview Save plugin.
*/

(function () {
    var saveCmd = {
        modes: { wysiwyg: 1, source: 1 },
        readOnly: 1,

        exec: function (editor) {
            var oldData = $('#' + editor.name + '_inlineEditCloneId').val();
            var idPageComponent = editor.element.$.attributes['data-pagecomponentid'].value;
            var mode = editor.element.$.attributes['data-mode'].value.toLowerCase();
            var lang = editor.element.$.attributes['data-lang'].value.toLowerCase();
            var idTextLanguage = editor.element.$.attributes['data-textlanguageid'].value;
            var className = editor.element.$.attributes['data-classname'].value;
            submitData(editor, oldData, idTextLanguage, className, idPageComponent, mode, lang);
        }
    };

    var pluginName = 'clawsave';

    // Register a plugin named "save".
    CKEDITOR.plugins.add(pluginName, {
        lang: 'af,ar,bg,bn,bs,ca,cs,cy,da,de,el,en-au,en-ca,en-gb,en,eo,es,et,eu,fa,fi,fo,fr-ca,fr,gl,gu,he,hi,hr,hu,is,it,ja,ka,km,ko,ku,lt,lv,mk,mn,ms,nb,nl,no,pl,pt-br,pt,ro,ru,sk,sl,sr-latn,sr,sv,th,tr,ug,uk,vi,zh-cn,zh', // %REMOVE_LINE_CORE%
        icons: 'clawsave', // %REMOVE_LINE_CORE%
        init: function (editor) {

            // Save plugin is for inline mode only.
            if (editor.elementMode != CKEDITOR.ELEMENT_MODE_INLINE)
                return;

            var command = editor.addCommand(pluginName, saveCmd);
            command.modes = { wysiwyg: 0 };

            editor.on('change', function () {
                if ($('#' + this.name + '_inlineEditCloneId').val() != this.getData())
                    this.commands['clawsave'].enable();
                else
                    this.commands['clawsave'].disable();
            })

            //editor.on(this.commands['clawsave'].click(), function () {
            //    alert('click button save');
            //})

            editor.on('blur', function () {

                var oldData = $('#' + this.name + '_inlineEditCloneId').val();
                //console.log('had blur',oldData);
                if (oldData != this.getData()) {
                    //var idTextLanguage = this.element.$.attributes['data-textlanguageid'].value; 
                    //var idTextContent = this.element.$.attributes['data-textcontentid'].value;
                    var mode = editor.element.$.attributes['data-mode'].value;
                    var lang = editor.element.$.attributes['data-lang'].value;
                    var idPageComponent = this.element.$.attributes['data-pagecomponentid'].value;
                    var className = this.element.$.attributes['data-classname'].value;
                    submitData(this, oldData, className, idPageComponent, mode, lang);
                }
                //$('#' + this.name + '_divInlineEditClone').remove();                
                $("div[id$='_divInlineEditClone']").each(function () {
                    $(this).remove();
                    //console.log("remove from blur");
                });
                editor.focus();
                return false;
            })
            editor.on('focus', function () {
                var data = this.getData();
                var text = "<div id='" + this.name + "_divInlineEditClone" + "' style='display:none' ><textarea class='" + this.name + "_inlineEditClone" + "' id='" + this.name + "_inlineEditCloneId" + "'></textarea></div>";

                $("div[id$='_divInlineEditClone']").each(function () {
                    $(this).remove();
                });
                $('body').append(text);
                $('#' + this.name + '_inlineEditCloneId').val(data);


            })

            editor.ui.addButton && editor.ui.addButton('clawsave', {
                label: editor.lang.clawsave.toolbar,
                command: pluginName,
                toolbar: 'save,1'
            });
        }
    });

})();

function submitData(editor, old, className, idPC, modetype, langcode) {

    if (confirm(editor.lang.clawsave.confirmSave)) {

        var newData = editor.getData();
        $('#' + this.name + '_inlineEditCloneId').val(newData);
        editor.setData(newData);
        $.ajax({
            url: "/admin/modules/system/settings/" + className.toLowerCase() + "settings" + "/update/"+ idPC +"?mode=" + modetype + "&lang=" + langcode,
            type: "POST",
            data: { languagecode: langcode, textValue: newData, idpc: idPC },
            success: function (result) {
                if (result) {
                    if (result.htmlVersion.length > 0) {
                        if (result.only == false) {
                            var div = $("#" + result.divUpdate);
                            div.children(".dropdown-menu").prepend($.parseHTML(result.htmlVersion));
                            if (result.currId > 0) {
                                $("li[data-version='" + result.currId + "']").replaceWith(result.htmlVersionCurr);
                            }
                            deleteVersion();
                            setVersion();
                        }
                        else {
                            var dataDropdown = "#" + "version-" + result.idpc;
                            $(".js-editor[data-pagecomponentid='" + result.idpc + "']").closest(".block-item").find(".toolbox_wrap ul li:last-child").remove();
                            $(".js-editor[data-pagecomponentid='" + result.idpc + "']").closest(".block-item").find(".toolbox_wrap ul").append("<li><a class='version_toolbox' data-dropdown='" + dataDropdown + "' title='Version' href='javascript:void(0)'>Version</a></li><li style='float:none;clear:both;'></li>");
                            if ($("#" + result.divUpdate).length > 0) {
                                $("#" + result.divUpdate).remove();
                            }
                            $(document.body).append($.parseHTML(result.htmlVersion));
                            deleteVersion();
                            setVersion();
                        }
                    }
                    else {
                        if (result.divUpdate > 0) {
                            // change id
                            $(".js-editor[data-pagecomponentid='" + result.idpc + "']").attr('data-textlanguageid', result.divUpdate);
                        }
                        $("#" + result.divUpdate).remove();
                        $(".js-editor[data-pagecomponentid='" + result.idpc + "']").closest(".block-item").find(".version_boxhv").remove();

                    }
                    $('#' + editor.name + '_inlineEditCloneId').val(newData);
                    if (editor.element.length > 0) {
                        var tempPa = $(editor.element.$).closest(".element");
                        //console.log(tempPa);
                        if (tempPa.length > 0) {
                            //var tempFirst = tempPa.children(":first");
                            tempPa.prepend("<div class='overlay'></div>");
                        }
                    }
                    $(editor.element.$).blur();
                    editor.destroy();
                    $(".js-editor[contenteditable=true]").attr("contenteditable", false);
                    if (clawEditMode != null) {
                        clawEditMode.callbackParent();
                    }
                }
            },
        });
    }
    else {
        //editor.setData($('textarea.' + editor.name).val());
        //console.log('old data - not save', old);
        editor.setData(old);
        editor.destroy();
        $(".js-editor[contenteditable=true]").attr("contenteditable", false);
        if (clawEditMode != null) {
            clawEditMode.callbackParent();
        }
    }

}

$(document).ready(function () {
    // remove inline ckeditor tooltip
    setTimeout(loadPhrase, 1000);
})

function loadPhrase() {
    try {
        var insName = $('div[contenteditable=true]').attr('id');
        if (CKEDITOR.instances[insName])
            $('div[contenteditable=true]').attr('title', CKEDITOR.instances[insName].lang.clawsave.clicktoedit);
    }
    catch (err) { }
}
