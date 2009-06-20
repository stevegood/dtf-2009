<cfparam name="url.fullPath" default="0"/>
<cfparam name="url.xCoord" default="20"/>
<cfparam name="url.yCoord" default="20"/>
<cfparam name="url.textString" default="ColdFusion" />

<cfif url.fullPath NEQ 0>
	<cfimage action="read" source="#url.fullPath#" name="theImage">
	
	<cfscript>
	ImageDrawText(theImage, url.textString, url.xCoord, url.yCoord);
	</cfscript>
	
	<cfimage source="#theImage#" action="writeToBrowser">
	
	<p>
		<table>
			<tr>
				<th>url.fullPath</th>
				<td class="added"><cfoutput>#url.fullPath#</cfoutput></td>
			</tr>
			<tr>
				<th>url.xCoord</th>
				<td class="error"><cfoutput>#url.xCoord#</cfoutput></td>
			</tr>
			<tr>
				<th>url.yCoord</th>
				<td class="highlight2"><cfoutput>#url.yCoord#</cfoutput></td>
			</tr>
			<tr>
				<th>url.textString</th>
				<td class="highlight3"><cfoutput>#url.textString#</cfoutput></td>
			</tr>
		</table>
		
		&lt;cfimage action="read" source="<span class="added">#url.fullPath#</span>" name="<span class="highlight">theImage</span>"&gt;
		<br /><br />
		&lt;cfscript&gt;<br />
		ImageDrawText(<span class="highlight">theImage</span>, <span class="highlight3">url.textString</span>, <span class="error">url.xCoord</span>, <span class="highlight2">url.yCoord</span>);<br />
		&lt;/cfscript&gt;
		<br /><br />
		&lt;cfimage source="<span class="highlight">#theImage#</span>" action="writeToBrowser"&gt;
	</p>
</cfif>