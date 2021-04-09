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
          <xsl:value-of select="@ID"/>
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
  
  <xsl:template match="création"> 
  </xsl:template>
  
  <xsl:template match="modification"> 
  </xsl:template>
  
  <xsl:template match="contributeur"> 
  </xsl:template>

  <xsl:template match="aspect"> 
  </xsl:template>
  
  <xsl:template match="style"> 
  </xsl:template>

  <xsl:template match="cadre"> 
  </xsl:template>
  
  <xsl:template match="mesures"> 
  </xsl:template>
  
  <xsl:template match="hauteur"> 
  </xsl:template>
  
  <xsl:template match="largeur"> 
  </xsl:template>
  
  <xsl:template match="profondeur"> 
  </xsl:template>
  
  <xsl:template match="poids"> 
  </xsl:template>
  
  <xsl:template match="origine"> 
  </xsl:template>
  
  <xsl:template match="commentaire"> 
  </xsl:template>
  
  <xsl:template match="valeur"> 
  </xsl:template>
  
  <xsl:template match="usage"> 
  </xsl:template>

</xsl:stylesheet>
