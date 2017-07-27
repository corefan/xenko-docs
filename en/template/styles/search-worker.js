(function() {
  importScripts('lunr.min.js');
  var lunrIndex = lunr(function() {
      this.pipeline.remove(lunr.stopWordFilter);
      this.ref('href');
      this.field('title', {boost: 50});
      this.field('keywords', {boost: 20});
  });
  lunr.tokenizer.seperator = /[\s\-\.]+/;

  var stopWordsRequest = new XMLHttpRequest();
  stopWordsRequest.open('GET', '../search-stopwords.json');
  stopWordsRequest.onload = function() {
    if (this.status != 200) {
      return;
    }
    var stopWords = JSON.parse(this.responseText);
    var docfxStopWordFilter = lunr.generateStopWordFilter(stopWords);
    lunr.Pipeline.registerFunction(docfxStopWordFilter, 'docfxStopWordFilter');
    lunrIndex.pipeline.add(docfxStopWordFilter);
  }
  stopWordsRequest.send();

  var searchData = {};
  var searchDataRequest = new XMLHttpRequest();

  searchDataRequest.open('GET', '../index.json');
  searchDataRequest.onload = function() {
    if (this.status != 200) {
      return;
    }
    searchData = JSON.parse(this.responseText);
    for (var prop in searchData) {
      lunrIndex.add(searchData[prop]);
    }
    postMessage({e: 'index-ready'});
  }
  searchDataRequest.send();

  onmessage = function(oEvent) {
    var q = oEvent.data.q;
    var chapter = oEvent.data.chapter;
    var hits = lunrIndex.search(q);
    var results = [];
    hits.forEach(function(hit) {
      var item = searchData[hit.ref];
      if((item.href).toLowerCase().indexOf(chapter) >= 0){
        var trimedKeyWords = item.keywords.trim().substring(0, 200).split(" ").slice(0, -1).join(" ");
        results.push({'href': item.href, 'title': item.title, 'keywords': trimedKeyWords});
      };
    });
    postMessage({e: 'query-ready', q: q, d: results});
  }
})();
