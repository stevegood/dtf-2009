<cfparam name="url.fullPath" default="0"/>
<cfparam name="url.xCoord" default="20"/>
<cfparam name="url.yCoord" default="20"/>
<cfparam name="url.width" default="75" />
<cfparam name="url.height" default="75" />
<cfparam name="url.bevelUp" default="true" />

<cfif url.fullPath NEQ 0>
	<cfimage action="read" source="#url.fullPath#" name="theImage">
	
	<cfscript>
	ImageDrawBeveledRect(theImage,url.xCoord,url.yCoord,url.width,url.height,url.bevelUp);
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
				<th>url.width</th>
				<td class="highlight3"><cfoutput>#url.width#</cfoutput></td>
			</tr>
			<tr>
				<th>url.height</th>
				<td class="highlight4"><cfoutput>#url.height#</cfoutput></td>
			</tr>
			<tr>
				<th>url.bevelUp</th>
				<td class="highlight5"><cfoutput>#url.bevelUp#</cfoutput></td>
			</tr>
		</table>
		
		&lt;cfimage action="read" source="<span class="added">#url.fullPath#</span>" name="<span class="highlight">theImage</span>"&gt;
		<br /><br />
		&lt;cfscript&gt;<br />
		ImageDrawBeveledRect(<span class="highlight">theImage</span>,<span class="error">url.xCoord</span>,<span class="highlight2">url.yCoord</span>,<span class="highlight3">url.width</span>,<span class="highlight4">url.height</span>,<span class="highlight5">url.bevelUp</span>);<br />
		&lt;/cfscript&gt;
		<br /><br />
		&lt;cfimage source="<span class="highlight">#theImage#</span>" action="writeToBrowser"&gt;
	</p>
</cfif>