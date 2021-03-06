<!--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

-->

<!--
    Rendering specific to the item display page.

    Author: art.lowel at atmire.com
    Author: lieven.droogmans at atmire.com
    Author: ben at atmire.com
    Author: Alexey Maslov

-->

<xsl:stylesheet
    xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
    xmlns:dri="http://di.tamu.edu/DRI/1.0/"
    xmlns:mets="http://www.loc.gov/METS/"
    xmlns:dim="http://www.dspace.org/xmlns/dspace/dim"
    xmlns:xlink="http://www.w3.org/TR/xlink/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:atom="http://www.w3.org/2005/Atom"
    xmlns:ore="http://www.openarchives.org/ore/terms/"
    xmlns:oreatom="http://www.openarchives.org/ore/atom/"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xalan="http://xml.apache.org/xalan"
    xmlns:encoder="xalan://java.net.URLEncoder"
    xmlns:util="org.dspace.app.xmlui.utils.XSLUtils"
    xmlns:jstring="java.lang.String"
    xmlns:url="http://whatever/java/java.net.URLEncoder"
    xmlns:rights="http://cosimo.stanford.edu/sdr/metsrights/"
    xmlns:confman="org.dspace.core.ConfigurationManager"
    exclude-result-prefixes="xalan encoder i18n dri mets dim xlink xsl util jstring rights confman url">

    <xsl:output indent="yes"/>
    
    <xsl:template name="itemSummaryView-DIM-alt-affiliations">
        <xsl:if test="dim:field[@mdschema='cg' and @element='contributor' and @element='affiliation']">
            <div class="simple-item-view-description item-page-field-wrapper table">
                <h5 class="bold"><i18n:text>xmlui.dri2xhtml.METS-1.0.item-affiliation</i18n:text></h5>
                <div>
                    <xsl:for-each select="dim:field[@mdschema='cg' and @element='contributor' and @qualifier='affiliation']">
                        <xsl:choose>
                            <xsl:when test="node()">
                                <xsl:call-template name="discovery-link"><xsl:with-param name="filter-type" select="'affiliation'"/></xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise><xsl:text>&#160;</xsl:text></xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="count(following-sibling::dim:field[@mdschema='cg' and @element='contributor' and @qualifier='affiliation']) != 0">
                            <xsl:text>; </xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    
    <!-- display for regions -->
    <xsl:template name="itemSummaryView-DIM-alt-region">
        <xsl:if test="dim:field[@mdschema='cg' and @element='coverage' and @qualifier='region']">
            <div class="simple-item-view-description item-page-field-wrapper table">
                <h5 class="bold"><i18n:text>xmlui.dri2xhtml.METS-1.0.item-region</i18n:text></h5>
                <div>
                    <xsl:for-each select="dim:field[@mdschema='cg' and @element='coverage' and @qualifier='region']">
                        <xsl:choose>
                            <xsl:when test="node()">
                                <xsl:call-template name="discovery-link"><xsl:with-param name="filter-type" select="'region'"/></xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise><xsl:text>&#160;</xsl:text></xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="count(following-sibling::dim:field[@mdschema='cg' and @element='coverage' and @qualifier='region']) != 0">
                            <xsl:text>; </xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    
    <!-- display for countries -->
    <xsl:template name="itemSummaryView-DIM-alt-country">
        <xsl:if test="dim:field[@mdschema='cg' and @element='coverage' and @qualifier='country']">
            <div class="simple-item-view-description item-page-field-wrapper table">
                <h5 class="bold"><i18n:text>xmlui.dri2xhtml.METS-1.0.item-country</i18n:text></h5>
                <div>
                    <xsl:for-each select="dim:field[@mdschema='cg' and @element='coverage' and @qualifier='country']">
                        <xsl:choose>
                            <xsl:when test="node()">
                                <xsl:call-template name="discovery-link"><xsl:with-param name="filter-type" select="'country'"/></xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise><xsl:text>&#160;</xsl:text></xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="count(following-sibling::dim:field[@mdschema='cg' and @element='coverage' and @qualifier='country']) != 0">
                            <xsl:text>; </xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    
    <!-- display for hubs -->
    <xsl:template name="itemSummaryView-DIM-alt-hub">
        <xsl:if test="dim:field[@mdschema='cg' and @element='coverage' and @qualifier='hub']">
            <div class="simple-item-view-description item-page-field-wrapper table">
                <h5 class="bold"><i18n:text>xmlui.dri2xhtml.METS-1.0.item-hub</i18n:text></h5>
                <div>
                    <xsl:for-each select="dim:field[@mdschema='cg' and @element='coverage' and @qualifier='hub']">
                        <xsl:choose>
                            <xsl:when test="node()">
                                <xsl:call-template name="discovery-link"><xsl:with-param name="filter-type" select="'hub'"/></xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise><xsl:text>&#160;</xsl:text></xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="count(following-sibling::dim:field[@mdschema='cg' and @element='coverage' and @qualifier='hub']) != 0">
                            <xsl:text>; </xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    
    <!-- display for agrovoc terms -->
    <xsl:template name="itemSummaryView-DIM-alt-agrovoc">
        <xsl:if test="dim:field[@mdschema='dc' and @element='subject']">
            <div class="simple-item-view-description item-page-field-wrapper table">
                <h5 class="bold"><i18n:text>xmlui.dri2xhtml.METS-1.0.item-agrovoc</i18n:text></h5>
                <div>
                    <xsl:for-each select="dim:field[@mdschema='dc' and @element='subject']">
                        <xsl:choose>
                            <xsl:when test="node()">
                                <xsl:call-template name="discovery-link"><xsl:with-param name="filter-type" select="'subject'"/></xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise><xsl:text>&#160;</xsl:text></xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="count(following-sibling::dim:field[@mdschema='dc' and @element='subject']) != 0">
                            <xsl:text>; </xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    
    <!-- display for iita subjects -->
    <xsl:template name="itemSummaryView-DIM-alt-iita-subject">
        <xsl:if test="dim:field[@mdschema='cg' and @element='iitasubject']">
            <div class="simple-item-view-description item-page-field-wrapper table">
                <h5 class="bold"><i18n:text>xmlui.dri2xhtml.METS-1.0.item-iita-subjects</i18n:text></h5>
                <div>
                    <xsl:for-each select="dim:field[@mdschema='cg' and @element='iitasubject']">
                        <xsl:choose>
                            <xsl:when test="node()">
                                <xsl:call-template name="discovery-link"><xsl:with-param name="filter-type" select="'iitasubject'"/></xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise><xsl:text>&#160;</xsl:text></xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="count(following-sibling::dim:field[@mdschema='cg' and @element='iitasubject']) != 0">
                            <xsl:text>; </xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    
    <!-- display for research themes -->
    <xsl:template name="itemSummaryView-DIM-alt-theme">
        <xsl:if test="dim:field[@mdschema='cg' and @element='researchtheme']">
            <div class="simple-item-view-description item-page-field-wrapper table">
                <h5 class="bold"><i18n:text>xmlui.dri2xhtml.METS-1.0.item-theme</i18n:text></h5>
                <div>
                    <xsl:for-each select="dim:field[@mdschema='cg' and @element='researchtheme']">
                        <xsl:choose>
                            <xsl:when test="node()">
                                <xsl:call-template name="discovery-link"><xsl:with-param name="filter-type" select="'researchtheme'"/></xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise><xsl:text>&#160;</xsl:text></xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="count(following-sibling::dim:field[@mdschema='cg' and @element='researchtheme']) != 0">
                            <xsl:text>; </xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    
    
    <!-- display for journals -->
    <xsl:template name="itemSummaryView-DIM-alt-journal">
        <xsl:if test="dim:field[@mdschema='cg' and @element='journal']">
            <div class="simple-item-view-description item-page-field-wrapper table">
                <h5 class="bold"><i18n:text>xmlui.dri2xhtml.METS-1.0.item-journal</i18n:text></h5>
                <div>
                    <xsl:for-each select="dim:field[@mdschema='cg' and @element='journal']">
                        <xsl:choose>
                            <xsl:when test="node()">
                                <xsl:call-template name="discovery-link"><xsl:with-param name="filter-type" select="'journal'"/></xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise><xsl:text>&#160;</xsl:text></xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="count(following-sibling::dim:field[@mdschema='cg' and @element='journal']) != 0">
                            <xsl:text>; </xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template name="itemSummaryView-DIM-alt-URI">
        <xsl:if test="dim:field[@element='identifier' and @qualifier='uri' and descendant::text()]">
            <div class="simple-item-view-uri item-page-field-wrapper table">
                <h5 class="bold"><i18n:text>xmlui.dri2xhtml.METS-1.0.item-uri</i18n:text></h5>
                <span>
                    <xsl:for-each select="dim:field[@element='identifier' and @qualifier='uri']">
                        <a class="active">
                            <xsl:attribute name="href">
                                <xsl:copy-of select="./node()"/>
                            </xsl:attribute>
                            <xsl:copy-of select="./node()"/>
                        </a>
                        <xsl:if test="count(following-sibling::dim:field[@element='identifier' and @qualifier='uri']) != 0">
                            <br/>
                        </xsl:if>
                    </xsl:for-each>
                </span>
            </div>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template name="itemSummaryView-DIM-alt-doi">
        <xsl:if test="dim:field[@mdschema='cg' and @element='identifier' and @qualifier='doi']">
            <div class="simple-item-view-description item-page-field-wrapper table">
                <h5 class="bold"><i18n:text>xmlui.dri2xhtml.METS-1.0.item-doi</i18n:text></h5>
                <div>
                    <xsl:for-each select="dim:field[@mdschema='cg' and @element='identifier' and @qualifier='doi']">
                        <xsl:choose>
                            <xsl:when test="node()">
                                <xsl:copy-of select="node()"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>&#160;</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    
    
    <!-- item type display -->
    <xsl:template name="itemSummaryView-DIM-alt-type">
        <xsl:if test="dim:field[@element='type' and descendant::text()]">
            <div class="simple-item-view-date word-break item-page-field-wrapper table">
                <h5 class="bold">
                    <i18n:text>xmlui.dri2xhtml.METS-1.0.item-type</i18n:text>
                </h5>
                <xsl:for-each select="dim:field[@element='type']">
                    <xsl:choose>
                        <xsl:when test="node()">
                            <xsl:call-template name="discovery-link">
                                <xsl:with-param name="filter-type" select="'type'"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>&#160;</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="count(following-sibling::dim:field[@element='type']) != 0">
                        <xsl:text>;</xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </div>
        </xsl:if>
    </xsl:template>
    
        
    <!-- item review status display -->
    <xsl:template name="itemSummaryView-DIM-alt-review">
        <xsl:if test="dim:field[@mdschema='cg' and @element='reviewstatus']">
            <div class="simple-item-view-date word-break item-page-field-wrapper table">
                <h5 class="bold">
                    <i18n:text>xmlui.dri2xhtml.METS-1.0.item-review</i18n:text>
                </h5>
                <xsl:for-each select="dim:field[@mdschema='cg' and @element='reviewstatus']">
                    <xsl:choose>
                        <xsl:when test="node()">
                            <xsl:call-template name="discovery-link">
                                <xsl:with-param name="filter-type" select="'reviewstatus'"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>&#160;</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="count(following-sibling::dim:field[@mdschema='cg' and @element='reviewstatus']) != 0">
                        <xsl:text>;</xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </div>
        </xsl:if>
    </xsl:template>
    
        
    <!-- item target audience display -->
    <xsl:template name="itemSummaryView-DIM-alt-audience">
        <xsl:if test="dim:field[@mdschema='cg' and @element='targetaudience']">
            <div class="simple-item-view-date word-break item-page-field-wrapper table">
                <h5 class="bold">
                    <i18n:text>xmlui.dri2xhtml.METS-1.0.item-audience</i18n:text>
                </h5>
                <xsl:for-each select="dim:field[@mdschema='cg' and @element='targetaudience']">
                    <xsl:choose>
                        <xsl:when test="node()">
                            <xsl:call-template name="discovery-link">
                                <xsl:with-param name="filter-type" select="'targetaudience'"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>&#160;</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="count(following-sibling::dim:field[@mdschema='cg' and @element='targetaudience']) != 0">
                        <xsl:text>;</xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </div>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="itemSummaryView-DIM-share">
        <div class="simple-item-view-description item-page-field-wrapper table">
            <div class="pull-left">
                <a class="btn-social btn-normal">
                    <xsl:attribute name="href">
                        <xsl:text>javascript:window.print();</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="title"><xsl:text>Print</xsl:text></xsl:attribute>
                    <i class="fa fa-print" aria-hidden="true"></i>
                </a>

                <a class="btn-social btn-normal">
                    <xsl:attribute name="href">
                        <xsl:text>mailto:?&amp;body=</xsl:text>
                        <xsl:value-of select="dim:field[@element='identifier' and @qualifier='uri']"/>
                        <xsl:text>&amp;media=&amp;subject=</xsl:text>
                        <xsl:value-of select="dim:field[@element='title']"/>
                    </xsl:attribute>
                    <xsl:attribute name="title"><xsl:text>Share on e-mail</xsl:text></xsl:attribute>
                    <xsl:attribute name="target"><xsl:text>_blank</xsl:text></xsl:attribute>
                    <i class="fa fa-envelope" aria-hidden="true"></i>
                </a>
            </div>
            
            <div class="pull-right">
                <a class="btn-social btn-linkedin">
                    <xsl:attribute name="href">
                        <xsl:text>https://www.linkedin.com/shareArticle?mini=true&amp;url=</xsl:text>
                        <xsl:value-of select="dim:field[@element='identifier' and @qualifier='uri']"/>
                    </xsl:attribute>
                    <xsl:attribute name="title"><xsl:text>Share on LinkedIn</xsl:text></xsl:attribute>
                    <xsl:attribute name="target"><xsl:text>_blank</xsl:text></xsl:attribute>
                    <i class="fa fa-linkedin" aria-hidden="true"></i>
                </a>
                <a class="btn-social btn-mendeley">
                    <xsl:attribute name="href">
                        <xsl:text>https://www.mendeley.com/import/?url=</xsl:text>
                        <xsl:value-of select="dim:field[@element='identifier' and @qualifier='uri']"/>
                    </xsl:attribute>
                    <xsl:attribute name="title"><xsl:text>Add to Mendley Library</xsl:text></xsl:attribute>
                    <xsl:attribute name="target"><xsl:text>_blank</xsl:text></xsl:attribute>
                    <i class="ai ai-mendeley" aria-hidden="true"></i>
                </a>
                <a class="btn-social btn-twitter">
                    <xsl:attribute name="href">
                        <xsl:text>https://twitter.com/intent/tweet?url=</xsl:text>
                        <xsl:value-of select="dim:field[@element='identifier' and @qualifier='uri']"/>
                        <xsl:text>&amp;text=</xsl:text>
                        <xsl:value-of select="dim:field[@element='title']"></xsl:value-of>    
                         <xsl:text>&amp;hashtags=IITA,IITA_CGIAR,IITA_BIBLIOGRAPHY</xsl:text>
                         <xsl:text>&amp;via=IITA_CGIAR</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="title"><xsl:text>Tweet</xsl:text></xsl:attribute>
                    <xsl:attribute name="target"><xsl:text>_blank</xsl:text></xsl:attribute>
                    <i class="fa fa-twitter" aria-hidden="true"></i>
                </a>

                <a class="btn-social btn-facebook">
                    <xsl:attribute name="href">
                        <xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
                        <xsl:value-of select="dim:field[@element='identifier' and @qualifier='uri']"/>
                    </xsl:attribute>
                    <xsl:attribute name="title"><xsl:text>Share on Facebook</xsl:text></xsl:attribute>
                    <xsl:attribute name="target"><xsl:text>_blank</xsl:text></xsl:attribute>
                    <i class="fa fa-facebook" aria-hidden="true"></i>
                </a>
            </div>
            <div style="clear:both;"></div>
        </div>
    </xsl:template>
    
    <xsl:template name="discovery-link">
        <xsl:param name="filtertype"/>
        <xsl:variable name="filterlink">
            <xsl:value-of select="concat($context-path,'/discover?filtertype=',$filtertype,'&amp;filter_relational_operator=equals&amp;filter=',url:encode(node()))"></xsl:value-of>
        </xsl:variable>
        <a target="_blank">
            <xsl:attribute name="href" >
                <xsl:value-of select="$filterlink"/>
            </xsl:attribute>
            <xsl:copy-of select="node()"/>
        </a>
    </xsl:template>
    
</xsl:stylesheet>
