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
        <h2 id="identification"> Code d’identification :
          <xsl:value-of select="@ID"/> <!-- titre du miroir = son identifiant 
            mais du coup c'est pas très joli comme titre de fiche... -->
        </h2>
        <div>
          <p>
            <xsl:choose>
              <!-- Photo ou non -->
              <xsl:when test="@photo">
                <!-- quand l'attribut photo est renseigné -->
                <img src="../photos/{@ID}.jpg" alt="{@ID}"/>
              </xsl:when>
              <xsl:otherwise> <span class="bold">Photo indisponible</span> </xsl:otherwise>
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
    <li><span class="bold">Date de création de la fiche : </span> <xsl:value-of select="@date"/> ; 
      <span class="bold">créateur : </span> <xsl:value-of select="contributeur"/> </li>
  </xsl:template>
  
  <xsl:template match="modification"> <!-- + paramétrage @date -->
    <li> <span class="bold">Date de modification de la fiche : </span> <xsl:value-of select="@date"/> ; 
      <span class="bold">contributeur : </span> <xsl:value-of select="contributeur"/> </li>
  </xsl:template>
  
  <!--<xsl:template match="contributeur"> 
  </xsl:template>-->

  <xsl:template match="aspect"> <!-- + paramétrage @couleur et @forme -->
    <div>
      <h2>Aspect</h2>
      <p> <span class="bold">Couleur : </span> <xsl:value-of select="@couleur"/></p>
      <p> <span class="bold">Forme : </span> <xsl:value-of select="@forme"/></p>
      <xsl:apply-templates select="style"/>
      <xsl:apply-templates select="cadre"/>
    </div>
  </xsl:template>
  
  <xsl:template match="style"> <!-- + paramétrage @époque -->
    <p> <span class="bold">Style : </span> <xsl:value-of select="."/></p>
    <xsl:choose>
      <xsl:when test="@époque">
        <p> <span class="bold">Époque : </span> <xsl:value-of select="@époque"/></p>
        <xsl:apply-templates select="*"/>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="cadre">
    <p> <span class="bold">Cadre :</span> <xsl:value-of select="."/></p>
    <xsl:apply-templates select="*"/>
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
    <p> <span class="bold">Hauteur : </span>
      <xsl:value-of select="."/> cm
    </p> </xsl:template>
  
  <xsl:template match="largeur"> <!-- OK -->
    <p> <span class="bold">Largeur : </span>
      <xsl:value-of select="."/> cm
    </p></xsl:template>
  
  <xsl:template match="profondeur"> <!-- OK -->
    <p> <span class="bold">Profondeur : </span>
      <xsl:value-of select="."/> cm
    </p></xsl:template>
  
  <xsl:template match="poids">
    <p><span class="bold">Poids : </span>
      <xsl:value-of select="."/> kg
    </p></xsl:template>
  
  <xsl:template match="origine"> <!-- + paramétrage @dateAcquisition, @moyenAcquisition et @prixAchatEuros -->
    <div>
      <h2>Origine</h2>
      <p> <span class="bold">Date d’acquisition</span> : <xsl:value-of select="@dateAcquisition"/></p>
      <p> <span class="bold">Moyen d’acquisition</span> : <xsl:value-of select="@moyenAcquisition"/></p>
      <xsl:choose>
        <xsl:when test="@prixAchatEuros">
          <p> <span class="bold">Prix d’achat</span> : <xsl:value-of select="@prixAchatEuros"/> €</p>
        </xsl:when>
        <xsl:otherwise/>
      </xsl:choose>
      <xsl:apply-templates select="commentaire"/>
    </div>
  </xsl:template>
  
  <xsl:template match="commentaire">
    <div>
      <h3>Commentaire</h3>
      <xsl:apply-templates select="*"/>
    </div>
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
      <xsl:apply-templates select="*"/>
    </div>
  </xsl:template>
  
  <xsl:template match="para"> <!-- OK -->
    <p><xsl:apply-templates /></p>
  </xsl:template>
  
  <xsl:template match="em">
    <em><xsl:apply-templates /></em> <!-- OK -->
  </xsl:template>
  
  <xsl:template match="sup">
    <sup><xsl:apply-templates /></sup> <!-- OK -->
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
