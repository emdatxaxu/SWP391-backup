$(document).ready(function(){
    $('.product-cards').slick({
        slidesToShow: 10,
        slidesToScroll: 1,
        autoplay: true,
  autoplaySpeed: 3000,
  prevArrow:`<div class="swiper-button-prev" style="color: black;"></div>`,
  nextArrow:`<div class="swiper-button-next" style="color: black;"></div>`,
            responsive: [
                {
                  breakpoint: 1025,
                  settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    arrows:false,
                   
                  }
                },
                {
                  breakpoint: 600,
                  settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    arrows:false,
                  }
                },
                {
                  breakpoint: 480,
                  settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    arrows:false,
                  }
                }
                // You can unslick at a given breakpoint now by adding:
                // settings: "unslick"
                // instead of a settings object
              ] 
               
        });
  });