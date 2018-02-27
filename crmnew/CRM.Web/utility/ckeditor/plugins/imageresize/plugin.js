/*
 * ImageResize Plugin for CKEditor (http://ckeditor.com/addon/imageresize)
 * Created by ALL-INKL.COM - Neue Medien M�nnich - 27. Jan 2014
 * Licensed under the terms of GPL, LGPL and MPL licenses.
 */
CKEDITOR.plugins.add("imageresize", {
    init : function(editor){
		
		/* Browser Support */
		if(!this.support()) return;
		
		/* Resize images on paste */
		var t = this;
		editor.on("instanceReady", function(){
			editor.document.on("paste", function(e){
				var parent = e.data.getTarget();
				if(!parent) parent = editor.document;
				window.setTimeout(function(){ t.resizeAll(editor, parent, 800, 800); }, 500);
				//window.setTimeout(function(){ t.resizeAll(editor, parent, 800, 800); }, 1000);
				//window.setTimeout(function(){ t.resizeAll(editor, parent, 800, 800); }, 1500);
			});
			editor.document.on("drop", function(e){
				var parent = e.data.getTarget();
				if(!parent) parent = editor.document;
				window.setTimeout(function(){ t.resizeAll(editor, parent, 400, 400); }, 500);
				//window.setTimeout(function(){ t.resizeAll(editor, parent, 800, 800); }, 1000);
				//window.setTimeout(function(){ t.resizeAll(editor, parent, 800, 800); }, 1500);
			});
		});
	},
	
	/*
	 * Resize all images in a node
	 * editor: CKEDITOR Instance
	 * parent: parent node
	 * width: (integer) max width of the image
	 * height: (integer) max height of the image
	 */
	resizeAll : function(editor, parent, width, height){
		
		/* Browser Support */
		if(!this.support()) return;
		
		/* Parent Node */
		if(!parent) parent = editor.document;
		if(!parent) return;
		
		/* Find images and resize */
		var img = parent.find("img"), w, h,s, item, index;
		console.log('full img',parent.find("img"));
		var l = img.count();
	    console.log(l);
		for(index = 0; index < l; index++) {
			item = img.getItem(index), w = 0, h = 0, s = "";
		    try {
		        w = item.$.width,
                h = item.$.height,
                s = item.getAttribute("src");
		    } catch (e)
		    {
		        w = 0, h = 0, s = "";
		    }
		    if (s.indexOf("data:") === 0 && (w > width || h > height)) {
		        $.ajax({
		            url: "admin/page/resizeimage",
		            data: { imgPath: "../../Claw/Userfiles/images/1280big.jpg", width:width, height:height },
		            type: "POST",
		            success: function(result) {
		                item.setAttribute("src", result.newPath);
		            }
		        });
		        //this.resize(editor, item, width, height);
		    }
		        
		}
		
	},
	
	/*
	 * Resize one image
	 * editor: CKEDITOR Instance
	 * imageElement: Image Node
	 * width: (integer) max width of the image
	 * height: (integer) max height of the image
	 */
	resize : function(editor, imageElement, width, height){
		
		/* Browser Support */
        if(!this.support() || !imageElement) return;
		
		/* Create image and set properties */
        var img = new Image(), ns = "ckeditorimageresize";
        img[ns] = {"n":imageElement, "w":width, "h":height};
		
		/* Error Function */
        img.onerror = function() { this[ns] = null; delete this[ns]; };
        img.onabort = function () { this[ns] = null; delete this[ns]; };
        img.quality = 80;
		
		/* Resize function when image is loaded */
        img.onload = function() {
			
			/* calculate width and height */
            if(this.width <= this[ns].w && this.height <= this[ns].h) return;
            if((this[ns].w / this[ns].h) > (this.width / this.height)) this[ns].w = this[ns].h * (this.width / this.height);
            else this[ns].h = Math.round(this[ns].w / (this.width / this.height));
			
			/* Create canvas and draw image with new width and height */
            var cv = document.createElement("canvas");
            cv.width = this[ns].w;
            cv.height = this[ns].h;
            cv.style.width = this[ns].w+"px";
            cv.style.height = this[ns].h+"px";
            var ct = cv.getContext("2d");
            ct.drawImage(this, 0, 0, this[ns].w, this[ns].h);
			
			/* Get base64 image source and update image node */
            if(this[ns].n) {
				this[ns].n.setAttribute("src", cv.toDataURL("image/png"));
				this[ns].n.setAttribute("width", this[ns].w);
				this[ns].n.setAttribute("height", this[ns].h);
				try {
					this[ns].n.$.style.width = this[ns].w+"px";
					this[ns].n.$.style.height = this[ns].h+"px";
				} catch(e) {}
				editor.getSelection().scrollIntoView();
			}
			
            this[ns] = cv = ct = null;
            delete this[ns];
        };
		
		/* Load image */
        img.src = imageElement.getAttribute("src");
		
	},
	
	/* Browser Support */
	supportResult : null,
	support : function(){
        if(this.supportResult === null) {
            this.supportResult = false;
            var cv = document.createElement("canvas");
            if(cv && cv.getContext && cv.toDataURL && cv.getContext("2d")) {
                var ct = cv.getContext("2d");
                if(ct && ct.getImageData && ct.putImageData) this.supportResult = true;
                ct = null;
            }
            cv = null;
        }
        return this.supportResult;
	}
	
});