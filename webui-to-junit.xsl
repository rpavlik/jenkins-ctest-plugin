<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:a ="http://microsoft.com/schemas/VisualStudio/TeamTest/2006" xmlns:b ="http://microsoft.com/schemas/VisualStudio/TeamTest/2010" xmlns:c ="http://artoftest.com/schemas/WebAiiDesignCanvas/1.0.0"> 
	<xsl:output method="xml" indent="yes" />	
	<xsl:template match="/">
		<testsuites>		
			<xsl:variable name="buildName" select="//a:TestRun/@name"/>	
			<xsl:variable name="numberOfTests" select="count(//c:WebAiiTestResult/@outcome)"/>
 			<xsl:variable name="numberOfFailures" select="count(//c:WebAiiTestResult/@outcome[.='Failed'])" />		
 			<xsl:variable name="numberSkipped" select="count(//c:WebAiiTestResult/@outcome[.!='Passed' and .!='Failed'])" />	
			<testsuite name="MSTestSuite"
				tests="{$numberOfTests}" time="0"
				failures="{$numberOfFailures}"  errors="0"
				skipped="{$numberSkipped}">
				
        <xsl:for-each select="//c:WebAiiTestResult">
					<xsl:variable name="testName" select="@testName"/>
					<xsl:variable name="executionId" select="@executionId"/>
					<xsl:variable name="duration_seconds" select="substring(@duration, 7)"/>
					<xsl:variable name="duration_minutes" select="substring(@duration, 4,2 )"/>	
					<xsl:variable name="duration_hours" select="substring(@duration, 1, 2)"/>		
					<xsl:variable name="outcome" select="@outcome"/>	
					<xsl:variable name="message" select="a:Output/a:ErrorInfo/a:Message"/>	
					<xsl:for-each select="//c:WebAiiTest">
						<xsl:variable name="currentExecutionId" select="a:Execution/@id"/>
						<xsl:if test="$currentExecutionId = $executionId" >
							<xsl:variable name="className" select="@name"/>	
								<testcase classname="{$className}"
									name="{$testName}"
									time="{$duration_hours*3600 + $duration_minutes*60 + $duration_seconds }">

									<xsl:if test="contains($outcome, 'Failed')"> 
<failure>
<xsl:value-of select="$message" />
</failure>
								</xsl:if>
							</testcase>
						</xsl:if>
					</xsl:for-each>
				</xsl:for-each>
				
			</testsuite>
		</testsuites>
	</xsl:template>
</xsl:stylesheet>

