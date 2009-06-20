<cfcomponent>
	
	<cffunction name="init" access="public" returntype="Any" output="false">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="listDirectoryImages" access="public" returntype="array" output="false">
		<cfargument name="directory" type="string" required="false" default="/img/samples/" />
		
		<cfscript>
		var local = {};
		local.pattern = '(.jpg)|(.png)|(.gif)';
		local.dir = ExpandPath(arguments.directory);
		local.aDir = ArrayNew(1);
		</cfscript>
		
		<cfif directoryExists(local.dir)>
			<cfdirectory action="list" directory="#local.dir#" name="local.qDir" />
			
			<cfloop query="local.qDir">
				<cfif ArrayLen(REMatchNoCase(local.pattern,Right(name,4))) NEQ 0>
					<cfscript>
					local.sFile = {};
					local.sFile['name'] = name;
					local.sFile['fullPath'] = local.dir & name;
					ArrayAppend(local.aDir,local.sFile);
					</cfscript>
				</cfif>
			</cfloop>
		</cfif>
		
		<cfreturn local.aDir />
	</cffunction>
	
</cfcomponent>