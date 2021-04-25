<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- L'instruction <xsl:output /> qui suit précise la forme de l'extrant désiré :
    - format texte
    - encodé en UTF-8
    - sans déclaration XML -->
  <xsl:output
    method="text"
    indent="no" 
    encoding="UTF-8" 
    omit-xml-declaration="yes" />

  <xsl:template match="/">\input{../travail/preamb3011}
    <xsl:apply-templates />
\end{document}
  </xsl:template>

  <!-- Le gabarit suivant évite souvent bien des problèmes, à n'enlever que sur recommandation du
    professeur. -->
  <xsl:template match="text()[normalize-space(.) = '']" />

  <!-- Vous placez vos autres gabarits ici, en commençant par celui qui "match" votre
  élément de plus haut niveau. -->

  <xsl:template match="vin"><xsl:apply-templates select="*"/></xsl:template>

  <xsl:template match="création-ou-dern-modif">\date{Dernière modification de cette fiche
    le <xsl:value-of select="@date"/>}
<xsl:apply-templates select="*"/></xsl:template>
  
  <xsl:template match="contributeur[1]">\author{<xsl:value-of select="."/>
</xsl:template>
  
  <xsl:template match="contributeur">\and
<xsl:value-of select="."/></xsl:template>
  
  <xsl:template match="nom">}
\title{<xsl:value-of select="."/>}
\maketitle

\begin{center}
<xsl:choose>
  <xsl:when test="/*/@photo = 'non'">Photo non disponible</xsl:when>
  <xsl:otherwise>\image{../photos/<xsl:value-of select="/*/@codeSAQ"/>_is.jpg}</xsl:otherwise>
</xsl:choose>

SAQ # <xsl:value-of select="/*/@codeSAQ"/>

\end{center}

\hr

</xsl:template>
  
  <xsl:template match="catégorie">\section*{<xsl:value-of select="."/>}
</xsl:template>
  
  <xsl:template match="données-numériques">
{\bf \large Volume :}
      <xsl:value-of select="@volume-ml"/> ml \\
{\bf \large Teneur en alcool :}
      <xsl:value-of select="@alcool-pourcent"/>%
    <xsl:if test="@millésime">\\
{\bf \large Année :}
        <xsl:value-of select="@millésime"/></xsl:if>
  </xsl:template>
  
  <xsl:template match="provenance">

{\bf \large Provenance :}
      <xsl:value-of select="pays"/>
      <xsl:apply-templates select="région"/>
  </xsl:template>
  
  <xsl:template match="région"> (<xsl:value-of select="."/>)</xsl:template>
  
  <xsl:template match="appellation-contrôlée">

{\em <xsl:value-of select="."/>}

  </xsl:template>
  
  <xsl:template match="producteur">

{\bf \large Producteur :} <xsl:value-of select="."/>

  </xsl:template>
  
  <xsl:template match="commentaires"><xsl:apply-templates select="*"/></xsl:template>
  
  <xsl:template match="para">
<xsl:text>

</xsl:text>
    <xsl:apply-templates />
<xsl:text>

</xsl:text>
  </xsl:template>
  
  <xsl:template match="lien">{\em <xsl:value-of select="."/>}</xsl:template>
  
  <xsl:template match="em">{\em <xsl:apply-templates />}</xsl:template>

</xsl:stylesheet>
