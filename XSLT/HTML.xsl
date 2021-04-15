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

  <xsl:template match="miroir">
    <html>
      <head>
        <title><xsl:value-of select="@ID"/></title>
        <link rel="stylesheet" href="../fichiers-aux-HTML/style.css" type="text/css"/> 
      </head>
      <body>
        <h1>Catalogue de miroirs de la collection privée de Narcisse Brillant</h1>
        <hr/>
        <h2> Code d’identification :
          <xsl:value-of select="@ID"/> <!-- titre du miroir = son identifiant 
            mais du coup c'est pas très joli comme titre de fiche... -->
        </h2>
        <div style="float:right; text-align:center; margin-right:1em; padding:1em;">
          <p>
            <xsl:choose>
              <!-- Photo ou non -->
              <xsl:when test="@photo = 'oui'">
                <!-- quand l'attribut photo est renseigné -->
                <img src="../photos/{@ID}.jpg" alt="{@ID}" style="height:75%; width: auto;"/>
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
    <ul>
    <xsl:apply-templates select="création"/>
    <xsl:apply-templates select="modification"/>
    </ul>
  </xsl:template>
  
  <xsl:template match="création"> <!-- + paramétrage @date -->
    <li style="font-size: small;"> <strong>Date de création de la fiche : </strong> 
      <xsl:value-of select="@date"/> ; <strong>créateur : </strong> <xsl:value-of select="contributeur"/> </li>
  </xsl:template>
  
  <xsl:template match="modification"> <!-- + paramétrage @date -->
    <li style="font-size: small;"> <strong>Date de modification de la fiche : </strong> 
      <xsl:value-of select="@date"/> ; <strong>contributeur : </strong> <xsl:value-of select="contributeur"/> </li>
  </xsl:template>
  
  <!--<xsl:template match="contributeur"> 
  </xsl:template>-->

  <xsl:template match="aspect"> <!-- + paramétrage @couleur et @forme -->
    <div>
      <h2>Aspect</h2>
      <p> <strong>Couleur</strong> : <xsl:value-of select="@couleur"/></p>
      <p> <strong>Forme</strong> : <xsl:value-of select="@forme"/></p>
      <xsl:apply-templates select="style"/>
      <xsl:apply-templates select="cadre"/>
    </div>
  </xsl:template>
  
  <xsl:template match="style"> <!-- + paramétrage @époque -->
    <p><strong>Style :</strong> <xsl:value-of select="."/></p>
    <xsl:choose>
      <xsl:when test="@époque">
        <p> <strong>Époque : </strong> <xsl:value-of select="@époque"/></p>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="cadre">
    <p><strong>Cadre :</strong> <xsl:value-of select="."/></p>
  </xsl:template>
  
  <xsl:template match="mesures"> <!-- OK sauf le style de mesure : en plus grand ? ou en liste ? -->
    <div>
      <h2>Mesures</h2>
      <xsl:apply-templates select="hauteur"/>
      <xsl:apply-templates select="largeur"/>
      <xsl:apply-templates select="profondeur"/>
      <xsl:apply-templates select="poids"/>
    </div>
  </xsl:template>
  
  <xsl:template match="hauteur"> <!-- OK -->
    <p><strong>Hauteur : </strong>
      <xsl:value-of select="."/> cm
    </p> </xsl:template>
  
  <xsl:template match="largeur"> <!-- OK -->
    <p> <strong>Largeur : </strong>
      <xsl:value-of select="."/> cm
    </p></xsl:template>
  
  <xsl:template match="profondeur"> <!-- OK -->
    <p> <strong>Profondeur : </strong>
      <xsl:value-of select="."/> cm
    </p></xsl:template>
  
  <xsl:template match="poids">
    <p><strong>Poids : </strong>
      <xsl:value-of select="."/> kg
    </p></xsl:template>
  
  <xsl:template match="origine"> <!-- + paramétrage @dateAcquisition, @moyenAcquisition et @prixAchatEuros -->
    <div>
      <h2>Origine</h2>
      <p> <strong>Date d’acquisition</strong> : <xsl:value-of select="@dateAcquisition"/></p>
      <p> <strong>Moyen d’acquisition</strong> : <xsl:value-of select="@moyenAcquisition"/></p>
      <xsl:choose>
        <xsl:when test="@prixAchatEuros">
          <p> <strong>Prix d’achat</strong> : <xsl:value-of select="@prixAchatEuros"/> €</p>
        </xsl:when>
        <xsl:otherwise/>
      </xsl:choose>
      <xsl:apply-templates select="commentaire"/>
    </div>
  </xsl:template>
  
  <xsl:template match="commentaire">
    <p><strong>Commentaire : </strong> <xsl:apply-templates select="*"/></p>
  </xsl:template>
  
  <xsl:template match="valeur">
    <div>
      <h2>Valeur actuelle</h2>
      <p><xsl:value-of select="."/></p>
    </div>
  </xsl:template>
  
  <xsl:template match="usage">
    <div>
      <h2>Usage attendu</h2>
      <p><xsl:value-of select="."/></p>
    </div>
  </xsl:template>
  
  <xsl:template match="para"> <!-- OK -->
    <p><xsl:apply-templates /></p>
  </xsl:template>
  
  <xsl:template match="em">
    <em><xsl:apply-templates /></em> <!-- OK -->
  </xsl:template>
  
  <xsl:template match="lienInterne"> <!-- + paramétrage @ID -->
    <a href="{@ID}.xml">
      <xsl:value-of select="."/>
    </a>
  </xsl:template>
  
  <xsl:template match="lienExterne"> <!-- + paramétrage @URL 
  <xsl:value-of select="@URL"/>-->
    <a href="{@URL}">
      <xsl:value-of select="."/>
    </a>
  </xsl:template>
  
</xsl:stylesheet>
