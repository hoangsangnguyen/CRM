
    CKEDITOR.on('instanceCreated', function (event) {
        var editor = event.editor,
            element = editor.element;
        // Customize editors for headers and tag list.
        // These editors don't need features like smileys, templates, iframes etc.
        editor.config.fillEmptyBlocks = true;
        editor.config.tabSpaces = 0;
        editor.config.forcePasteAsPlainText = true;
        if (element.getAttribute('contenteditable') == 'true') {
            // Customize the editor configurations on "configLoaded" event,
            // which is fired after the configuration file loading and
            // execution. This makes it possible to change the
            // configurations before the editor initialization takes place.
            //if (element.getAttribute('class') == 'ckeditor_div')
            if (element.getAttribute('data-islabel') == 'False')
                {               
                editor.on('configLoaded', function () {
                    editor.config.specialChars = CKEDITOR.config.specialChars.concat([['&omega;', 'Omega']]);
                    //editor.config.fillEmptyBlocks = false;
                        editor.config.allowedContent = true;
                        editor.config.extraPlugins = 'onchange,clawsave,clawcancel,imageresize,simpleLink,specialchar';//,image2,testplugin';,internpage,clawedit,
                        // Remove unnecessary plugins to make the editor simpler.
                        editor.config.removePlugins = 'find,flash' +
                                    'forms,iframe,newpage,' +
                                    'stylescombo,templates';
                        
                        editor.config.toolbar = [
                            ['Source', 'Preview'],
                            ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord'],
                            ['Undo', 'Redo', '-', 'Find', 'Replace', '-', 'SelectAll', 'RemoveFormat'],
                            ['TextColor', 'BGColor'],
                            ['Bold', 'Italic', 'Underline'],
                            ['JustifyLeft', 'JustifyCenter', 'JustifyRight'],
                            ['NumberedList', 'BulletedList'],
                            '/',
                            ['SimpleLink', 'Unlink'],//'Link', 'Unlink', 'Anchor',
                            ['Image', 'Table'],// 'Flash',
                            ['Outdent', 'Indent'],
                            ['Styles', 'Font', 'Format', 'FontSize', 'HorizontalRule', 'Smiley', 'SpecialChar'],
                            ['clawsave', 'clawedit', 'clawcancel']
                        ];
                        
                        editor.config.filebrowserBrowseUrl= '/utility/ckfinder/ckfinder.html';
                        editor.config.filebrowserImageBrowseUrl = '/utility/ckfinder/ckfinder.html?type=Images';
                        editor.config.filebrowserUploadUrl = '/utility/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files';
                        editor.config.filebrowserImageUploadUrl = '/utility/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images';
                        editor.config.filebrowserFlashBrowseUrl = '/utility/ckfinder/ckfinder.html?type=Flash';
                        editor.config.filebrowserFlashUploadUrl = '/utility/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';
                        // Rearrange the layout of the toolbar.
                        editor.config.toolbarGroups = [
                                    { name: 'editing', groups: ['basicstyles'] },//, 'links'
                                    { name: 'undo' },
                                    { name: 'styles' },
                                    { name: 'image' },
                                    { name: 'clipboard', groups: ['selection', 'clipboard'] },
                                    { name: 'tools' },
                                    { name: 'save' }
                        ];

                    });
            }
            else if (element.getAttribute('data-islabel') == 'True') {
                editor.on('configLoaded', function () {
                    editor.config.allowedContent = true;
                    editor.config.extraPlugins = 'onchange,clawsave,clawcancel,imageresize';//,image2,testplugin',clawedit;

                    // Remove unnecessary plugins to make the editor simpler.
                    editor.config.removePlugins = 'find,flash,link' +
                                'forms,iframe,newpage,' +
                                'stylescombo,templates';

                    editor.config.toolbar = [
                        //['Source', 'Preview'],
                        //['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord'],
                        ['Undo', 'Redo'],
                        //['TextColor', 'BGColor'],
                        //['Bold', 'Italic', 'Underline'],
                        //['JustifyLeft', 'JustifyCenter', 'JustifyRight'],
                        //['NumberedList', 'BulletedList'],
                        //'/',
                        //['Link', 'Unlink', 'Anchor'],
                        //['Image', 'Flash', 'Table'],
                        //['Styles', 'Font', 'Format', 'FontSize', 'HorizontalRule', 'Smiley', 'SpecialChar'],
                        ['clawsave', 'clawcancel'] //, 'clawedit']
                    ];

                    // Rearrange the layout of the toolbar.
                    editor.config.toolbarGroups = [
                                //{ name: 'editing', groups: ['basicstyles', 'links'] },
                                { name: 'undo' },
                                //{ name: 'styles' },
                                //{ name: 'image' },
                                //{ name: 'clipboard', groups: ['selection', 'clipboard'] },
                                //{ name: 'tools' },
                                { name: 'save' }
                    ];

                });
            }
            else {               
                    editor.on('configLoaded', function () {

                        editor.config.extraPlugins = 'onchange,clawsave,clawcancel,imageresize,simpleLink';//,image2,testplugin,clawedit';

                        // Remove unnecessary plugins to make the editor simpler.,imageresize,imagepaste
                        editor.config.removePlugins = 'find,flash' +
                                    'forms,iframe,newpage,' +
                                    'stylescombo,templates';

                        editor.config.toolbar = [
                            ['Source', 'Preview'],
                            ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord'],
                            ['Undo', 'Redo', '-', 'Find', 'Replace', '-', 'SelectAll', 'RemoveFormat'],
                            ['TextColor', 'BGColor'],
                            ['Bold', 'Italic', 'Underline'],
                            ['JustifyLeft', 'JustifyCenter', 'JustifyRight'],
                            ['NumberedList', 'BulletedList'],
                            '/',
                            ['SimpleLink', 'Unlink'],//'Link', 'Anchor',
                            ['Image', 'Table'],//'Flash',
                            ['Outdent', 'Indent'],
                            ['Styles', 'Font', 'Format', 'FontSize', 'HorizontalRule', 'Smiley', 'SpecialChar'],
                            ['clawsave', 'clawedit', 'clawcancel']
                        ];
                        editor.config.filebrowserBrowseUrl = '/utility/ckfinder/ckfinder.html';
                        editor.config.filebrowserImageBrowseUrl = '/utility/ckfinder/ckfinder.html?type=Images';
                        editor.config.filebrowserUploadUrl = '/utility/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files&currentFolder=/Images/';
                        editor.config.filebrowserImageUploadUrl = '/utility/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images';
                        editor.config.filebrowserFlashBrowseUrl = '/utility/ckfinder/ckfinder.html?type=Flash';
                        editor.config.filebrowserFlashUploadUrl = '/utility/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';
                        // Rearrange the layout of the toolbar.
                        editor.config.toolbarGroups = [
                                    { name: 'editing', groups: ['basicstyles'] },
                                    { name: 'undo' },
                                    { name: 'styles' },
                                    { name: 'image' },
                                    { name: 'clipboard', groups: ['selection', 'clipboard'] },
                                    { name: 'tools' },
                                    { name: 'save' }
                        ];

                    });
               
            }
            
        }
        //CKEDITOR.on('dialogDefinition', function (ev) {
        //    // Take the dialog window name and its definition from the event data.
        //    var dialogName = ev.data.name;
        //    var dialogDefinition = ev.data.definition;

        //    //if (dialogName == 'simpleLinkDialog') {
        //    //    //    dialogDefinition.onShow = function () {
        //    //    //    // This code will open the Advanced tab.
        //    //    //    this.selectPage('tbLocalPage');
                   
        //    //    //};
        //    //    editor.config.fille
        //    //}
        //});
    });
