<cfcomponent>
	
	<cffunction name="init" access="public" returntype="Any" output="false">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getRandString" access="public" returntype="string" output="false">
		<cfargument name="stringLength" type="numeric" required="false" default="10"/>
		
		<cfscript>
		var local = {};
		local.randout = '';
		local.chars = "ABCDEFGHKLMNPQRSTUVWXYZabcdefghikmnpqrstuvwxyz23456789";
		for (local.i = 1; local.i < arguments.stringLength; local.i++){
			local.rnum = ceiling(rand() * len(local.chars));
			if (local.rnum EQ 0){
				local.rnum = 1;
			}
			local.randout &= mid(local.chars, local.rnum, 1);
		}
		</cfscript>
		
		<cfreturn local.randout />
	</cffunction>
	
</cfcomponent>