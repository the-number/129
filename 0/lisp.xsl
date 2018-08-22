<?xml version="1.0"
          encoding="ISO-8859-1" ?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:output method="html" indent="yes" version="5.0"/>

<!-- BEGIN SYNTAX VALIDATION
      END SYNTAX VALIDATION -->
<!-- Begin Marked for deletion -->
<!-- End Marked for deletion -->

 <xsl:template match="/">

<!-- Begin scripts -->

<script>
<![CDATA[
miniMAL=function(r){
  function n(n,t,i)
  {
    if(i)
    {
      t=Object.create(t);
      for(var u=0;n.length>u;u++)
      {
        if("&"==n[u])
        {
          t[n[u+1]]=Array.prototype.slice.call(i,u);
          break
        }
        t[n[u]]=i[u]
      }
      return t
    }
    return Array.isArray(n)?
     n.map(function(r)
       {
         return e(r,t)
       })
     :"string"==typeof n?
       n in t?
         t[n]
         :r.throw(n+" not found")
       :n
  }

  function t(r,n)
  {
    for(;Array.isArray(r)&&
       "string"==typeof r[0]&&
       r[0]in n&&
       n[r[0]].ast&&
       n[r[0]].ast[3];)
      r=n[r[0]].apply(n[r[0]],r.slice(1));
    return r
  }

  function e(r,i)
  { // open brace gamma
    for(;;)
    { // open brace beta
      if(!Array.isArray(r))
        return n(r,i);
      if(r=t(r,i),!Array.isArray(r))
        return r;
      if("def"==r[0])
        return i[r[1]]=e(r[2],i);
      if("~"==r[0])
      {
        var u=e(r[1],i);
        return u.ast.push(1),u
      }
      if("let"==r[0])
      {
        i=Object.create(i);
        for(var f in r[1])
          f%2 && (i[r[1][f-1]]=e(r[1][f],i));
        r=r[2]
      }
      else
      { // open brace alpha
       if("`"==r[0])
         return r[1];
       if(".-"==r[0])
       {
        var a=n(r.slice(1),i),c=a[0][a[1]];
        return 2 in a?a[0][a[1]]=a[2]:c
       }
       if("."==r[0])
       {
         var a=n(r.slice(1),i),c=a[0][a[1]];
         return c.apply(a[0],a.slice(2))
       }

       if("try"==r[0])
         try
         {
           return e(r[1],i)
         }
         catch(s)
         {
           return e(r[2][2],n([r[2][1]],i,[s]))
         }
       else 
         if("do"==r[0])
         {
           var a=n(r.slice(1,r.length-1),i);
           r=r[r.length-1]
         }
         else
           if("if"==r[0])
             r=e(r[1],i)?r[2]:r[3];
           else
           {
             if("fn"==r[0])
             {
               var u=function()
               {
                 return e(r[2],n(r[1],i,arguments))
               };
               return u.ast=[r[2],i,r[1]],
                 u
             }
             var a=n(r,i),
               u=a[0];
             if(!u.ast)
               return u.apply(u,a.slice(1));
             r=u.ast[0],
               i=n(u.ast[2],u.ast[1],a.slice(1))
           }
      } // close brace alpha
    }  // close brace beta
  }   // close brace gamma

  return r=Object.create(r||this),
    r.js=eval,
    r.eval=function(n){return e(n,r)},
    r["="]=function(r,n){return r===n},
    r["<"]=function(r,n){return n>r},
    r["+"]=function(r,n){return r+n},
    r["-"]=function(r,n){return r-n},
    r["*"]=function(r,n){return r*n},
    r["/"]=function(r,n){return r/n},
    r["%"]=function(r,n){return r%n},
    r.isa=function(r,n){return r instanceof n},
    r.new=function(r){return new(r.bind.apply(r,arguments))},
    r.del=function(r,n){return delete r[n]},
    r.throw=function(r){throw r},
    r.rep=function(n){return JSON.stringify(e(JSON.parse(n),r))},
    r
} // miniMAL
]]>
</script>

