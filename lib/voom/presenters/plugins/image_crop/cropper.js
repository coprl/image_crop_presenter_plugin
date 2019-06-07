class ImageCrop {
  constructor(element) {
    console.log('\tImageCrop');
    this.element = element;
    this.image = this.element.querySelector('img');
    this.dataSet = this.element.dataset;
    this.data = {};
    this.handleCropEnd = this.handleCropEnd.bind(this);
    this.setupCropOptions();
    this.setupCroppr();
  }

  setupCropOptions() {
    const opts = Object.assign({}, this.dataSet);
    delete opts.pluginCallback;

    const data = {};
    Object.keys(opts).forEach(function(k) {
      data[k] = Number(opts[k]) || opts[k];
    });
    this.cropprOptions = Object.assign({}, data, { onCropEnd: this.handleCropEnd });
  }

  setupCroppr() {
    if (typeof Croppr !== 'function') {
      return;
    }
    this.croppr = new Croppr(this.image, this.cropprOptions);
  }

  handleCropEnd(data) {
    this.data = data;
    // create and dispatch the change event
    var event = new Event('change', {bubbles: true, detail: data});
    this.element.dispatchEvent(event);
  }

  reset(){
    // Need to call destroy, allows cropper to undo changes it makes to the DOM
    this.croppr.destroy();
    // Then rebuild
    this.setupCroppr();
  }

  onShow(){
    this.reset();
  }

  // Called before the component is submitted via post/put. Allows the component to add its key/value pairs to the
  // submitted data.
  // If you provide this you need to add the v-input class to your DOM element to get called.
  // Containers iterate their elements that have the v-input class defined on them and invoke the prepareSubmit
  // function for each.
  prepareSubmit(params) {
    const keys = Object.keys(this.data);
    const data = this.data;
    keys.forEach(function(k) {
      params.push([k, data[k]]);
    });
  }

  // Called by a file_input to preview an image
  preview(result, acceptsMimeTypes, file) {
      var vCropper = this;
      this.image.onload = function(event){
          vCropper.reset();
      };
      this.image.src = result;
   }
}
