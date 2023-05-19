import PhotoSwipeLightbox from 'photoswipe/lightbox';

document.addEventListener('turbo:load', function (event) {
  const gallery = document.getElementById('my-gallery');

  if (gallery && !gallery.hasAttribute('data-transformed')) {
    const options = {
      gallery: '#my-gallery',
      children: '.pswp-gallery__item',
      pswpModule: () => import('photoswipe')
    };

    const lightbox = new PhotoSwipeLightbox(options);
    lightbox.on('uiRegister', function () {
      lightbox.pswp.ui.registerElement({
        name: 'custom-caption',
        order: 9,
        isButton: false,
        appendTo: 'root',
        html: 'Caption text',
        onInit: (el, pswp) => {
          lightbox.pswp.on('change', () => {
            const currSlideElement = lightbox.pswp.currSlide.data.element;
            let captionHTML = '';
            if (currSlideElement) {
              const hiddenCaption = currSlideElement.querySelector('.hidden-caption-content');
              if (hiddenCaption) {
                captionHTML = hiddenCaption.innerHTML;
              } else {
                captionHTML = currSlideElement.querySelector('img').getAttribute('alt');
              }
            }
            el.innerHTML = captionHTML || '';
          });
        }
      });
    });
    lightbox.init();
    gallery.setAttribute('data-transformed', true);
  }
});
