<cfparam name="url.fullPath" default="0"/>
<cfparam name="url.borderWidth" default="2"/>
<cfparam name="url.borderColor" default="000000"/>

<cfif url.fullPath NEQ 0>
	<p>
		<table>
			<tr>
				<th>url.fullPath</th>
				<td class="added"><cfoutput>#url.fullPath#</cfoutput></td>
			</tr>
			<tr>
				<th>url.borderColor</th>
				<td class="error"><cfoutput>#url.borderColor#</cfoutput></td>
			</tr>
			<tr>
				<th>url.borderWidth</th>
				<td class="highlight2"><cfoutput>#url.borderWidth#</cfoutput></td>
			</tr>
		</table>
		&lt;cfimage action="border" source="<span class="added">#url.fullPath#</span>" thickness="<span class="highlight2">#url.borderWidth#</span>" color="<span class="error">###url.borderColor#</span>" name="<span class="highlight">theImage</span>"/&gt;
		<br /><br />
		&lt;cfimage action="writeToBrowser" source="<span class="highlight">#theImage#</span>" /&gt;
	</p>
	
	<cfimage action="border" source="#url.fullPath#" thickness="#url.borderWidth#" color="###url.borderColor#" name="theImage"/>
	
	<cfimage action="writeToBrowser" source="#theImage#" />
</cfif>