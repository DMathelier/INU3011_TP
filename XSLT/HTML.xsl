<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- L’instruction <xsl:output /> qui suit précise la forme de l’extrant désiré :
    - HTML5
    - indenté
    - encodé en UTF-8 -->
  <xsl:output method="html" version="5" indent="yes" encoding="UTF-8" 
    omit-xml-declaration="yes" />

  <xsl:template match="/"><xsl:apply-templates /></xsl:template>

<!-- Vous placez vos gabarits ci-dessous, en commençant par celui qui "match" votre
élément de plus haut niveau (EPHN), dont le contenu formera l’infrastructure
HTML principale de vos extrants HTML.

LE GABARIT CI-DESSOUS N’EST QU’UN EXEMPLE ET DOIT ÊTRE MODIFIÉ.
Notamment et entre autres, "EPHN" doit être remplacé par le nom de l’élément de plus haut
niveau de VOTRE modèle. Vous devrez ensuite ajouter les autres gabarits requis, selon la
conception de votre transformation.
-->
  <xsl:template match="EPHN">
    <html>
      <head>
        <title>...</title>
      </head>
      <body>
        <h1>...</h1>
        <div>...</div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
