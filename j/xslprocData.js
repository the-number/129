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
       loadTextDoc: function(dname)
       {
          var xhttp = new XMLHttpRequest();
          xhttp.open("GET", dname, false);
          xhttp.overrideMimeType("text/plain");
          xhttp.send("");
          return xhttp.responseText;
        },
        displayResult: function(elementId, xmlName, xslName)
        {
            var xml = XSLTproc.loadXMLDoc(xmlName),
            xsl = XSLTproc.loadXMLDoc(xslName);

            var xsltProcessor = new XSLTProcessor();
            xsltProcessor.importStylesheet(xsl);
            resultDocument = xsltProcessor.transformToFragment(xml, document);
            document.getElementById(elementId).appendChild(resultDocument);
          },
      displayData: function(elementId, textName)
        {
            var text = XSLTproc.loadTextDoc(textName),
            resultDocument = document.createElement("pre"),
            div = document.getElementById(elementId);
            resultDocument.appendChild(document.createTextNode(text));
            div.appendChild(resultDocument);
            div.addEventListener('click', function () { 
                div.style = "display : none;";
                alert('FOUR display:'+div.style.display) 
            }, false);
/*
<script>
 var button = document.getElementById('dataViewer');
// button.addEventListener('click', function () { alert('ONE') }, false);
// button.setAttribute('onclick', "alert('NOT CALLED')"); // event handler listener is registered here
// button.addEventListener('click', function () { alert('THREE') }, false);
// button.onclick = function () { alert('TWO'); };
 button.addEventListener('click', function () { 
          alert('FOUR display:'+button) }, false);
</script>
*/
        }
     }
);

