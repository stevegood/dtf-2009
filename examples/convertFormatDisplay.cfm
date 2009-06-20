<cfparam name="url.fullPath" default="0"/>
<cfparam name="url.imageFormat" default="png"/>

<cfif url.fullPath NEQ 0>
	<p>
		<table>
			<tr>
				<th>url.fullPath</th>
				<td class="added"><cfoutput>#url.fullPath#</cfoutput></td>
			</tr>
			<tr>
				<th>url.imageFormat</th>
				<td class="error"><cfoutput>#url.imageFormat#</cfoutput></td>
			</tr>
		</table>
		&lt;cfimage action="convert" source="<span class="added">#url.fullPath#</span>" format="<span class="error">#url.imageFormat#</span>" destination="<span class="highlight">#ExpandPath('/img/temp/')##ListFirst(ListLast(url.fullPath,'/'),'.')#.#url.imageFormat#</span>" overwrite="true"/&gt;
		<br /><br />
		&lt;cfimage action="writeToBrowser" source="<span class="highlight">#ExpandPath('/img/temp/')##ListLast(url.fullPath,'/')#</span>" /&gt;
	</p>
	
	<cfif NOT DirectoryExists(ExpandPath('/img/temp/'))>
		<cfdirectory action="create" directory="#ExpandPath('/img/temp/')#"/>
	</cfif>
	
	<cfimage action="convert" source="#url.fullPath#" format="#url.imageFormat#" destination="#ExpandPath('/img/temp/')##ListFirst(ListLast(url.fullPath,'/'),'.')#.#url.imageFormat#" overwrite="true"/>
	
	<cfimage action="writeToBrowser" source="#ExpandPath('/img/temp/')##ListFirst(ListLast(url.fullPath,'/'),'.')#.#url.imageFormat#" />
	
	<cffile action="delete" file="#ExpandPath('/img/temp/')##ListFirst(ListLast(url.fullPath,'/'),'.')#.#url.imageFormat#" />
</cfif>