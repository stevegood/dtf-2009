<cfparam name="url.fullPath" default="0" />
<cfparam name="url.width" default="50" />
<cfparam name="url.height" default="50" />
<cfparam name="url.xCoord" default="0" />
<cfparam name="url.yCoord" default="0" />

<cfif url.fullPath NEQ 0>
	<cfimage action="read" source="#url.fullPath#" name="theImage"/>
	
	<cfscript>
	theImageCopy = imageCopy(theImage, url.xCoord, url.yCoord, url.width, url.height);
	</cfscript>
	
	<cfimage action="writeToBrowser" source="#theImageCopy#" />
	<br />
	<cfimage action="writeToBrowser" source="#theImage#" />
	
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
				<th>url.width</th>
				<td class="highlight3"><cfoutput>#url.width#</cfoutput></td>
			</tr>
			<tr>
				<th>url.height</th>
				<td class="highlight4"><cfoutput>#url.height#</cfoutput></td>
			</tr>
		</table>
		
		&lt;cfimage action="read" source="<span class="added">#url.fullPath#</span>" name="<span class="highlight">theImage</span>"/&gt;
		<br /><br />
		&lt;cfscript&gt;<br />
		theImageCopy = imageCopy(<span class="highlight">theImage</span>, <span class="error">url.xCoord</span>, <span class="highlight2">url.yCoord</span>, <span class="highlight3">url.width</span>, <span class="highlight4">url.height</span>);<br />
		&lt;/cfscript&gt;
		<br /><br />
		&lt;cfimage action="writeToBrowser" source="#theImageCopy#" /&gt;
		<br /><br />
		&lt;cfimage action="writeToBrowser" source="<span class="highlight">#theImage#</span>" /&gt;
	</p>
</cfif>