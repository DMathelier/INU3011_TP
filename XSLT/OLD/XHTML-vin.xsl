<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- L'instruction <xsl:output /> qui suit précise la forme de l'extrant désiré :
    - valide XHTML 1.0 Strict avec déclaration XML
    - indenté
    - encodé en UTF-8 -->
  <xsl:output method="xml" version="1.0" indent="yes" encoding="UTF-8"
    omit-xml-declaration="no" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <!-- Vous placez vos gabarits ici, en commençant par celui qui "match" votre
  élément de plus haut niveau. -->

  <xsl:template match="vin">
    <html>
      <head>
        <title><xsl:value-of select="nom"/></title>
      </head>
      <body>
        <div style="float:left; text-align:center; margin-right:1em; padding:1em;">
          <p style="border:thin black solid; padding:1em;">
            <xsl:choose>
              <xsl:when test="@photo = 'non'">
                Photo non<br/>disponible
              </xsl:when>
              <xsl:otherwise>
                <img src="../photos/{@codeSAQ}_is.jpg" alt="{@codeSAQ}"
                  style="height:260px; width: auto;"/>
              </xsl:otherwise>
            </xsl:choose>
            </p>
            <p style="font-size: small;"
              >SAQ # <xsl:value-of select="@codeSAQ"/></p>
        </div>
        <xsl:apply-templates select="*"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="création-ou-dern-modif">
    <p style="font-size: small; padding-top: 1.5em;">Dernière modification de cette fiche
      le <xsl:value-of select="@date"/> par <xsl:apply-templates select="*"/>.</p>
  </xsl:template>

  <xsl:template match="contributeur[1]"><xsl:value-of select="."/></xsl:template>

  <xsl:template match="contributeur"> et <xsl:value-of select="."/></xsl:template>
  
  <xsl:template match="nom">
    <h1><xsl:value-of select="."/></h1>
  </xsl:template>

  <xsl:template match="catégorie">
    <h2>
      <xsl:value-of select="."/>
    </h2>
  </xsl:template>

  <xsl:template match="données-numériques">
    <p><strong>Volume : </strong>
      <xsl:value-of select="@volume-ml"/> ml <br/><strong>Teneur en alcool : </strong>
      <xsl:value-of select="@alcool-pourcent"/>% <xsl:if test="@millésime"
          ><br/><strong>Année : </strong>
        <xsl:value-of select="@millésime"/></xsl:if></p>
  </xsl:template>

  <xsl:template match="provenance">
    <p>
      <strong>Provenance : </strong>
      <xsl:value-of select="pays"/>
      <xsl:apply-templates select="région"/>
    </p>
  </xsl:template>

  <xsl:template match="région"> (<xsl:value-of select="."/>)</xsl:template>

  <xsl:template match="appellation-contrôlée">
    <p>
      <em>
        <xsl:value-of select="."/>
      </em>
    </p>
  </xsl:template>

  <xsl:template match="producteur">
    <p>
      <strong>Producteur : </strong>
      <xsl:value-of select="."/>
    </p>
  </xsl:template>

  <xsl:template match="commentaires"><xsl:apply-templates select="*"/></xsl:template>

  <xsl:template match="para">
    <p><xsl:apply-templates /></p>
  </xsl:template>

  <xsl:template match="lien"><a href="{@codeSAQ}.xml"><xsl:value-of select="."/></a></xsl:template>

  <xsl:template match="em"><em><xsl:apply-templates /></em></xsl:template>

</xsl:stylesheet>
