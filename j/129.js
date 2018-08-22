function load(url, callback) {
  var S = document.createElement("script");
  S.type = "text/JavaScript";
  S.onload = function() {
     callback();
  };
  S.src = url;
  document.getElementsByTagName("head")[0].appendChild(S);
}
