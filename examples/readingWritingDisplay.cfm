<cfparam name="url.fullPath" default="" />

<cfif url.fullPath NEQ 0>
	<p>	
		<span class="added">( url.fullPath = <cfoutput>#url.fullPath#</cfoutput> )</span>
		<br /><br />
		&lt;cfimage action="read" source="<span class="added">#url.fullPath#</span>" name="<span class="highlight">theImage</span>"/&gt;
		<br /><br />
		&lt;cfimage action="writeToBrowser" source="<span class="highlight">#theImage#</span>" /&gt;
		<br /><br />
		&lt;cfimage action="write" source="<span class="highlight">#theImage#</span>" destination="<span class="added">#ExpandPath('/img/temp/')##ListLast(url.fullPath,'/')#</span>"/&gt;
		<br /><br />
		&lt;cfimage action="writeToBrowser" source="<span class="added">#ExpandPath('/img/temp/')##ListLast(url.fullPath,'/')#</span>"/&gt;
	</p>
	
	<cfimage action="read" source="#url.fullPath#" name="theImage"/>
	
	<cfimage action="writeToBrowser" source="#theImage#" />
	
	<cfif NOT directoryExists(ExpandPath('/img/temp/'))>
		<cfdirectory action="create" directory="#ExpandPath('/img/temp/')#" />
	</cfif>
	
	<cfimage action="write" source="#theImage#" destination="#ExpandPath('/img/temp/')##ListLast(url.fullPath,'/')#" overwrite="true"/>
	
	<cfimage action="writeToBrowser" source="#ExpandPath('/img/temp/')##ListLast(url.fullPath,'/')#"/>
	
	<cffile action="delete" file="#ExpandPath('/img/temp/')##ListLast(url.fullPath,'/')#" />
</cfif>