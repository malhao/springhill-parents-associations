

// --------------------------------------------------
// DOCUMENT READY
// --------------------------------------------------

$(document).ready(function($) {

    // RUN ACCORDION FUNCTION
    if (!boolAdminMode) {
        runTemplateAccordion('.template--accordion', '.template--accordion__title', '.template--accordion__container', 400);
    }

});

// --------------------------------------------------
// ACCORDION FUNCTION
// --------------------------------------------------

function runTemplateAccordion(strParentAccordionClass, strTitleAccordionClass, strContainerAccordionClass, intSpeed){
    var objAccordion = $(strParentAccordionClass);
    if (objAccordion.length < 1) return false;
    objAccordion.unbind('click');
    objAccordion.on('click', '> ' + strTitleAccordionClass, function(){
        var $this = $(this),
            $parent = $this.parent(strParentAccordionClass);
        $parent.siblings(strParentAccordionClass).removeClass('active').find(strContainerAccordionClass).slideUp(intSpeed);
        if ($parent.hasClass('active')){
            $parent.removeClass('active');
            $this.next(strContainerAccordionClass).stop().slideUp(intSpeed);
        } else {
            $parent.addClass('active');
            $this.next(strContainerAccordionClass).stop().slideDown(intSpeed);
            $this.next(strContainerAccordionClass).find('img[data-fill]').each(function() {
                resizeImage( $(this), $( $(this).attr('data-fill') ) );
                $(document).off('load', $(this));
            });
        }
    });
}
function runPreview() {
    // Functions for preview go here
}