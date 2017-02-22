$(function() {
  function showCaptionFromAlt(selector){
    $(selector).each(function() {
      $(this).after( '<span class="img-caption">' + $(this).attr('alt') + '</span>' );
    });
  };
  
  // Captions are not automatically shown anymore by default; uncomment to reenable them
  //showCaptionFromAlt("article img");

    // Function, to added links from hiiden tables to code wrapper.
    // We used JS because codewrapper created on the docFX side
    function changeLinks(){
        // Create empty array for links from tables
        var linksArray = []
        // Take each table
        $('.table-condensed a[class="xref"]').each(function(){
            // Find link and take it options (name, href)
            var linkText = $(this).text();
            var linkHref = $(this).attr('href');
            // If link is no empty - create the object with options
            if(linkText.length > 0){
                var linkObj = {
                    textObj : linkText,
                    linkObj : linkHref
                }
                // Check whether there is an object in the array
                // (We transfromed all to string, because JS had specific logic for objects)
                if(JSON.stringify(linksArray).indexOf(JSON.stringify(linkObj)) < 0){
                    // If object doesn't exist add it to array
                    linksArray.push(linkObj)
                }
            }
        });
        // Take each code wrapper
        $('.codewrapper code').each(function(){
            // Take text from current code wrapper
            var codeText = $(this).html();
            // For all items of previous array
            for (var i = 0; i < linksArray.length; i++) {
                // Create pattern for current link
                var testPattern = new RegExp('\\b' + linksArray[i].textObj + '\\b', 'g');
                // If this link is exist in current code wrapper
                if(codeText.indexOf(linksArray[i].textObj) > 0){
                    // Create html tags for current link
                    var linkoutput = '<a class="xref" href="'+linksArray[i].linkObj+'">' + linksArray[i].textObj + '</a>'
                    // And replace it
                    var newCodeText = codeText.replace(testPattern, linkoutput);
                    // Set new html to current code wrapper
                    $(this).html(newCodeText);
                }
            }
        })

        // Then take each span in the each code to be sure that we don't missed anything
        // (I don't create universal function, because will create problem with active scopes etc)

        $('.codewrapper code span').each(function(){
            // Take text from current span insert code
            var codeText = $(this).html();
            // For all items of previous array
            for (var i = 0; i < linksArray.length; i++) {
                // Create pattern for current link
                var testPattern = new RegExp('\\b' + linksArray[i].textObj + '\\b', 'g');
                // If this link is exist in current cspan insert code
                if(codeText.indexOf(linksArray[i].textObj) > 0 && $('a', this).length <= 0){
                    // Create html tags for current link
                    var linkoutput = '<a class="xref" href="'+linksArray[i].linkObj+'">' + linksArray[i].textObj + '</a>'
                    // And replace it
                    var newCodeText = codeText.replace(testPattern, linkoutput);
                    // Set new html to current code wrapper
                    $(this).html(newCodeText);
                }
            }
        })
    }

    // If user on Class page, run function to change links
    if($('#summary').length > 0){
        changeLinks();
    }
});