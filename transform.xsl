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
                    table { width: 100%; border-collapse: collapse; }
                    th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
                    th { background-color: #f4f4f4; }
                    .dish-table { width: 100%; border-collapse: collapse; margin-top: 10px; }
                    .dish-table th, .dish-table td { border: 1px solid #ddd; padding: 5px; text-align: left; }
                </style>
            </head>
            <body>
                <h1>Restaurants</h1>
                <!-- Main restaurant table -->
                <table>
                    <thead>
                        <tr>
                            <th>Restaurant Name</th>
                            <th>Hours</th>
                            <th>Reviews</th>
                            <th>Menu</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Loop through each restaurant element -->
                        <xsl:for-each select="rest:restaurants/rest:restaurant">
                            <tr>
                                <td><xsl:value-of select="rest:restaurant-name"/></td>
                                <td><xsl:value-of select="rest:hours"/></td>
                                <td><xsl:value-of select="rest:reviews"/></td>
                                <td>
                                    <!-- Create a table for the menu items -->
                                    <table class="dish-table">
                                        <thead>
                                            <tr>
                                                <th>Dish Name</th>
                                                <th>Description</th>
                                                <th>Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- Loop through each dish in the menu -->
                                            <xsl:for-each select="rest:menu/rest:dish">
                                                <tr>
                                                    <td><xsl:value-of select="rest:dish-name"/></td>
                                                    <td><xsl:value-of select="rest:description"/></td>
                                                    <td>$<xsl:value-of select="rest:price"/></td>
                                                </tr>
                                            </xsl:for-each>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
