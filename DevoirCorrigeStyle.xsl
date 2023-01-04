<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <h1>Releve Compte Bancaire</h1>
        <ul>
            <li>Date Releve:  <xsl:value-of select="releve/dateReleve"></xsl:value-of></li>
            <li> Solde: <xsl:value-of select="releve/solde"></xsl:value-of></li>
            <li>
                <ul>
                    <xsl:for-each select="releve/operations">
                        <li>Date Debut: <xsl:value-of select="@dateDebut"></xsl:value-of> </li>
                        <li>Date Fin : <xsl:value-of select="@dateFin"></xsl:value-of> </li>
                        <li>
                            
                                <table border="1">
                                    <tbody>
                                        <tr>
                                            <th>TYPE</th>
                                            <th> DATE</th>
                                            <th>MONTANT</th>
                                            <th>DESCRIPTION</th>
                                        </tr>
                                    </tbody>
                                    <tbody>
                                        <xsl:for-each select="operation">
                                        <tr>
                                            <td><xsl:value-of select="@type"></xsl:value-of> </td>
                                            <td><xsl:value-of select="@date"></xsl:value-of> </td>
                                            <td><xsl:value-of select="@montant"></xsl:value-of> </td>
                                            <td><xsl:value-of select="@desciption"></xsl:value-of> </td>
                                            
                                        </tr>
                                        </xsl:for-each>
                                       <tr>
                                           <td colspan="4"> Totale Debut: <xsl:value-of select="sum(operation[@montant])"></xsl:value-of></td>
                                           <td colspan="4"> Totale Debut: <xsl:value-of select="sum(operation[@montant])"></xsl:value-of></td>
                                          
                                       </tr>
                                    </tbody>
                                </table>
                           
                        </li>
                    </xsl:for-each>
                   
                </ul>
            </li>
        </ul>
            <h3>Operation De Type Credit</h3>
            <table border="1">
                <tbody>
                    <tr>
                        <th>TYPE</th>
                        <th> DATE</th>
                        <th>MONTANT</th>
                        <th>DESCRIPTION</th>
                    </tr>
                </tbody>
                <tbody>
                    <xsl:for-each select="releve/operations/operation[@type='CREDIT']">
                        <tr>
                            <td><xsl:value-of select="@type"></xsl:value-of> </td>
                            <td><xsl:value-of select="@date"></xsl:value-of> </td>
                            <td><xsl:value-of select="@montant"></xsl:value-of> </td>
                            <td><xsl:value-of select="@desciption"></xsl:value-of> </td>
                            
                        </tr>
                    </xsl:for-each>
                    
                </tbody>
            </table>
        
    </xsl:template>
</xsl:stylesheet>