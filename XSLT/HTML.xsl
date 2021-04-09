<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- L’instruction <xsl:output /> qui suit précise la forme de l’extrant désiré :
    - HTML5
    - indenté
    - encodé en UTF-8 -->
  <xsl:output method="html" version="5" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <!-- Vous placez vos gabarits ci-dessous, en commençant par celui qui "match" votre
élément de plus haut niveau (EPHN), dont le contenu formera l’infrastructure
HTML principale de vos extrants HTML.

LE GABARIT CI-DESSOUS N’EST QU’UN EXEMPLE ET DOIT ÊTRE MODIFIÉ.
Notamment et entre autres, "EPHN" doit être remplacé par le nom de l’élément de plus haut
niveau de VOTRE modèle. Vous devrez ensuite ajouter les autres gabarits requis, selon la
conception de votre transformation.
-->
  <xsl:template match="miroir">
    <html>
      <head>
        <title>
          <xsl:value-of select="@ID"/>
        </title>
      </head>
      <body>
        <h1>
          <xsl:value-of select="@ID"/> <!-- titre du miroir = son identifiant 
            mais du coup c'est pas très joli comme titre de fiche... -->
        </h1>
        <div>
          <p>
            <xsl:choose>
              <!-- Photo ou non -->
              <xsl:when test="@photo = 'oui'">
                <!-- quand l'attribut photo est renseigné -->
                <img src="../photos/{@ID}_is.jpg" alt="{@ID}" style="height:260px; width: auto;"/>
              </xsl:when>
              <xsl:otherwise> Photo indisponible </xsl:otherwise>
            </xsl:choose>
          </p>
        </div>
        <xsl:apply-templates select="*"/>
      </body>
    </html>
  </xsl:template>

  <!-- Dans le gabarit vierge du prof et les exos du cours, le h1 est après body. 
    Mais dans l'exemple Vins, il n'est pas indiqué dans le body mais renseigné avec l'instruction 
    suivante. Je ne comprends pas bien la différence entre les deux -->
  
  <!-- <xsl:template match="@ID"> 
    <h1><xsl:value-of select="."/></h1>  
  </xsl:template> -->

  <xsl:template match="suiviModif"> 
  </xsl:template>
  
  <xsl:template match="création"> <!-- + paramétrage @date -->
  </xsl:template>
  
  <xsl:template match="modification"> <!-- + paramétrage @date -->
  </xsl:template>
  
  <xsl:template match="contributeur"> 
  </xsl:template>

  <xsl:template match="aspect"> <!-- + paramétrage @couleur et @forme -->
  </xsl:template>
  
  <xsl:template match="style"> <!-- + paramétrage @époque -->
  </xsl:template>

  <xsl:template match="cadre"> 
  </xsl:template>
  
  <xsl:template match="mesures">
    <p>
      <strong>Mesures</strong>
      <xsl:apply-templates select="hauteur"/>
      <xsl:apply-templates select="largeur"/>
      <xsl:apply-templates select="profondeur"/>
      <xsl:apply-templates select="poids"/>
    </p>
  </xsl:template>
  
  <xsl:template match="hauteur">
    <p>
      <strong>Hauteur : </strong>
      <xsl:value-of select="."/> cm
    </p>
  </xsl:template>
  
  <xsl:template match="largeur">
    <p>
      <strong>Largeur : </strong>
      <xsl:value-of select="."/> cm
    </p>
  </xsl:template>
  
  <xsl:template match="profondeur">
    <p>
      <strong>Profondeur : </strong>
      <xsl:value-of select="."/> cm
    </p>
  </xsl:template>
  
  <xsl:template match="poids">
    <p>
      <strong>Poids : </strong>
      <xsl:value-of select="."/> kg
    </p>
  </xsl:template>
  
  <xsl:template match="origine"> <!-- + paramétrage @dateAcquisition, @moyenAcquisition et @prixAchatEuros -->
  </xsl:template>
  
  <xsl:template match="commentaire"> 
  </xsl:template>
  
  <xsl:template match="valeur"> 
  </xsl:template>
  
  <xsl:template match="usage"> 
  </xsl:template>
  
  <xsl:template match="para"> 
  </xsl:template>
  
  <xsl:template match="em"> 
  </xsl:template>
  
  <xsl:template match="lienInterne">  <!-- + paramétrage @ID -->
  </xsl:template>
  
  <xsl:template match="lienExterne"> <!-- + paramétrage @URL -->
  </xsl:template>
  
  

</xsl:stylesheet>
