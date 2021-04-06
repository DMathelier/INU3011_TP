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

</xsl:stylesheet>
