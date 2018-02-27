// Register a new CKEditor plugin.
CKEDITOR.plugins.add('simpleLink',
    {
        lang: 'ar,ca,cs,cy,de,el,en,en-gb,es,fa,fi,fr,gl,he,hr,hu,it,ja,km,nb,nl,no,pl,pt,pt-br,ru,sl,sv,tt,uk,vi,zh,zh-cn', // %REMOVE_LINE_CORE%
        // The plugin initialization logic goes inside this method.
        // http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.pluginDefinition.html#init
        init: function (editor) {
            var iconPath = this.path + 'images/icon.png';

            editor.addCommand('simpleLinkDialog', new CKEDITOR.dialogCommand('simpleLinkDialog'));
            editor.ui.addButton('SimpleLink',
                {
                    // Toolbar button tooltip.
                    label:editor.lang.simpleLink.insertLink,// 'Insert a Link',
                    // Reference to the plugin command name.
                    command: 'simpleLinkDialog',
                    // Button's icon file path.
                    icon: iconPath
                });
            editor.on('doubleclick', function (evt) {

                var element = CKEDITOR.plugins.link.getSelectedLink(editor) || evt.data.element;

                if (!element.isReadOnly()) {
                    if (element.is('a')) {
                        evt.data.dialog = 'simpleLinkDialog';
                        editor.getSelection().selectElement(element);
                    }
                    //else if (CKEDITOR.plugins.link.tryRestoreFakeAnchor(editor, element))
                    //    evt.data.dialog = 'anchor';
                }

            });
            if (editor.contextMenu) {
                editor.removeMenuItem('link');
                editor.addMenuGroup('editGroup');
                editor.addMenuItem('edititem',
                    {
                        label:editor.lang.simpleLink.linkProperties,// 'Link properties',
                        icon: iconPath,
                        command: 'simpleLinkDialog',
                        group: 'editGroup'
                    });
                editor.contextMenu.addListener(function (element) {

                    if (!element.is('a'))
                        return null;
                    return { edititem: CKEDITOR.TRISTATE_ON };
                });
            }

            // http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.dialog.dialogDefinition.html
            CKEDITOR.dialog.add('simpleLinkDialog', function (editor) {
                var plugin = CKEDITOR.plugins.link;
                var stringPage = document.getElementById("listInternalLinks").value;
                var pageInternal = stringPage.substring(1, stringPage.length - 1);
                // Handles the event when the "Target" selection box is changed.
                var targetChanged = function () {
                    var dialog = this.getDialog(),
                        popupFeatures = dialog.getContentElement('tbAnotherWeb', 'popupFeatures'),
                        targetName = dialog.getContentElement('tbAnotherWeb', 'linkTargetName'),
                        value = this.getValue();

                    if (!popupFeatures || !targetName)
                        return;

                    popupFeatures = popupFeatures.getElement();
                    popupFeatures.hide();
                    targetName.setValue('');

                    switch (value) {
                        case 'frame':
                            targetName.setLabel(editor.lang.link.targetFrameName);
                            targetName.getElement().show();
                            break;
                        case 'popup':
                            popupFeatures.show();
                            targetName.setLabel(editor.lang.link.targetPopupName);
                            targetName.getElement().show();
                            break;
                        default:
                            targetName.setValue(value);
                            targetName.getElement().hide();
                            break;
                    }

                };

                var targetLocalChanged = function () {
                    var dialog = this.getDialog(),
                        popupFeatures = dialog.getContentElement('tbLocalPage', 'popupFeatures1'),
                        targetName = dialog.getContentElement('tbLocalPage', 'linkTargetName1'),
                        value = this.getValue();

                    if (!popupFeatures || !targetName)
                        return;

                    popupFeatures = popupFeatures.getElement();
                    popupFeatures.hide();
                    targetName.setValue('');

                    switch (value) {
                        case 'frame':
                            targetName.setLabel(editor.lang.link.targetFrameName);
                            targetName.getElement().show();
                            break;
                        case 'popup':
                            popupFeatures.show();
                            targetName.setLabel(editor.lang.link.targetPopupName);
                            targetName.getElement().show();
                            break;
                        default:
                            targetName.setValue(value);
                            targetName.getElement().hide();
                            break;
                    }

                };

                // Handles the event when the "Type" selection box is changed.
                var linkTypeChanged = function () {
                    var dialog = this.getDialog(),
                        partIds = ['urlOptions', 'localPageOptions', 'emailOptions'], // edit by tuannh ,  
                        //partIds = [ 'urlOptions', 'anchorOptions', 'emailOptions' ],
                        typeValue = this.getValue(),
                        uploadTab = dialog.definition.getContents('upload'),
                        uploadInitiallyHidden = uploadTab && uploadTab.hidden;

                    //if (typeValue == 'url') {
                    //    if (editor.config.linkShowTargetTab)
                    //        dialog.showPage('target');
                    //    if (!uploadInitiallyHidden)
                    //        dialog.showPage('upload');
                    //} else {
                    //    dialog.hidePage('target');
                    //    if (!uploadInitiallyHidden)
                    //        dialog.hidePage('upload');
                    //}

                    for (var i = 0; i < partIds.length; i++) {
                        var element = dialog.getContentElement('info', partIds[i]);
                        if (!element)
                            continue;

                        element = element.getElement().getParent().getParent();
                        if (partIds[i] == typeValue + 'Options')
                            element.show();
                        else
                            element.hide();
                    }

                    dialog.layout();
                };

                // Loads the parameters in a selected link to the link dialog fields.
                var javascriptProtocolRegex = /^javascript:/,
                    emailRegex = /^mailto:([^?]+)(?:\?(.+))?$/,
                    emailSubjectRegex = /subject=([^;?:@&=$,\/]*)/,
                    emailBodyRegex = /body=([^;?:@&=$,\/]*)/,
                    anchorRegex = /^#(.*)$/,
                    urlRegex = /^((?:http|https|ftp|news):\/\/)?(.*)$/,
                    selectableTargets = /^(_(?:self|top|parent|blank))$/,
                    encodedEmailLinkRegex = /^javascript:void\(location\.href='mailto:'\+String\.fromCharCode\(([^)]+)\)(?:\+'(.*)')?\)$/,
                    functionCallProtectedEmailLinkRegex = /^javascript:([^(]+)\(([^)]+)\)$/;

                var popupRegex = /\s*window.open\(\s*this\.href\s*,\s*(?:'([^']*)'|null)\s*,\s*'([^']*)'\s*\)\s*;\s*return\s*false;*\s*/;
                var popupFeaturesRegex = /(?:^|,)([^=]+)=(\d+|yes|no)/gi;
                var multiTarget = "notSet";
                var multiTargetName = "notSet";
                var targetTab = "tbAnotherWeb";
                var parseLink = function (editor, element) {
                    var href = (element && (element.data('cke-saved-href') || element.getAttribute('href'))) || '',
                        javascriptMatch, emailMatch, urlMatch,
                        retval = {};//anchorMatch,

                    if ((javascriptMatch = href.match(javascriptProtocolRegex))) {
                        if (emailProtection == 'encode') {
                            href = href.replace(encodedEmailLinkRegex, function (match, protectedAddress, rest) {
                                return 'mailto:' +
                                    String.fromCharCode.apply(String, protectedAddress.split(',')) +
                                    (rest && unescapeSingleQuote(rest));
                            });
                        }
                            // Protected email link as function call.
                        else if (emailProtection) {
                            href.replace(functionCallProtectedEmailLinkRegex, function (match, funcName, funcArgs) {
                                if (funcName == compiledProtectionFunction.name) {
                                    retval.type = 'email';
                                    var email = retval.email = {};

                                    var paramRegex = /[^,\s]+/g,
                                        paramQuoteRegex = /(^')|('$)/g,
                                        paramsMatch = funcArgs.match(paramRegex),
                                        paramsMatchLength = paramsMatch.length,
                                        paramName, paramVal;

                                    for (var i = 0; i < paramsMatchLength; i++) {
                                        paramVal = decodeURIComponent(unescapeSingleQuote(paramsMatch[i].replace(paramQuoteRegex, '')));
                                        paramName = compiledProtectionFunction.params[i].toLowerCase();
                                        email[paramName] = paramVal;
                                    }
                                    email.address = [email.name, email.domain].join('@');
                                }
                            });
                        }
                    }

                    if (!retval.type) {
                        // Protected email link as encoded string.
                        //else 
                        if ((emailMatch = href.match(emailRegex))) {
                            var subjectMatch = href.match(emailSubjectRegex),
                                bodyMatch = href.match(emailBodyRegex);

                            retval.type = 'email';
                            var email = (retval.email = {});
                            email.address = emailMatch[1];
                            subjectMatch && (email.subject = decodeURIComponent(subjectMatch[1]));
                            bodyMatch && (email.body = decodeURIComponent(bodyMatch[1]));
                        }
                            // urlRegex matches empty strings, so need to check for href as well.
                        else if (href && (urlMatch = href.match(urlRegex))) {
                            retval.type = 'url';
                            retval.url = {};
                            if (typeof (urlMatch[1]) === 'undefined') {
                                var lstExtentions = ["7z", "aiff", "asf", "avi", "bmp", "csv", "doc", "docx", "fla", "flv", "gif", "gz", "gzip", "jpeg", "jpg", "mid", "mov", "mp3", "mp4", "mpc", "mpeg", "mpg", "ods", "odt", "pdf", "png", "ppt", "pptx", "pxd", "qt", "ram", "rar", "rm", "rmi", "rmvb", "rtf", "sdc", "sitd", "swf", "sxc", "sxw", "tar", "tgz", "tif", "tiff", "txt", "vsd", "wav", "wma", "wmv", "xls", "xlsx", "zip"];
                                var lastIndexUrl = href.split('.').pop();
                                var checkExist = (lstExtentions.indexOf(lastIndexUrl) > -1);
                                if (checkExist == true) {
                                    retval.type = 'url';
                                    retval.url.url = urlMatch[2];
                                }
                                else {
                                    retval.type = 'localPage';
                                    retval.localPage = urlMatch[2];
                                }
                            } else {
                                retval.url.protocol = urlMatch[1];
                                retval.url.url = urlMatch[2];
                            }

                        } else
                            retval.type = 'url'; //'url'
                    }

                    // Load target and popup settings.
                    if (element) {
                        var target = element.getAttribute('target');
                        retval.target = {};
                        retval.adv = {};

                        // IE BUG: target attribute is an empty string instead of null in IE if it's not set.
                        if (!target) {
                            var onclick = element.data('cke-pa-onclick') || element.getAttribute('onclick'),
                                onclickMatch = onclick && onclick.match(popupRegex);
                            if (onclickMatch) {
                                retval.target.type = 'popup';
                                retval.target.name = onclickMatch[1];

                                var featureMatch;
                                while ((featureMatch = popupFeaturesRegex.exec(onclickMatch[2]))) {
                                    // Some values should remain numbers (#7300)
                                    if ((featureMatch[2] == 'yes' || featureMatch[2] == '1') && !(featureMatch[1] in { height: 1, width: 1, top: 1, left: 1 }))
                                        retval.target[featureMatch[1]] = true;
                                    else if (isFinite(featureMatch[2]))
                                        retval.target[featureMatch[1]] = featureMatch[2];
                                }
                            }
                        } else {
                            var targetMatch = target.match(selectableTargets);
                            if (targetMatch)
                                retval.target.type = retval.target.name = target;
                            else {
                                retval.target.type = 'frame';
                                retval.target.name = target;
                            }
                        }

                        var me = this;
                        var advAttr = function (inputName, attrName) {
                            var value = element.getAttribute(attrName);
                            if (value !== null)
                                retval.adv[inputName] = value || '';
                        };
                        advAttr('advId', 'id');
                        advAttr('advLangDir', 'dir');
                        advAttr('advAccessKey', 'accessKey');

                        retval.adv.advName = element.data('cke-saved-name') || element.getAttribute('name') || '';
                        advAttr('advLangCode', 'lang');
                        advAttr('advTabIndex', 'tabindex');
                        advAttr('advTitle', 'title');
                        advAttr('advContentType', 'type');
                        CKEDITOR.plugins.link.synAnchorSelector ? retval.adv.advCSSClasses = getLinkClass(element) : advAttr('advCSSClasses', 'class');
                        advAttr('advCharset', 'charset');
                        advAttr('advStyles', 'style');
                        advAttr('advRel', 'rel');
                    }

                    // Find out whether we have any anchors in the editor.
                    var anchors = retval.anchors = [],
                        i, count, item;

                    // For some browsers we set contenteditable="false" on anchors, making document.anchors not to include them, so we must traverse the links manually (#7893).
                    if (CKEDITOR.plugins.link.emptyAnchorFix) {
                        var links = editor.document.getElementsByTag('a');
                        for (i = 0, count = links.count() ; i < count; i++) {
                            item = links.getItem(i);
                            if (item.data('cke-saved-name') || item.hasAttribute('name'))
                                anchors.push({ name: item.data('cke-saved-name') || item.getAttribute('name'), id: item.getAttribute('id') });
                        }
                    } else {
                        var anchorList = new CKEDITOR.dom.nodeList(editor.document.$.anchors);
                        for (i = 0, count = anchorList.count() ; i < count; i++) {
                            item = anchorList.getItem(i);
                            anchors[i] = { name: item.getAttribute('name'), id: item.getAttribute('id') };
                        }
                    }

                    if (CKEDITOR.plugins.link.fakeAnchor) {
                        var imgs = editor.document.getElementsByTag('img');
                        for (i = 0, count = imgs.count() ; i < count; i++) {
                            if ((item = CKEDITOR.plugins.link.tryRestoreFakeAnchor(editor, imgs.getItem(i))))
                                anchors.push({ name: item.getAttribute('name'), id: item.getAttribute('id') });
                        }
                    }

                    // Record down the selected element in the dialog.
                    this._.selectedElement = element;
                    return retval;
                };

                var setupParams = function (page, data) {
                    if (data[page])
                        this.setValue(data[page][this.id] || '');
                };

                var setupPopupParams = function (data) {
                    return setupParams.call(this, 'target', data);
                };

                var setupAdvParams = function (data) {
                    return setupParams.call(this, 'adv', data);
                };

                var commitParams = function (page, data) {
                    if (!data[page])
                        data[page] = {};

                    data[page][this.id] = this.getValue() || '';
                };

                var commitPopupParams = function (data) {
                    return commitParams.call(this, 'target', data);
                };

                var commitPopupParamsLocalPage = function (data) {
                    return commitParams.call(this, 'target', data);
                };

                var commitAdvParams = function (data) {
                    return commitParams.call(this, 'adv', data);
                };

                function unescapeSingleQuote(str) {
                    return str.replace(/\\'/g, '\'');
                }

                function escapeSingleQuote(str) {
                    return str.replace(/'/g, '\\$&');
                }
                
                var featureListWebAddress = ['resizable', 'status', 'location', 'toolbar', 'menubar', 'fullscreen',
                                                                                       'scrollbars', 'dependent'];

                var emailProtection = editor.config.emailProtection || '';

                // Compile the protection function pattern.
                if (emailProtection && emailProtection != 'encode') {
                    var compiledProtectionFunction = {};

                    emailProtection.replace(/^([^(]+)\(([^)]+)\)$/, function (match, funcName, params) {
                        compiledProtectionFunction.name = funcName;
                        compiledProtectionFunction.params = [];
                        params.replace(/[^,\s]+/g, function (param) {
                            compiledProtectionFunction.params.push(param);
                        });
                    });
                }

                function protectEmailLinkAsFunction(email) {
                    var retval,
                        name = compiledProtectionFunction.name,
                        params = compiledProtectionFunction.params,
                        paramName, paramValue;

                    retval = [name, '('];
                    for (var i = 0; i < params.length; i++) {
                        paramName = params[i].toLowerCase();
                        paramValue = email[paramName];

                        i > 0 && retval.push(',');
                        retval.push('\'', paramValue ? escapeSingleQuote(encodeURIComponent(email[paramName])) : '', '\'');
                    }
                    retval.push(')');
                    return retval.join('');
                }

                function protectEmailAddressAsEncodedString(address) {
                    var charCode,
                        length = address.length,
                        encodedChars = [];
                    for (var i = 0; i < length; i++) {
                        charCode = address.charCodeAt(i);
                        encodedChars.push(charCode);
                    }
                    return 'String.fromCharCode(' + encodedChars.join(',') + ')';
                }

                function getLinkClass(ele) {
                    var className = ele.getAttribute('class');
                    return className ? className.replace(/\s*(?:cke_anchor_empty|cke_anchor)(?:\s*$)?/g, '') : '';
                }

                var commonLang = editor.lang.common,
                    linkLang = editor.lang.link;
                return {
                    id: 'info',
                    title: editor.lang.simpleLink.insertLink,//'Insert a link',
                    minWidth: 400,
                    minHeight: 200,
                    contents:
                    [

                        {
                            // Definition of the Advanced Settings dialog window tab with its id, label and contents.
                            id: 'tbAnotherWeb',
                            label: editor.lang.simpleLink.webAddress,// 'Web address',
                            elements:
                            [
                                {
                                    type: 'vbox',
                                    id: 'urlOptions',
                                    children: [
                                        {
                                            type: 'hbox',
                                            widths: ['25%', '75%'],
                                            children: [
                                                {
                                                    id: 'protocol',
                                                    type: 'select',
                                                    label: commonLang.protocol,
                                                    'default': 'http://',
                                                    items: [
                                                        // Force 'ltr' for protocol names in BIDI. (#5433)
                                                        //,[linkLang.other, '']
                                                        ['http://\u200E', 'http://'],
                                                        ['https://\u200E', 'https://'],
                                                        ['ftp://\u200E', 'ftp://'],
                                                        ['news://\u200E', 'news://'],
                                                        [linkLang.other, '']
                                                    ],
                                                    setup: function (data) {
                                                        if (data.url)
                                                            this.setValue(data.url.protocol || '');
                                                    },
                                                    commit: function (data) {
                                                        if (!data.url)
                                                            data.url = {};

                                                        data.url.protocol = this.getValue();
                                                    }
                                                },
                                                {
                                                    type: 'text',
                                                    id: 'url',
                                                    label: commonLang.url,
                                                    required: true,
                                                    onLoad: function () {
                                                        this.allowOnChange = true;
                                                    },
                                                    onKeyUp: function () {
                                                        this.allowOnChange = false;
                                                        var protocolCmb = this.getDialog().getContentElement('tbAnotherWeb', 'protocol'),
                                                            url = this.getValue(),
                                                            urlOnChangeProtocol = /^(http|https|ftp|news):\/\/(?=.)/i,
                                                            urlOnChangeTestOther = /^((javascript:)|[#\/\.\?])/i;

                                                        var protocol = urlOnChangeProtocol.exec(url);
                                                        if (protocol) {
                                                            this.setValue(url.substr(protocol[0].length));
                                                            protocolCmb.setValue(protocol[0].toLowerCase());
                                                        } else if (urlOnChangeTestOther.test(url))
                                                            protocolCmb.setValue('');

                                                        this.allowOnChange = true;
                                                    },
                                                    onChange: function () {
                                                        if (this.allowOnChange) // Dont't call on dialog load.
                                                            this.onKeyUp();
                                                    },
                                                    validate: function () {
                                                        var currObj = CKEDITOR.dialog.getCurrent();
                                                        var currTab = currObj.definition.dialog._.currentTabId;
                                                        if (currTab == "tbAnotherWeb") {
                                                            var dialog = this.getDialog();
                                                            console.log("protocol", dialog.getValueOf('tbAnotherWeb', 'protocol'));
                                                            if (dialog.getContentElement('tbAnotherWeb', 'urlOptions') && dialog.getValueOf('tbAnotherWeb', 'protocol') == '')
                                                                return true;

                                                            var re = /(http(s)?:\\)?([\w-]+\.)+[\w-]+[.com|.in|.org]+(\[\?%&=]*)?/;

                                                            if ((/javascript\:/).test(this.getValue())) {
                                                                alert(commonLang.invalidValue);
                                                                return false;
                                                            }
                                                            if (!re.test(this.getValue())) {
                                                                alert(commonLang.invalidValue);
                                                                return false;
                                                            }

                                                            if (this.getDialog().fakeObj) // Edit Anchor.
                                                                return true;
                                                            return true;
                                                        }
                                                      
                                                    },
                                                    setup: function (data) {
                                                        this.allowOnChange = false;
                                                        if (data.url)   
                                                            this.setValue(data.url.url);
                                                        if (data.type == 'url')
                                                            this.select();
                                                        this.allowOnChange = true;

                                                    },
                                                    commit: function (data) {
                                                        // IE will not trigger the onChange event if the mouse has been used
                                                        // to carry all the operations #4724
                                                        this.onChange();

                                                        if (!data.url)
                                                            data.url = {};

                                                        data.url.url = this.getValue();
                                                        this.allowOnChange = false;
                                                    }
                                                }
                                            ],
                                            setup: function (data) {
                                                this.getElement().show();

                                            }
                                        },
                                        {
                                            type: 'button',
                                            id: 'browse',
                                            hidden: 'true',
                                            filebrowser: 'tbAnotherWeb:url',
                                            label: commonLang.browseServer
                                        }
                                    ]
                                },
                                {
                                    type: 'hbox',
                                    widths: ['50%', '50%'],
                                    children: [
                                        {
                                            type: 'select',
                                            id: 'linkTargetType',
                                            label: commonLang.target,
                                            'default': 'notSet',
                                            style: 'width : 100%;',
                                            'items': [
                                                [commonLang.notSet, 'notSet'],
                                                [linkLang.targetFrame, 'frame'],
                                                [linkLang.targetPopup, 'popup'],
                                                [commonLang.targetNew, '_blank'],
                                                [commonLang.targetTop, '_top'],
                                                [commonLang.targetSelf, '_self'],
                                                [commonLang.targetParent, '_parent']
                                            ],
                                            onChange: targetChanged,
                                            setup: function (data) {
                                                if (data.target)
                                                    this.setValue(data.target.type || 'notSet');
                                                targetChanged.call(this);
                                            },
                                            commit: function (data) {
                                                if (!data.target)
                                                    data.target = {};
                                                console.log("value target another", this.getValue());
                                                var currObj = CKEDITOR.dialog.getCurrent();
                                                var currTab = currObj.definition.dialog._.currentTabId;
                                                targetTab = currTab;
                                                if (currTab == "tbLocalPage") {
                                                    data.target.type = multiTarget;
                                                } else {
                                                    data.target.type = this.getValue();
                                                    multiTarget = this.getValue();
                                                }

                                            }
                                        },
                                        {
                                            type: 'text',
                                            id: 'linkTargetName',
                                            label: linkLang.targetFrameName,
                                            'default': '',
                                            setup: function (data) {
                                                if (data.target)
                                                    this.setValue(data.target.name);
                                            },
                                            commit: function (data) {
                                                if (!data.target)
                                                    data.target = {};
                                                var currObj = CKEDITOR.dialog.getCurrent();
                                                var currTab = currObj.definition.dialog._.currentTabId;
                                                if (currTab == "tbLocalPage") {
                                                    data.target.name = multiTargetName;
                                                } else {
                                                    multiTargetName = this.getValue().replace(/\W/gi, '');
                                                    data.target.name = this.getValue().replace(/\W/gi, '');
                                                }

                                            }
                                        }
                                    ]
                                },
				{
				    type: 'vbox',
				    width: '100%',
				    align: 'center',
				    padding: 2,
				    id: 'popupFeatures',
				    children: [
                        {
                            type: 'fieldset',
                            label: linkLang.popupFeatures,
                            children: [
                                {
                                    type: 'hbox',
                                    children: [
                                        {
                                            type: 'checkbox',
                                            id: 'resizable',
                                            label: linkLang.popupResizable,
                                            setup: function (data) {
                                                if (data.target)
                                                    this.setValue(data.target.resizable);
                                            },
                                            commit: function (data) {
                                                if (targetTab == "tbLocalPage") {
                                                    return commitPopupParamsLocalPage;
                                                } else {
                                                    //return commitPopupParams; 
                                                    featureListWebAddress['resizable'] = this.getValue();
                                                    data.target.resizable = this.getValue();
                                                    console.log("comit tbanotherweb", data);
                                                    //return commitPopupParams;
                                                }
                                                //return commitPopupParams;
                                            }
                                        },
                                        {
                                            type: 'checkbox',
                                            id: 'status',
                                            label: linkLang.popupStatusBar,
                                            setup: function (data) {
                                                if (typeof (data.target) != 'undefined')
                                                    this.setValue(data.target.status);
                                            },
                                            commit: function (data) {
                                                if (targetTab == "tbLocalPage") {
                                                    return commitPopupParamsLocalPage;
                                                } else {
                                                    //return commitPopupParams;
                                                    featureListWebAddress['status'] = this.getValue();
                                                    data.target.status = this.getValue();
                                                }
                                                //return commitPopupParams;
                                            }

                                        }
                                    ]
                                },
                                {
                                    type: 'hbox',
                                    children: [
                                        {
                                            type: 'checkbox',
                                            id: 'location',
                                            label: linkLang.popupLocationBar,
                                            setup: function (data) {
                                                if (typeof (data.target) != 'undefined')
                                                    this.setValue(data.target.location);
                                            },
                                            commit: function (data) {
                                                if (targetTab == "tbLocalPage") {
                                                    return commitPopupParamsLocalPage;
                                                } else {
                                                    //return commitPopupParams;// 
                                                    featureListWebAddress['location'] = this.getValue();
                                                    data.target.location = this.getValue();
                                                }
                                                //return commitPopupParams;
                                            }

                                        },
                                        {
                                            type: 'checkbox',
                                            id: 'toolbar',
                                            label: linkLang.popupToolbar,
                                            setup: function (data) {
                                                if (typeof (data.target) != 'undefined')
                                                    this.setValue(data.target.toolbar);
                                            },
                                            commit: function (data) {
                                                if (targetTab == "tbLocalPage") {
                                                    return commitPopupParamsLocalPage;
                                                } else {
                                                    //return commitPopupParams; //
                                                    featureListWebAddress['toolbar'] = this.getValue();
                                                    data.target.toolbar = this.getValue();
                                                }
                                                //return commitPopupParams;
                                            }

                                        }
                                    ]
                                },
                                {
                                    type: 'hbox',
                                    children: [
                                        {
                                            type: 'checkbox',
                                            id: 'menubar',
                                            label: linkLang.popupMenuBar,
                                            setup: function (data) {
                                                if (typeof (data.target) != 'undefined')
                                                    this.setValue(data.target.menubar);
                                            },
                                            commit: function (data) {
                                                if (targetTab == "tbLocalPage") {
                                                    return commitPopupParamsLocalPage;
                                                } else {
                                                    //return commitPopupParams; //
                                                    featureListWebAddress['menubar'] = this.getValue();
                                                    data.target.menubar = this.getValue();
                                                }
                                                //return commitPopupParams;
                                            }

                                        },
                                        {
                                            type: 'checkbox',
                                            id: 'fullscreen',
                                            label: linkLang.popupFullScreen,
                                            setup: function (data) {
                                                if (typeof (data.target) != 'undefined')
                                                    this.setValue(data.target.fullscreen);
                                            },
                                            commit: function (data) {
                                                if (targetTab == "tbLocalPage") {
                                                    return commitPopupParamsLocalPage;
                                                } else {
                                                    //return commitPopupParams;// 
                                                    featureListWebAddress['fullscreen'] = this.getValue();
                                                    data.target.fullscreen = this.getValue();
                                                }
                                                //return commitPopupParams;
                                            }

                                        }
                                    ]
                                },
                                {
                                    type: 'hbox',
                                    children: [
                                        {
                                            type: 'checkbox',
                                            id: 'scrollbars',
                                            label: linkLang.popupScrollBars,
                                            setup: function (data) {
                                                if (typeof (data.target) != 'undefined')
                                                    this.setValue(data.target.scrollbars);
                                            },
                                            commit: function (data) {
                                                if (targetTab == "tbLocalPage") {
                                                    return commitPopupParamsLocalPage;
                                                } else {
                                                    //return commitPopupParams; //
                                                    featureListWebAddress['scrollbars'] = this.getValue();
                                                    data.target.scrollbars = this.getValue();
                                                }
                                                //return commitPopupParams;
                                            }

                                        },
                                        {
                                            type: 'checkbox',
                                            id: 'dependent',
                                            label: linkLang.popupDependent,
                                            setup: function (data) {
                                                if (typeof (data.target) != 'undefined')
                                                    this.setValue(data.target.dependent);
                                            },
                                            commit: function (data) {
                                                if (targetTab == "tbLocalPage") {
                                                    return commitPopupParamsLocalPage;
                                                } else {
                                                    //return commitPopupParams; //
                                                    featureListWebAddress['dependent'] = this.getValue();
                                                    data.target.dependent = this.getValue();
                                                }
                                                //return commitPopupParams;
                                            }

                                        }
                                    ]
                                },
                                {
                                    type: 'hbox',
                                    children: [
                                        {
                                            type: 'text',
                                            widths: ['50%', '50%'],
                                            labelLayout: 'horizontal',
                                            label: commonLang.width,
                                            id: 'width',
                                            setup: function (data) {
                                                if (data.target)
                                                    this.setValue(data.target.width);
                                            },
                                            commit: function (data) {
                                                if (targetTab == "tbLocalPage") {
                                                    return commitPopupParamsLocalPage;
                                                } else {
                                                    //return commitPopupParams; //
                                                    data.target.width = this.getValue();
                                                    featureListWebAddress['width'] = this.getValue();
                                                    //return commitPopupParams;
                                                }
                                                //return commitPopupParams;
                                            }

                                        },
                                        {
                                            type: 'text',
                                            labelLayout: 'horizontal',
                                            widths: ['50%', '50%'],
                                            label: linkLang.popupLeft,
                                            id: 'left',
                                            setup: function (data) {
                                                if (typeof (data.target) != 'undefined')
                                                    this.setValue(data.target.left);
                                            },
                                            commit: function (data) {
                                                if (targetTab == "tbLocalPage") {
                                                    return commitPopupParamsLocalPage;
                                                } else {
                                                    //return commitPopupParams; //
                                                    featureListWebAddress['left'] = this.getValue();
                                                    data.target.left = this.getValue();
                                                }
                                                //return commitPopupParams;
                                            }

                                        }
                                    ]
                                },
                                {
                                    type: 'hbox',
                                    children: [
                                        {
                                            type: 'text',
                                            labelLayout: 'horizontal',
                                            widths: ['50%', '50%'],
                                            label: commonLang.height,
                                            id: 'height',
                                            setup: function (data) {
                                                if (typeof (data.target) != 'undefined')
                                                    this.setValue(data.target.height);
                                            }//setupPopupParams
                                            ,
                                            commit: function (data) {
                                                if (targetTab == "tbLocalPage") {
                                                    return commitPopupParamsLocalPage;
                                                } else {
                                                    featureListWebAddress['height'] = this.getValue();
                                                    data.target.height = this.getValue();
                                                    //return commitPopupParams;
                                                }
                                                //return commitPopupParams;
                                            }

                                        },
                                        {
                                            type: 'text',
                                            labelLayout: 'horizontal',
                                            label: linkLang.popupTop,
                                            widths: ['50%', '50%'],
                                            id: 'top',
                                            setup: function (data) {
                                                if (typeof (data.target) != 'undefined')
                                                    this.setValue(data.target.top);
                                            }//setupPopupParams
                                            ,
                                            commit: function (data) {
                                                if (targetTab == "tbLocalPage") {
                                                    return commitPopupParamsLocalPage;
                                                } else {
                                                    //return commitPopupParams; //
                                                    featureListWebAddress['top'] = this.getValue();
                                                    data.target.top = this.getValue();
                                                }
                                                //return commitPopupParams;
                                            }

                                        }
                                    ]
                                }
                            ]
                        }
				    ]
				}
                            ]
                        },
                        {
                            id: 'tbLocalPage',
                            label: editor.lang.simpleLink.tabPageFrom,//'Page from this site',
                            elements:
                            [
                                {
                                    type: 'vbox',
                                    id: 'localPageOptions',
                                    children: [

                                        {
                                            type: 'select',
                                            label: editor.lang.simpleLink.lblPageLinkTo,// 'Page from within your site to link to',
                                            id: 'localPage',
                                            title: editor.lang.simpleLink.titlePageLink,//'Select the page from within your site that you would like to link to',
                                            items: eval(pageInternal),
                                            //onChange: function () {
                                            //    //var d = CKEDITOR.dialog.getCurrent();
                                            //    //d.setValueOf('tbLocalPage', 'localPage', this.getValue());
                                            //    //d.setValueOf('info', 'protocol', !this.getValue() ? 'http://' : '');
                                            //},
                                            setup: function (data) {
                                                if (data.localPage)
                                                    this.setValue(data.localPage ? data.localPage : data.url);

                                            },
                                            commit: function (data) {
                                                if (!data.localPage)
                                                    data.localPage = {};
                                                data.localPage = this.getValue();

                                            }

                                        }]
                                },
                                {
                                    type: 'hbox',
                                    widths: ['50%', '50%'],
                                    children: [
                                        {
                                            type: 'select',
                                            id: 'linkTargetType1',
                                            label: commonLang.target,
                                            'default': 'notSet',
                                            style: 'width : 100%;',
                                            'items': [
                                                [commonLang.notSet, 'notSet'],
                                                [linkLang.targetFrame, 'frame'],
                                                [linkLang.targetPopup, 'popup'],
                                                [commonLang.targetNew, '_blank'],
                                                [commonLang.targetTop, '_top'],
                                                [commonLang.targetSelf, '_self'],
                                                [commonLang.targetParent, '_parent']
                                            ],
                                            onChange: targetLocalChanged,
                                            setup: function (data) {
                                                if (data.target)
                                                    this.setValue(data.target.type || 'notSet');
                                                targetLocalChanged.call(this);
                                            },
                                            commit: function (data) {
                                                if (!data.target)
                                                    data.target = {};
                                                //var currObj = CKEDITOR.dialog.getCurrent();
                                                //var currTab = currObj.definition.dialog._.currentTabId;
                                                if (targetTab == "tbLocalPage") {
                                                    multiTarget = this.getValue();
                                                    data.target.type = this.getValue();
                                                }
                                            }
                                        },
                                        {
                                            type: 'text',
                                            id: 'linkTargetName1',
                                            label: linkLang.targetFrameName,
                                            'default': '',
                                            setup: function (data) {
                                                if (data.target)
                                                    this.setValue(data.target.name);
                                            },
                                            commit: function (data) {
                                                if (!data.target)
                                                    data.target = {};
                                                if (targetTab == "tbLocalPage") {
                                                    multiTargetName = this.getValue().replace(/\W/gi, '');
                                                    data.target.name = this.getValue().replace(/\W/gi, '');
                                                }
                                                
                                            }
                                        }
                                    ]
                                },
				{
				    type: 'vbox',
				    width: '100%',
				    align: 'center',
				    padding: 2,
				    id: 'popupFeatures1',
				    children: [
                        {
                            type: 'fieldset',
                            label: linkLang.popupFeatures,
                            children: [
                                {
                                    type: 'hbox',
                                    children: [
                                        {
                                            type: 'checkbox',
                                            id: 'resizable',
                                            label: linkLang.popupResizable,
                                            setup: setupPopupParams,
                                            commit: commitPopupParamsLocalPage,
                                            //    function (data) {
                                            //    if (targetTab == 'tbLocalPage') {
                                            //        return commitPopupParamsLocalPage;
                                            //    } 
                                            //}
                                        },
                                        {
                                            type: 'checkbox',
                                            id: 'status',
                                            label: linkLang.popupStatusBar,
                                            setup: setupPopupParams,
                                            commit: commitPopupParamsLocalPage,
                                            //    function (data) {
                                            //    if (targetTab == 'tbLocalPage') {
                                            //        return commitPopupParamsLocalPage;
                                            //    } 
                                            //}
                                        }
                                    ]
                                },
                                {
                                    type: 'hbox',
                                    children: [
                                        {
                                            type: 'checkbox',
                                            id: 'location',
                                            label: linkLang.popupLocationBar,
                                            setup: setupPopupParams,
                                            commit: commitPopupParamsLocalPage

                                        },
                                        {
                                            type: 'checkbox',
                                            id: 'toolbar',
                                            label: linkLang.popupToolbar,
                                            setup: setupPopupParams,
                                            commit: commitPopupParamsLocalPage

                                        }
                                    ]
                                },
                                {
                                    type: 'hbox',
                                    children: [
                                        {
                                            type: 'checkbox',
                                            id: 'menubar',
                                            label: linkLang.popupMenuBar,
                                            setup: setupPopupParams,
                                            commit: commitPopupParamsLocalPage

                                        },
                                        {
                                            type: 'checkbox',
                                            id: 'fullscreen',
                                            label: linkLang.popupFullScreen,
                                            setup: setupPopupParams,
                                            commit: commitPopupParamsLocalPage

                                        }
                                    ]
                                },
                                {
                                    type: 'hbox',
                                    children: [
                                        {
                                            type: 'checkbox',
                                            id: 'scrollbars',
                                            label: linkLang.popupScrollBars,
                                            setup: setupPopupParams,
                                            commit: commitPopupParamsLocalPage

                                        },
                                        {
                                            type: 'checkbox',
                                            id: 'dependent',
                                            label: linkLang.popupDependent,
                                            setup: setupPopupParams,
                                            commit: commitPopupParamsLocalPage

                                        }
                                    ]
                                },
                                {
                                    type: 'hbox',
                                    children: [
                                        {
                                            type: 'text',
                                            widths: ['50%', '50%'],
                                            labelLayout: 'horizontal',
                                            label: commonLang.width,
                                            id: 'width',
                                            setup: setupPopupParams,
                                            commit: commitPopupParamsLocalPage, //function (data) {
                                            //    if (targetTab == 'tbLocalPage') {
                                            //        return commitPopupParamsLocalPage;
                                            //    } 
                                            //}

                                        },
                                        {
                                            type: 'text',
                                            labelLayout: 'horizontal',
                                            widths: ['50%', '50%'],
                                            label: linkLang.popupLeft,
                                            id: 'left',
                                            setup: setupPopupParams,
                                            commit:commitPopupParamsLocalPage,// function (data) {
                                            //    if (targetTab == 'tbLocalPage') {
                                            //        return commitPopupParamsLocalPage;
                                            //    }
                                            //}

                                        }
                                    ]
                                },
                                {
                                    type: 'hbox',
                                    children: [
                                        {
                                            type: 'text',
                                            labelLayout: 'horizontal',
                                            widths: ['50%', '50%'],
                                            label: commonLang.height,
                                            id: 'height',
                                            setup: setupPopupParams,
                                            commit: commitPopupParamsLocalPage

                                        },
                                        {
                                            type: 'text',
                                            labelLayout: 'horizontal',
                                            label: linkLang.popupTop,
                                            widths: ['50%', '50%'],
                                            id: 'top',
                                            setup: setupPopupParams,
                                            commit: commitPopupParamsLocalPage

                                        }
                                    ]
                                }
                            ]
                        }
				    ]
				}
                            ]
                        },
                        {
                            // Definition of the Advanced Settings dialog window tab with its id, label and contents.
                            id: 'tbEmail',
                            label: 'Email',
                            elements:
                            [
                                {
                                    type: 'vbox',
                                    id: 'emailOptions',
                                    padding: 1,
                                    children: [
                                        {
                                            type: 'text',
                                            id: 'emailAddress',
                                            label: linkLang.emailAddress,
                                            required: true,
                                            validate:
                                                function () {
                                                    var currObj = CKEDITOR.dialog.getCurrent();
                                                    var currTab = currObj.definition.dialog._.currentTabId;
                                                    var dialog = CKEDITOR.dialog.getCurrent();
                                                    if (currTab == "tbEmail") {
                                                        //var dialog = this.getDialog();
                                                        //var emailValue = this.getDialog().getContentElement('tbEmail', 'emailAddress');
                                                        var emailValue = dialog.getValueOf("tbEmail", "emailAddress");
                                                        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
                                                        if (!emailReg.test(emailValue)) {
                                                            alert(commonLang.invalidValue);
                                                            return false;
                                                        }
                                                        //var func = CKEDITOR.dialog.validate.notEmpty(linkLang.noEmail);
                                                        //return func.apply(this);
                                                        return true;
                                                    }

                                                },
                                            setup: function (data) {
                                                if (data.email)
                                                    this.setValue(data.email.address);
                                                if (data.type == 'email')
                                                    this.select();
                                            },
                                            commit: function (data) {
                                                if (!data.email)
                                                    data.email = {};
                                                data.email.address = this.getValue();
                                            }
                                        },
                                        {
                                            type: 'text',
                                            id: 'emailSubject',
                                            label: linkLang.emailSubject,
                                            setup: function (data) {
                                                if (data.email)
                                                    this.setValue(data.email.subject);
                                            },
                                            commit: function (data) {
                                                if (!data.email)
                                                    data.email = {};

                                                data.email.subject = this.getValue();
                                            }
                                        },
                                        {
                                            type: 'textarea',
                                            id: 'emailBody',
                                            label: linkLang.emailBody,
                                            rows: 3,
                                            'default': '',
                                            setup: function (data) {
                                                if (data.email)
                                                    this.setValue(data.email.body);
                                            },
                                            commit: function (data) {
                                                if (!data.email)
                                                    data.email = {};

                                                data.email.body = this.getValue();
                                            }
                                        }
                                    ]
                                    ,
                                    setup: function (data) {
                                        this.getElement().show();
                                    }
                                }
                            ]
                        },
                        {
                            id: 'upload',
                            label: linkLang.upload,
                            title: linkLang.upload,
                            hidden: true,
                            filebrowser: 'uploadButton',
                            elements: [
                                {
                                    type: 'file',
                                    id: 'upload',
                                    label: commonLang.upload,
                                    style: 'height:40px',
                                    size: 29
                                },
                                {
                                    type: 'fileButton',
                                    id: 'uploadButton',
                                    label: commonLang.uploadSubmit,
                                    filebrowser: 'tbAnotherWeb:url',
                                    'for': ['upload', 'upload']
                                }
                            ]
                        }

                    ],
                    onShow: function () {
                        var editor = this.getParentEditor(),
                            selection = editor.getSelection(),
                            element = null;

                        // Fill in all the relevant fields if there's already one link selected.
                        if ((element = plugin.getSelectedLink(editor)) && element.hasAttribute('href')) {
                            selection.selectElement(element);
                            if (element.getAttribute('data-type') == "cmsLink") {
                                var dialog = CKEDITOR.dialog.getCurrent();
                                dialog.selectPage("tbLocalPage");
                            }
                        } else
                            element = null;

                        this.setupContent(parseLink.apply(this, [editor, element]));
                        

                    },
                    onOk: function () {
                        var currObj = CKEDITOR.dialog.getCurrent();
                        var currTab = currObj.definition.dialog._.currentTabId;
                        var attributes = {},
                            removeAttributes = [],
                            data = {},
                            me = this,
                            editor = this.getParentEditor();
                        this.commitContent(data);

                        // Compose the URL.

                        switch (currTab) {
                            // (data.type || 'url') {
                            case 'tbAnotherWeb':
                                var protocol = (data.url && data.url.protocol != undefined) ? data.url.protocol : 'http://',
                                    url = (data.url && CKEDITOR.tools.trim(data.url.url)) || '';
                                attributes['data-cke-saved-href'] = (url.indexOf('/') === 0) ? url : protocol + url;
                                attributes['data-type'] = 'anotherLink';
                                if (data.target.resizable == "") data.target.resizable = featureListWebAddress['resizable'];
                                if (data.target.width == "") data.target.width = featureListWebAddress['width'];
                                if (data.target.status == "") data.target.status = featureListWebAddress['status'];
                                if (data.target.location == "") data.target.location = featureListWebAddress['location'];
                                if (data.target.toolbar == "") data.target.toolbar = featureListWebAddress['toolbar'];
                                if (data.target.menubar == "") data.target.menubar = featureListWebAddress['menubar'];
                                if (data.target.fullscreen == "") data.target.fullscreen = featureListWebAddress['fullscreen'];
                                if (data.target.scrollbars == "") data.target.scrollbars = featureListWebAddress['scrollbars'];
                                if (data.target.dependent == "") data.target.dependent = featureListWebAddress['dependent'];
                                if (data.target.height == "") data.target.height = featureListWebAddress['height'];
                                if (data.target.left == "") data.target.left = featureListWebAddress['left'];
                                if (data.target.top == "") data.target.top = featureListWebAddress['top'];
                                break;
                            case 'tbLocalPage':
                                // edit by tuannh
                                var localPage = data.localPage;
                                attributes['data-cke-saved-href'] = data.localPage;
                                attributes['data-type'] = 'cmsLink';
                                break;
                                //case 'tbAnchor':
                                //    var name = (data.anchor && data.anchor.name),
                                //        id = (data.anchor && data.anchor.id);
                                //    attributes['data-cke-saved-href'] = '#' + (name || id || '');
                                //    attributes['data-type'] = 'anchorLink';
                                //    break;
                            case 'tbEmail':
                                var linkHref,
                                    email = data.email,
                                    address = email.address;

                                switch (emailProtection) {
                                    case '':
                                    case 'encode':
                                        {
                                            var subject = encodeURIComponent(email.subject || ''),
                                                body = encodeURIComponent(email.body || '');

                                            // Build the e-mail parameters first.
                                            var argList = [];
                                            subject && argList.push('subject=' + subject);
                                            body && argList.push('body=' + body);
                                            argList = argList.length ? '?' + argList.join('&') : '';
                                            attributes['data-type'] = 'emailLink';
                                            if (emailProtection == 'encode') {
                                                linkHref = ['javascript:void(location.href=\'mailto:\'+',
                                                    protectEmailAddressAsEncodedString(address)];
                                                // parameters are optional.
                                                argList && linkHref.push('+\'', escapeSingleQuote(argList), '\'');

                                                linkHref.push(')');
                                            } else
                                                linkHref = ['mailto:', address, argList];

                                            break;
                                        }
                                    default:
                                        {
                                            // Separating name and domain.
                                            attributes['data-type'] = 'emailLink';
                                            var nameAndDomain = address.split('@', 2);
                                            email.name = nameAndDomain[0];
                                            email.domain = nameAndDomain[1];

                                            linkHref = ['javascript:', protectEmailLinkAsFunction(email)];
                                        }
                                }

                                attributes['data-cke-saved-href'] = linkHref.join('');
                                break;
                        }

                        if (data.target) {
                            if (data.target.type == 'popup') {
                                var onclickList = ['window.open(this.href, \'',
                                                                                        data.target.name || '', '\', \''];
                                var featureList = ['resizable', 'status', 'location', 'toolbar', 'menubar', 'fullscreen',
                                                                                        'scrollbars', 'dependent'];
                                var featureLength = featureList.length;
                                var addFeature = function (featureName) {
                                    if (data.target[featureName])
                                        featureList.push(featureName + '=' + data.target[featureName]);
                                };

                                for (var i = 0; i < featureLength; i++)
                                    featureList[i] = featureList[i] + (data.target[featureList[i]] ? '=yes' : '=no');
                                addFeature('width');
                                addFeature('left');
                                addFeature('height');
                                addFeature('top');

                                onclickList.push(featureList.join(','), '\'); return false;');
                                attributes['data-cke-pa-onclick'] = onclickList.join('');

                                // Add the "target" attribute. (#5074)
                                removeAttributes.push('target');
                            } else {
                                if (multiTarget != 'notSet' && data.target.type == 'notSet') {
                                    attributes.target = multiTargetName;
                                } else {
                                    if (data.target.type != 'notSet' && data.target.name)
                                        attributes.target = data.target.name;
                                    else
                                        removeAttributes.push('target');
                                }

                                removeAttributes.push('data-cke-pa-onclick', 'onclick');
                            }
                        }
                        var selection = editor.getSelection();

                        // Browser need the "href" fro copy/paste link to work. (#6641)
                        attributes.href = attributes['data-cke-saved-href'];

                        if (!this._.selectedElement) {
                            var range = selection.getRanges(1)[0];

                            // Use link URL as text with a collapsed cursor.
                            if (range.collapsed) {
                                // Short mailto link text view (#5736).
                                var text = new CKEDITOR.dom.text(data.type == 'email' ? data.email.address : attributes['data-cke-saved-href'], editor.document);
                                range.insertNode(text);
                                range.selectNodeContents(text);
                            }

                            // Apply style.
                            var style = new CKEDITOR.style({ element: 'a', attributes: attributes });
                            style.type = CKEDITOR.STYLE_INLINE; // need to override... dunno why.
                            style.applyToRange(range);
                            range.select();
                        } else {
                            // We're only editing an existing link, so just overwrite the attributes.
                            var element = this._.selectedElement,
                                href = element.data('cke-saved-href'),
                                textView = element.getHtml();

                            element.setAttributes(attributes);
                            element.removeAttributes(removeAttributes);

                            if (data.adv && data.adv.advName && CKEDITOR.plugins.link.synAnchorSelector)
                                element.addClass(element.getChildCount() ? 'cke_anchor' : 'cke_anchor_empty');

                            // Update text view when user changes protocol (#4612).
                            if (href == textView || data.type == 'email' && textView.indexOf('@') != -1) {
                                // Short mailto link text view (#5736).
                                element.setHtml(data.type == 'email' ? data.email.address : attributes['data-cke-saved-href']);
                            }

                            selection.selectElement(element);
                            delete this._.selectedElement;
                        }
                    },
                    onLoad: function () {
                        var selection = editor.getSelection();
                        // Browser need the "href" fro copy/paste link to work. (#6641)

                        if (!editor.config.linkShowAdvancedTab)
                            this.hidePage('advanced'); //Hide Advanded tab.

                        if (!editor.config.linkShowTargetTab)
                            this.hidePage('target'); //Hide Target tab.

                    }//,
                    // Inital focus on 'url' field if link is of type URL.
                    //onFocus: function () {
                    //    var linkType = this.getContentElement('info', 'linkType'),
                    //        urlField;
                    //    if (linkType && linkType.getValue() == 'url') {
                    //        urlField = this.getContentElement('info', 'url');
                    //        urlField.select();
                    //    }
                    //}
                };
            });
        }
    });