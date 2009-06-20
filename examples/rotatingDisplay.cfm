<cfparam name="url.fullPath" default="0"/>
<cfparam name="url.rotationDegrees" default="-90"/>

<cfif url.fullPath NEQ 0>
	<p>
		<table>
			<tr>
				<th>url.fullPath</th>
				<td class="added"><cfoutput>#url.fullPath#</cfoutput></td>
			</tr>
			<tr>
				<th>url.rotationDegrees</th>
				<td class="error"><cfoutput>#url.rotationDegrees#</cfoutput></td>
			</tr>
		</table>
		&lt;cfimage action="rotate" source="<span class="added">#url.fullPath#</span>" angle="<span class="error">#url.rotationDegrees#</span>" name="<span class="highlight">theImage</span>"/&gt;
		<br /><br />
		&lt;cfimage action="writeToBrowser" source="<span class="highlight">#theImage#</span>" /&gt;
	</p>
	
	<cfimage action="rotate" source="#url.fullPath#" angle="#url.rotationDegrees#" name="theImage"/>
	
	<cfimage action="writeToBrowser" source="#theImage#" />
</cfif>