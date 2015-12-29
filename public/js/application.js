$(document).ready(function(){

$('.btn-warning').hover(function(){
    $(this).addClass('active');
    },
    function(){
    $(this).removeClass('active');
    });

var comma_separator_number_step = $.animateNumber.numberStepFactories.separator(',')
 $('#lines').animateNumber({
            number: 1531, //change value here
            numberStep: comma_separator_number_step
        }, 6000);

});