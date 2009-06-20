<cfcomponent displayname="User">
	
	<cfproperty name="firstName" type="string" required="true"/>
	<cfproperty name="lastName" type="string" required="true"/>
	
	<cffunction name="init" access="public" returntype="User" output="false">
		<cfargument name="firstName" type="string" required="true"/>
		<cfargument name="lastName" type="string" required="true"/>
		
		<cfscript>
		setFirstName(arguments.firstName);
		setLastName(arguments.lastName);
		</cfscript>
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getFirstName" access="public" returntype="string" output="false">
		<cfreturn variables.firstName />
	</cffunction>
	
	<cffunction name="getLastName" access="public" returntype="string" output="false">
		<cfreturn variables.lastName />
	</cffunction>
	
	<cffunction name="setFirstName" access="public" returntype="void" output="false">
		<cfargument name="fistName" type="string" required="true"/>
		<cfset variables.firstName = arguments.firstName />
		<cfreturn />
	</cffunction>
	
	<cffunction name="setLastName" access="public" returntype="void" output="false">
		<cfargument name="lastName" type="string" required="true"/>
		<cfset variables.lastName = arguments.lastName />
		<cfreturn />
	</cffunction>
	
</cfcomponent>