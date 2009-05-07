<cfcomponent displayname="Base DAO" hint="Base DAO Object, all DAO objects extend from this" output="false">

	<cfproperty name="datasource" displayname="datasource" hint="datasource" type="string" />

	<cffunction name="init" displayname="init" hint="Psuedo constructor" access="private" output="false" returntype="BaseDAO">
		<cfargument name="datasource" type="string" required="true"/>
		<cfset setDatasource(arguments.datasource) />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getDatasource" access="private" output="false" returntype="string">
		<cfreturn variables.datasource />
	</cffunction>

	<cffunction name="setDatasource" access="private" output="false" returntype="void">
		<cfargument name="datasource" type="string" required="true" />
		<cfset variables.datasource = arguments.datasource />
		<cfreturn />
	</cffunction>

</cfcomponent>