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
    var results = {};
    var resultsAll = [];
    var resultsManual = [];
    var resultsApi = [];
    var resultsReleasenotes = [];
    hits.forEach(function(hit) {
      var item = searchData[hit.ref];
      if((item.href).toLowerCase().indexOf('manual') >= 0){
        resultsManual.push({'href': item.href, 'title': item.title, 'keywords': item.keywords});
      };
      if((item.href).toLowerCase().indexOf('api') >= 0){
        resultsApi.push({'href': item.href, 'title': item.title, 'keywords': item.keywords});
      };
      if((item.href).toLowerCase().indexOf('releasenotes') >= 0){
        resultsReleasenotes.push({'href': item.href, 'title': item.title, 'keywords': item.keywords});
      };
      resultsAll = resultsManual.concat(resultsApi, resultsReleasenotes)
    });
    results = {
      'all'          : resultsAll,
      'manual'       : resultsManual,
      'api'          : resultsApi,
      'releasenotes' : resultsReleasenotes
    }
    postMessage({e: 'query-ready', q: q, d: results});
  }
})();
