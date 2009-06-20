<cfparam name="url.fullPath" default="0"/>
<cfparam name="url.imageWidth" default="256"/>
<cfparam name="url.imageHeight" default="256"/>

<cfif url.fullPath NEQ 0>
	<p>
		<table>
			<tr>
				<th>url.fullPath</th>
				<td class="added"><cfoutput>#url.fullPath#</cfoutput></td>
			</tr>
			<tr>
				<th>url.imageHeight</th>
				<td class="error"><cfoutput>#url.imageHeight#</cfoutput></td>
			</tr>
			<tr>
				<th>url.imageWidth</th>
				<td class="highlight2"><cfoutput>#url.imageWidth#</cfoutput></td>
			</tr>
		</table>
		&lt;cfimage action="resize" source="<span class="added">#url.fullPath#</span>" height="<span class="error">#url.imageHeight#</span>" width="<span class="highlight2">#url.imageWidth#</span>" name="<span class="highlight">theImage</span>"/&gt;
		<br /><br />
		&lt;cfimage action="writeToBrowser" source="<span class="highlight">#theImage#</span>" /&gt;
	</p>
	
	<cfimage action="resize" source="#url.fullPath#" height="#url.imageHeight#" width="#url.imageWidth#" name="theImage"/>
	
	<cfimage action="writeToBrowser" source="#theImage#" />
</cfif>