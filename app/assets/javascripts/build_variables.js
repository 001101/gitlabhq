import $ from 'jquery';

export default function handleRevealVariables() {
  $('.js-reveal-variables')
    .off('click')
    .on('click', function click() {
      $('.js-build-variables').toggleClass('hidden');
      $(this).hide();
    });
}
