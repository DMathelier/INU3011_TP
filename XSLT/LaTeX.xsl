<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" indent="no" encoding="UTF-8" omit-xml-declaration="yes"/>

  <xsl:template match="/">\input{../travail/preamb3011}
    <xsl:apply-templates/> \end{document} 
  </xsl:template>

  <xsl:template match="text()[normalize-space(.) = '']"/>

  <xsl:template match="miroir"> {\bf \huge Code d’identification : <xsl:value-of select="@ID"/>} \\
    \newline \hr \begin{center} <xsl:choose>
      <xsl:when test="@photo">
        \image{../photos/<xsl:value-of select="/*/@ID"/>.jpg}
      </xsl:when>
      <xsl:otherwise>Photo non disponible</xsl:otherwise>
    </xsl:choose> 
    \end{center} <xsl:apply-templates select="*"/>
  </xsl:template>

  <xsl:template match="suiviModif">
    <xsl:apply-templates select="création"/>
    <xsl:apply-templates select="modification"/>
  </xsl:template>

  <xsl:template match="création">
    {\bf \large Date de création de la fiche :} <xsl:value-of select="@date"/>
    {par <xsl:value-of select="contributeur"/>} </xsl:template>

  <xsl:template match="modification">
    \\ {\bf \large Date de modification de la fiche :} <xsl:value-of select="@date"/>
    {par <xsl:value-of select="contributeur"/>} \\</xsl:template>

  <xsl:template match="aspect"> \\ \hr 
    \section* {Aspect} 
    {\bf \large Couleur :} <xsl:value-of select="@couleur"/>
    \\ \\ {\bf \large Forme :} <xsl:value-of select="@forme"/>
    <xsl:apply-templates select="style"/>
    <xsl:apply-templates select="cadre"/>
  </xsl:template>

  <xsl:template match="style"> 
    \\ \\ {\bf \large Style :} <xsl:apply-templates/>
    <xsl:choose>
      <xsl:when test="@époque">
        {\bf \large Époque :} <xsl:value-of select="@époque"/>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="cadre"> 
    \\ \\ {\bf \large Cadre :} <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="mesures"> 
    \section* {Mesures}
    <xsl:apply-templates select="hauteur"/>
    <xsl:apply-templates select="largeur"/>
    <xsl:apply-templates select="profondeur"/>
    <xsl:apply-templates select="poids"/>
  </xsl:template>

  <xsl:template match="hauteur"> {\bf \large Hauteur :} <xsl:value-of select="."/> cm \\ \\
  </xsl:template> 

  <xsl:template match="largeur"> {\bf \large Largeur :} <xsl:value-of select="."/> cm \\ \\
  </xsl:template>

  <xsl:template match="profondeur"> {\bf \large Profondeur :} <xsl:value-of select="."/> cm \\ \\
  </xsl:template>

  <xsl:template match="poids"> {\bf \large Poids :} <xsl:value-of select="."/> kg
  </xsl:template>

  <xsl:template match="origine">
    \section* {Origine} 
    {\bf \large Date d’acquisition :} <xsl:value-of select="@dateAcquisition"/> \\ \\
    {\bf \large Moyen d’acquisition :} <xsl:value-of select="@moyenAcquisition"/> \\ \\
    <xsl:choose>
      <xsl:when test="@prixAchatEuros"> {\bf \large Prix d’achat :}
        <xsl:value-of select="@prixAchatEuros"/> € 
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
    <xsl:apply-templates select="commentaire"/>
  </xsl:template>

  <xsl:template match="commentaire">
    \subsection* {Commentaire}
    <xsl:apply-templates select="*"/>
  </xsl:template>

  <xsl:template match="valeur">
    \section* {Valeur actuelle}
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="usage">
    \section* {Usage attendu}
    <xsl:apply-templates select="*"/>
  </xsl:template>

  <xsl:template match="para">
    <xsl:text> </xsl:text>
    <xsl:apply-templates/>
    <xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="em">
    {\em {<xsl:apply-templates/>}}
  </xsl:template>

  <xsl:template match="sup">
    {\up {<xsl:apply-templates/>}}
  </xsl:template>

  <xsl:template match="lienInterne">
    \href{<xsl:value-of select="@ID"/>.xml}{<xsl:value-of select="."/>}
  </xsl:template>

  <xsl:template match="lienExterne">
    \href{<xsl:value-of select="@URL"/>}{<xsl:value-of select="."/>}
  </xsl:template>

</xsl:stylesheet>