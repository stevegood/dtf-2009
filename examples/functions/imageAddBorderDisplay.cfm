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
		<br /><br />
		&lt;cfimage action="read" source="<span class="added">#url.fullPath#</span>" name="<span class="highlight">theImage</span>"/&gt;
		<br /><br />
		&lt;cfscript&gt;<br />
		imageAddBorder(<span class="highlight">theImage</span>, <span class="highlight2">url.borderWidth</span>, '##<span class="error">#url.borderColor#</span>');<br />
		&lt;/cfscript&gt;
		<br /><br />
		&lt;cfimage action="writeToBrowser" source="<span class="highlight">#theImage#</span>" /&gt;
	</p>
	
	<cfimage action="read" source="#url.fullPath#" name="theImage"/>
	
	<cfscript>
	imageAddBorder(theImage, url.borderWidth, '###url.borderColor#');
	</cfscript>
	
	<cfimage action="writeToBrowser" source="#theImage#" />
</cfif>