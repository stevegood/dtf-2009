<cfparam name="url.fullPath" default="0"/>
<cfparam name="url.borderColor" default="FF0000"/>
<cfparam name="url.borderWidth" default="5"/>
<cfparam name="url.imageWidth" default="75"/>
<cfparam name="url.imageHeight" default="75"/>
<cfparam name="url.cornerSize" default="20" />

<cfif url.fullPath NEQ 0>
	
	<cfimage action="read" source="#url.fullPath#" name="theImage" />
	<cfset underlayWidth = (url.borderWidth * 2) + url.imageWidth />
	<cfset underlayHeight = (url.borderWidth * 2) + url.imageHeight />
	<cfset underlay = ImageNew('',underlayWidth, underlayHeight, 'rgb', '##' & url.borderColor) />
	
	<cfset ImageSetAntialiasing(underlay, "on") />
	<cfset ImageSetAntialiasing(theImage, "on") />
	
	<cfimage action="resize" source="#theImage#" height="#url.imageHeight#" width="#url.imageWidth#" name="theImage"/>
	<cfset ImageSetDrawingColor(theImage, '##' & url.borderColor) />
	
	<cfloop to="#url.cornerSize#" from="1" index="i">
		<cfset ImageDrawRoundRect(theImage, 0, 0, url.imageWidth, url.imageHeight, i, i, false) />
		<cfset ImageDrawRoundRect(underlay, 0, 0, underlayWidth, underlayWidth, i, i, false) />
	</cfloop>
	
	<cfset ImagePaste(underlay, theImage, url.borderWidth, url.borderWidth) />
	
	<cfimage action="writeToBrowser" source="#underlay#" />
	
	<p>
		<table width="100%">
			<tr>
				<th>url.fullPath</th>
				<td class="added"><cfoutput>#url.fullPath#</cfoutput></td>
			</tr>
			<tr>
				<th>url.imageWidth</th>
				<td class="error"><cfoutput>#url.imageWidth#</cfoutput></td>
			</tr>
			<tr>
				<th>url.imageHeight</th>
				<td class="highlight2"><cfoutput>#url.imageHeight#</cfoutput></td>
			</tr>
			<tr>
				<th>url.borderColor</th>
				<td class="highlight3"><cfoutput>#url.borderColor#</cfoutput></td>
			</tr>
			<tr>
				<th>url.borderWidth</th>
				<td class="highlight4"><cfoutput>#url.borderWidth#</cfoutput></td>
			</tr>
		</table>
		
		&lt;cfimage action="read" source="<span class="added">#url.fullPath#</span>" name="<span class="highlight">theImage</span>" /&gt<br />
		&lt;cfset underlayWidth = (<span class="highlight4">url.borderWidth</span> * 2) + <span class="error">url.imageWidth</span> /&gt<br />
		&lt;cfset underlayHeight = (<span class="highlight4">url.borderWidth</span> * 2) + <span class="highlight2">url.imageHeight</span> /&gt<br />
		&lt;cfset <span class="highlight">underlay</span> = ImageNew('',underlayWidth, underlayHeight, 'rgb', '##' & <span class="highlight3">url.borderColor</span>) /&gt<br />
		<br />
		&lt;cfset ImageSetAntialiasing(<span class="highlight">underlay</span>, "on") /&gt<br />
		&lt;cfset ImageSetAntialiasing(<span class="highlight">theImage</span>, "on") /&gt<br />
		<br />
		&lt;cfimage action="resize" source="<span class="highlight">#theImage#</span>" height="<span class="highlight2">#url.imageHeight#</span>" width="<span class="error">#url.imageWidth#</span>" name="<span class="highlight">theImage</span>"/&gt<br />
		&lt;cfset ImageSetDrawingColor(<span class="highlight">theImage</span>, '##' & url.borderColor) /&gt<br />
		<br />
		&lt;cfloop to="#url.cornerSize#" from="1" index="i"&gt<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&lt;cfset ImageDrawRoundRect(<span class="highlight">theImage</span>, 0, 0, <span class="error">url.imageWidth</span>, <span class="highlight2">url.imageHeight</span>, i, i, false) /&gt<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&lt;cfset ImageDrawRoundRect(<span class="highlight">underlay</span>, 0, 0, underlayWidth, underlayWidth, i, i, false) /&gt<br />
		&lt;/cfloop&gt<br />
		<br />
		&lt;cfset ImagePaste(<span class="highlight">underlay</span>, <span class="highlight">theImage</span>, <span class="highlight4">url.borderWidth</span>, <span class="highlight4">url.borderWidth</span>) /&gt<br />
		<br />
		&lt;cfimage action="writeToBrowser" source="<span class="highlight">#underlay#</span>" /&gt<br />
	</p>
	
</cfif>