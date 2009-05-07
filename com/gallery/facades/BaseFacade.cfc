<cfcomponent displayname="Base Facade" hint="Base facade object, all facades extend from this" output="false">


	<cffunction name="serializeToJSONp" displayname="Serialize to JSONp" hint="Serializes a complex data structure to JSONp" access="private" output="false" returntype="String">
		<cfargument name="callback" type="string" required="true"/>
		<cfargument name="data" type="any" required="true"/>
		
		<cfscript>
		var local = {};
		local.json = SerializeJSON(arguments.data);
		local.jsonp = arguments.callback & '(' & local.json & ')';
		</cfscript>		
		
		<cfreturn local.jsonp />
	</cffunction>
</cfcomponent>