<cfcomponent>
	
	<cffunction name="init" access="public" returntype="Any" output="false">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getImageSelect" access="public" returntype="any" output="true">
		<cfargument name="directory" type="string" required="false" default="/img/samples/" />
		
		<cfset var local = {} />
		<cfset local.aImages = application.service.directory.listDirectoryImages(arguments.directory) />
		
		<select id="imageSelect">
			<option value="0">Select an image...</option>
			<cfloop array="#local.aImages#" index="local.i">
				<cfoutput><option value="#local.i.fullPath#">#local.i.name#</option></cfoutput>
			</cfloop>
		</select>
	</cffunction>
	
	<cffunction name="getFormatSelect" access="public" returntype="any" output="true">
		<cfscript>
		var local = {};
		local.aFormats = ['png','jpg','gif'];
		</cfscript>
		
		<select id="formatSelect">
			<option value="0">Select a format...</option>
			<cfloop array="#local.aFormats#" index="local.i">
				<cfoutput><option value="#local.i#">#local.i#</option></cfoutput>
			</cfloop>
		</select>
	</cffunction>
	
</cfcomponent>