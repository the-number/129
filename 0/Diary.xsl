<?xml version="1.0"
  encoding="utf-8" ?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:output method="html" indent="yes" version="5.0"/>

 <xsl:template match="/">
    <head><title>Maths Notes</title>

<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    extensions: ["tex2jax.js"],
    jax: ["input/TeX","output/HTML-CSS"],
    tex2jax: {inlineMath: [["$","$"],["\\(","\\)"]]}
  });
</script>

<script type="text/javascript">
window.onload = function () {
  setTimeout(function () {
    var script = document.createElement("script");
    script.prefix="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/";
    script.type = "text/javascript";
    script.src  = script.prefix + "MathJax.js?config=TeX-AMS-MML_HTMLorMML";
    document.getElementsByTagName("head")[0].appendChild(script);
  },500)
}
</script>
    </head>

    <body>
     <h1>Today</h1>
<!--  ======== Comment = alternative simple transform ======
<html xsl:version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      lang="en">
    <head>
        <title>Notes</title>
    </head>

</html>
================== END of Comment ============== -->

<xsl:for-each select="notes/note">
 <xsl:apply-templates />
</xsl:for-each>
    </body>

</xsl:template>

<xsl:template match="code">
 <div style="background: #aabbaa; width: 93%; ">
  <pre>
   <xsl:value-of select="."/>
  </pre>
 </div>
</xsl:template>

<xsl:template match="title">
   <h2><xsl:attribute name="style">background-color : #dcdddd</xsl:attribute>
          <xsl:value-of select="."/></h2>
</xsl:template>

<xsl:template match="para">
   <p style="width:80%"><xsl:apply-templates /></p>
</xsl:template>

<xsl:template match="sequence">
<div><xsl:attribute name="style">background-color : #dfdddd</xsl:attribute>
   <p><dfn>[<em><xsl:value-of select="dfn"/></em>] </dfn>
   <xsl:value-of select="para"/></p>
<ol>
<xsl:for-each select="ol/li">
<li>
 <xsl:apply-templates />
</li>
</xsl:for-each>
</ol>
</div>
</xsl:template>

<xsl:template match="algorithm">
<div><xsl:attribute name="style">background-color : #eceeee</xsl:attribute>
   <p>Algorithm <xsl:value-of select="@id"/>.
   <dfn>[<em><xsl:value-of select="dfn"/></em>] </dfn>
   <xsl:value-of select="para"/></p>
<ol>
<xsl:for-each select="ol/li">
<li>
 <xsl:apply-templates />
</li>
</xsl:for-each>
</ol>
</div>
</xsl:template>

<xsl:template match="li">
   <li> <xsl:apply-templates /><!-- <xsl:value-of select="."/> --></li>
</xsl:template>

<xsl:template match="ol">
   <ol> <xsl:apply-templates /></ol>
</xsl:template>

<!--  -->
<xsl:template match="a">
   <a>
     <xsl:attribute name="href">
        <xsl:value-of select="@href" />
     </xsl:attribute>
     <xsl:attribute name="target">
       docViewer
     </xsl:attribute>
     <xsl:value-of select="."/>
   </a>
</xsl:template>
<!-- -->

<!-- Experimental templates for maths display -->

<xsl:template match="table">
  <table><xsl:apply-templates /></table>
</xsl:template>

<xsl:template match="tr">
   <tr width="30%"><xsl:apply-templates /></tr>
</xsl:template>

<xsl:template match="td">
    <td><xsl:apply-templates /></td>   <!-- <xsl:value-of select="."/> -->
</xsl:template>


<!-- ecmascript within an envelope -->

<xsl:template
  match="ecmascript">
  <tr>
    <td>
     ecmascript
     <pre><xsl:value-of select="." /></pre>
    </td>

    <td><![CDATA[==>]]><script language="javascript">
       <![CDATA[document.write(]]>
        <xsl:value-of select="." />
       <![CDATA[)&amp;]]>
     </script>
    </td>

  </tr>
</xsl:template>


<!-- writing HTML literally -->

<xsl:template
  match="literal">
   <xsl:value-of select="."/>
</xsl:template>

<!-- The TeX-book proclaim thing -->

<xsl:template
  match="proclaim">
  <p><b>
   <xsl:choose>
     <xsl:when test="@type">
          <xsl:value-of select="@type"/>
     </xsl:when>
     <xsl:otherwise>
          Theorem
     </xsl:otherwise>
   </xsl:choose>
  </b>
  <i><xsl:value-of select="."/></i></p>
</xsl:template>

<xsl:template
  match="theorem">
   <p><b><xsl:text>Theorem</xsl:text></b>
   <xsl:value-of select="."/></p>
</xsl:template>

<!-- a formula, in three columns: left right eqno -->

<!-- Using XML, XSLT,HTML to display a formula. This needs work

<xsl:template
  match="literal">
   <xsl:value-of select="."/>
</xsl:template>

<xsl:template
  match="formulat">
  <table width="95%"><tr>
    <td style="width:50%; valign:right;"><xsl:value-of select="./left" />
    </td>
    <td style="width:40%"><xsl:value-of select="./right" />
    </td>
    <td style="width:5%; valign:right;"><xsl:value-of select="./eqno" />
    </td>
  </tr></table>
</xsl:template>

<xsl:template
  match="br">
   <br/>
</xsl:template>

<xsl:template
  match="left">
   <xsl:apply-templates />
</xsl:template>

<xsl:template
  match="right">
   <xsl:apply-templates />
</xsl:template>

<xsl:template
  match="eqno">
   <xsl:apply-templates />
</xsl:template>
  END todo, -->

</xsl:stylesheet>
