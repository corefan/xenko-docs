$(function() {
  function showCaptionFromAlt(selector){
    $(selector).each(function() {
      $(this).after( '<span class="img-caption">' + $(this).attr('alt') + '</span>' );
    });
  };
  
  // Captions are not automatically shown anymore by default; uncomment to reenable them
  //showCaptionFromAlt("article img");

  // Get links from table and set it to code wrapper
  $('.xk-hidden-table').each(function(){
    $(this).find('a.xref').each(function(){
      var variableLinkText = $(this).text();
      var variableLink = $(this).attr('href');
      var variableResult = '<a class="xref" href="' + variableLink + '">' + variableLinkText + '</a>';
      $('.codewrapper').each(function(){
        if($(this).html().indexOf(variableLinkText) > -1 && $(this).hasClass('xk-filled') != true){
          var variableCode = $(this).html().replace(variableLinkText, variableResult);
          $(this).html(variableCode);
          $(this).addClass('xk-filled')
        }
      });
    });
  });
});