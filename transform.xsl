<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:rest="http://www.example.org/restaurant">

    <!-- Template to match the root element -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Restaurant Listings</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 20px; }
                    .restaurant { border: 1px solid #ddd; padding: 10px; margin-bottom: 10px; }
                    .restaurant h2 { margin: 0; }
                    .dish { margin-left: 20px; border-top: 1px solid #eee; padding-top: 5px; }
                    .dish h4 { margin: 0; }
                    .price { color: green; font-weight: bold; }
                </style>
            </head>
            <body>
                <h1>Restaurants</h1>
                <!-- Loop through each restaurant element -->
                <xsl:for-each select="rest:restaurants/rest:restaurant">
                    <div class="restaurant">
                        <h2><xsl:value-of select="rest:restaurant-name"/></h2>
                        <p><strong>Hours:</strong> <xsl:value-of select="rest:hours"/></p>
                        <p><strong>Reviews:</strong> <xsl:value-of select="rest:reviews"/></p>
                        <h3>Menu</h3>
                        <!-- Loop through each dish in the menu -->
                        <xsl:for-each select="rest:menu/rest:dish">
                            <div class="dish">
                                <h4><xsl:value-of select="rest:dish-name"/></h4>
                                <p><strong>Description:</strong> <xsl:value-of select="rest:description"/></p>
                                <p><strong>Price:</strong> $<xsl:value-of select="rest:price"/></p>
                            </div>
                        </xsl:for-each>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
