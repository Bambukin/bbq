import PhotoSwipeLightbox from 'photoswipe/src/js/lightbox/lightbox'
import PhotoSwipe from 'photoswipe/src/js/photoswipe'

const lightbox = new PhotoSwipeLightbox({
    gallery: '#gallery--no-dynamic-import',
    children: 'a',
    pswpModule: PhotoSwipe
});

lightbox.init();
