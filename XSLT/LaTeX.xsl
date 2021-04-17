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
  
  <xsl:template match="miroir">
    } \title{
    <xsl:value-of select="@ID"/>
    } \maketitle \begin{center}
  </xsl:template>
   
  <xsl:template match="nom">
     \part* {Catalogue de miroirs de la collection privée de Narcisse Brillant}
     \hr
  </xsl:template>
  
  <xsl:template match="identification">
     \section* {Code d’identification :}
     <xsl:value-of select="@ID"/><!-- titre du miroir = son identifiant 
            mais du coup c'est pas très joli comme titre de fiche... -->
  </xsl:template>
  
  <xsl:template match="photo">
    <xsl:choose>
      <xsl:when test="/*/@photo = 'non'"> {\bf \large Photo non disponible}</xsl:when>
      <xsl:otherwise>
        \image{../photos/
        <xsl:value-of select="/*/@ID"/>
        .jpg}
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
    
  <xsl:template match="suiviModif">
    \begin {itemize}
    <xsl:apply-templates select="création"/>
    <xsl:apply-templates select="modification"/>
    \end {itemize}
  </xsl:template>
  
  <xsl:template match="création"> <!-- + paramétrage @date -->
    \item {\bf \large Date de création de la fiche :} <xsl:value-of select="@date"/> ; 
    {\bf \large créateur :} <xsl:value-of select="créateur"/>
  </xsl:template>
  
  <xsl:template match="modification"> <!-- + paramétrage @date -->
    \item {\bf \large Date de modification de la fiche :} <xsl:value-of select="@date"/> ; 
    {\bf \large contributeur :} <xsl:value-of select="contributeur"/>
  </xsl:template>
  
  <!--<xsl:template match="contributeur"> 
  </xsl:template>-->
  
  <xsl:template match="aspect"> <!-- + paramétrage @couleur et @forme -->
     \section* {Aspect}
     \\ {\bf \large Couleur :} <xsl:value-of select="@couleur"/>
     \\ {\bf \large Forme :}  <xsl:value-of select="@forme"/>
     <xsl:apply-templates select="style"/>
     <xsl:apply-templates select="cadre"/>
  </xsl:template>
  
  <xsl:template match="style"> <!-- + paramétrage @époque -->
      \\ {\bf \large Style :} <xsl:value-of select="."/>
    <xsl:choose>
      <xsl:when test="@époque">
        \\ {\bf \large Époque :} <xsl:value-of select="@époque"/>
        <xsl:apply-templates select="*"/>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="cadre">
      \\ {\bf \large Cadre :} <xsl:value-of select="."/>
    <xsl:apply-templates select="*"/>
  </xsl:template>
  
  <xsl:template match="mesures"> <!-- OK sauf le style de mesure : en plus grand ? ou en liste ? -->
    \section* {Mesures}
      <xsl:apply-templates select="hauteur"/>
      <xsl:apply-templates select="largeur"/>
      <xsl:apply-templates select="profondeur"/>
      <xsl:apply-templates select="poids"/>
  </xsl:template>
  
  <xsl:template match="hauteur"> <!-- OK -->
    \\ {\bf \large Hauteur :}
      <xsl:value-of select="."/> cm
   </xsl:template>
  
  <xsl:template match="largeur"> <!-- OK -->
    \\ {\bf \large Largeur :}
      <xsl:value-of select="."/> cm
    </xsl:template>
  
  <xsl:template match="profondeur"> <!-- OK -->
    \\ {\bf \large Profondeur :}
      <xsl:value-of select="."/> cm
    </xsl:template>
  
  <xsl:template match="poids">
    \\ {\bf \large Poids :}
      <xsl:value-of select="."/> kg
    </xsl:template>
  
  <xsl:template match="origine"> <!-- + paramétrage @dateAcquisition, @moyenAcquisition et @prixAchatEuros -->
    \section* {Origine}
    \\ {\bf \large Date d’acquisition :} <xsl:value-of select="@dateAcquisition"/>
    \\ {\bf \large Moyen d’acquisition :} <xsl:value-of select="@moyenAcquisition"/>
      <xsl:choose>
        <xsl:when test="@prixAchatEuros">
          \\ {\bf \large Prix d’achat :} <xsl:value-of select="@prixAchatEuros"/> €
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
  
  <xsl:template match="para"> <!-- OK -->
    <xsl:text> </xsl:text>
    <xsl:apply-templates/>
    <xsl:text> </xsl:text>
  </xsl:template>
  
  <xsl:template match="em">
      {\em
      <xsl:apply-templates/>
      }
     <!-- OK -->
  </xsl:template>
  
  <xsl:template match="sup">
      {\up
      <xsl:apply-templates />
      }
    <!-- OK -->
  </xsl:template>
  
  <xsl:template match="lienInterne">
      {\em
      <xsl:value-of select="."/>
      }
   </xsl:template>
  
  <xsl:template match="lienExterne"> 
      {\em
      <xsl:value-of select="."/>
      }
  </xsl:template>
  
</xsl:stylesheet>
