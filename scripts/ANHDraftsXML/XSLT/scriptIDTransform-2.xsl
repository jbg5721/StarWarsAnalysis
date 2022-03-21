<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/>
    <!--2022-03-21 ebb: This is part two of the XSLT identity transformation, to apply 
    <xsl:analyze-string to the contents of the <sp> elements to replace stage cues
    in parentheses with <sd>. Run this over this files in the transform1 folder.  
    -->
    <xsl:variable name="transform1" as="document-node()+" select="collection('transform1')"/>
    <xsl:template match="/">
       <xsl:for-each select="$transform1"> 
           <xsl:variable name="filename" as="xs:string" select="base-uri() ! tokenize(., '/')[last()]"/>
        <xsl:result-document method="xml" indent="yes" href="../XMLtransformed/{$filename}">
            <xsl:apply-templates/>
        </xsl:result-document>
       </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="sp">
        <sp spk="{@spk}">
          <xsl:analyze-string select="." regex="\((.+?)\)">
              <xsl:matching-substring>
                  <sd><xsl:value-of select="regex-group(1)"/></sd>
              </xsl:matching-substring>
              <xsl:non-matching-substring>
                  <xsl:value-of select="."/>
              </xsl:non-matching-substring>
          </xsl:analyze-string>
        </sp>
    </xsl:template>

</xsl:stylesheet>