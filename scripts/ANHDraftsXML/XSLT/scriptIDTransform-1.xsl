<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
   
   <xsl:mode on-no-match="shallow-copy"/>
    <!--2022-03-21 ebb: This is the first stage of an identity transformation stylesheet 
        for the DIGIT StarWars project to add scene numbers if they are missing,
    and to move <speaker> elements into attributes on <sp>. It outputs to the transform1 folder.
   
    A second XSLT stylesheet will search for 
    parentheses in <sp> elements to mark them as internal <sd>. We have to do this in a separate
    step after moving the <speaker> elements to attributes because analyze-string will preserve the 
    text of the speaker elements even if we remove the tags. 
    -->
    <xsl:variable name="starWarsColl" as="document-node()+" select="collection('../XMLdocuments')"/>
    <xsl:template match="/">
        <xsl:for-each select="$starWarsColl">
            <xsl:variable name="filename" as="xs:string" select="base-uri() ! tokenize(., '/')[last()]"/>
            <xsl:result-document method="xml" indent="yes" href="transform1/{$filename}">
                <xsl:apply-templates/>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="scene">
        <xsl:choose>
            <xsl:when test="@n">       
               <scene n="{@n}">
                   <xsl:apply-templates/>
               </scene>
            </xsl:when>
            <xsl:otherwise>
                <scene n="{count(preceding::scene) + 1}">
                    <xsl:apply-templates/>
                </scene>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="sp">
        <sp spk="{speaker}">
         <xsl:apply-templates/>
        </sp>
    </xsl:template>
    
    <xsl:template match="speaker"/>

 
</xsl:stylesheet>