<script>
<![CDATA[
var m=miniMAL();
var lisp=function(id,text)
{
//  document.write("<hr/><p>The <em>");
//  document.write(id);
//  document.write("</p><pre>");
  document.write("<pre>");
  document.write(JSON.stringify(text));
//  document.write(JSON.stringify(text,null," "));
  document.write("</pre><p>==&gt;&nbsp;<em>");
  document.write(m.eval(     text    ));
  document.write("</em></p>");
}
]]>
</script>

<script>
<![CDATA[
mini_try='minimal Try';
]]>
</script>

<!-- End scripts -->

<!-- Preamble - what about this -->

 <h2>Styled with XSLT</h2>

<ol>
 <li>
  <p>
   Edit the
   <a href="lisp.xml" type="text/plain" target="edit">
     data file,
   </a>
   instructions are within.
  </p>
 </li>

</ol>

<hr/>
<p>
And now the list of lists and their scripts
</p>

<!-- Preamble END -->

 <table
      style="cell-border: 2px; background-color: #aabbaa;"
      border="2"
      width="84%">
<tr>
   <th width="45%">
    The text
   </th>
   <th width="45%">
     The return
   </th>
   <th width="5%">
    Retain
   </th>
   <th width="5%">
    Valid
   </th>
</tr>

   <xsl:apply-templates />



 </table>

 <div class="license" style="background: #eee">
   <p>
     examples only
   </p>


<!-- end-copyright -->

</div>

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

<!-- a different approach to the script -->

<xsl:template
  match="ecmascript_in">
  <tr>
    <td>
     ecmascript with include
     <pre><xsl:value-of select="." /></pre>
    </td>

    <td><script language="javascript" src="mini_in.js"></script>
       <![CDATA[==>]]><script language="javascript">
       <![CDATA[document.write(]]>
        <xsl:value-of select="." />
       <![CDATA[)&amp;]]>
     </script>
    </td>

  </tr>
</xsl:template>

<!-- script -->

<xsl:template
  match="script">
  <tr>
    <td>
     script
     <pre><xsl:value-of select="." /></pre>
    </td>

    <td><![CDATA[==>]]><script language="javascript">
        <xsl:value-of select="." />
     </script>
    </td>

  </tr>
</xsl:template>

<!-- lisp -->

<xsl:template
  match="lisp">
  <tr>
    <td>
     lisp
     <pre><xsl:value-of select="." /></pre>
    </td>

    <td><![CDATA[==>]]><script language="javascript">
       <![CDATA[document.write(
           m.eval(]]>

        <xsl:value-of select="." />

       <![CDATA[))&amp;]]>
     </script>

    </td>

  </tr>
</xsl:template>


<!-- lisp on the range -->

<xsl:template
  match="lisprange">
  <tr>
    <td>
     lisp on the range, TODO
     (<xsl:value-of select="@range" />)
     <pre><xsl:value-of select="." /></pre>
    </td>

    <td><![CDATA[==>]]><script language="javascript">
       <![CDATA[(]]>

       TODO
       <!-- <xsl:value-of select="." /> -->

       <![CDATA[)&amp;]]>
     </script>

    </td>

  </tr>
</xsl:template>

<!-- example factorial calculation -->

<xsl:template name="factorial">
  <xsl:param name="n" select="1"/>
  <xsl:variable name="sum">
    <xsl:if test="$n = 1"> 1 </xsl:if>
    <xsl:if test="$n != 1">
       <xsl:call-template name="factorial">
         <xsl:with-param name="n" select="$n - 1"/>
       </xsl:call-template>
    </xsl:if>
  </xsl:variable>
  <xsl:value-of select="$sum * $n"/>
</xsl:template>

<!-- fact -->

<xsl:template
  match="fact">
  <tr>

    <td>
     TODO
     <pre>&lt;factorial n=<xsl:value-of select="@n" />&gt;</pre>

    </td>

    <td>
      TODO 
      <pre><![CDATA[==>]]><xsl:call-template name="factorial">
            <xsl:with-param name="n" 
              select="@n" />
          </xsl:call-template>
       </pre>
    </td>

  </tr>
</xsl:template>

</xsl:stylesheet>
