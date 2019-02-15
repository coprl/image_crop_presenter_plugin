class ImageCrop {
  constructor(element) {
    console.log("\tImageCrop");
    this.element = element;
    this.image = this.element.querySelector('img');
    this.handleCropEnd = this.handleCropEnd.bind(this);
    this.data = JSON.parse(element.dataset.cropData);
    this.setupCroppr();
  }

  setupCroppr() {
    if (typeof Croppr !== 'function') {
      return;
    }

    this.croppr = new Croppr(this.image, {
      onCropEnd: this.handleCropEnd,
    });
  }

  handleCropEnd(data) {
    this.data = data;
    // create and dispatch the change event
    var event = new Event("change", { bubbles: true, detail: data });
    this.element.dispatchEvent(event);
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
  preview(result, acceptsMimeTypes, file){
    this.croppr.setImage(result);
  }

  // optional.
  // Called whenever a container is about to be submitted, before prepareSubmit.
  // returns true on success
  // returns on failure return an error object that can be processed by VErrors:
  //    { email: ["email must be filled", "email must be from your domain"] }
  //    { page:  ["must be filled"] }
  // Returning an error stops the submission.
  // validate(formData) {
  //   return true;
  // }

  // optional.
  // Clear's the control
  // clear() {
  // }
}
