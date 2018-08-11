var XSLTproc = {};
Object.extend = function(O, extension) {
  for (var n in extension)
       O[n] = extension[n];
};
Object.extendType = function(Base, extension) {
   var base = Base.prototype;
   Object.extend(base, extension);
};
function abstract(){}

XSLTproc.prototype = abstract;

Object.extend(
    XSLTproc,
    {
       loadXMLDoc: function(dname)
       {
          var xhttp = new XMLHttpRequest();
          xhttp.open("GET", dname, false);
          xhttp.overrideMimeType("text/xml");
          xhttp.send("");
          return xhttp.responseXML;
        },
        displayResult: function(elementId, xmlName, xslName)
        {
            var xml = XSLTproc.loadXMLDoc(xmlName),
            xsl = XSLTproc.loadXMLDoc(xslName);

            var xsltProcessor = new XSLTProcessor();
            xsltProcessor.importStylesheet(xsl);
            resultDocument = xsltProcessor.transformToFragment(xml, document);
            document.getElementById(elementId).appendChild(resultDocument);
          }
      }
);

