<cfparam name="url.fullPath" default="0"/>

<cfif url.fullPath NEQ 0>
	<p>
		<span class="added">( url.fullPath = <cfoutput>#url.fullPath#</cfoutput> )</span>
		<br /><br />
		&lt;cfimage action="info" source="<span class="added">#url.fullPath#</span>" structName="<span class="highlight">theImageInfo</span>"/&gt;
		<br /><br />
		&lt;cfdump var="<span class="highlight">#theImageInfo#</span>"&gt;
	</p>
	
	<cfimage action="info" source="#url.fullPath#" structName="theImageInfo"/>
	
	<cfdump var="#theImageInfo#">
</cfif>