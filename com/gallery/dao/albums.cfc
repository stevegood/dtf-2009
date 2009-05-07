<cfcomponent displayname="Albums DAO" hint="albums table dao" extends="com.gallery.dao.BaseDAO" output="false">


	<cffunction name="init" displayname="init" hint="pseudo constructor" access="public" output="false" returntype="albums">
		<cfset super.init('dallastechfest') />
		<cfreturn this />
	</cffunction>

	<cffunction name="getAlbums" displayname="Get Albums" hint="Returns album record set" access="public" output="false" returntype="query">
		<cfset var local = {} />
		
		<cfquery datasource="#variables.datasource#" name="local.qAlbums">
		SELECT
			id,
			name,
			description
		FROM albums
		ORDER BY name ASC
		</cfquery>
		
		<cfreturn local.qAlbums />
	</cffunction>

	<cffunction name="createAlbum" displayname="Create Album" hint="creates an album record" access="public" output="false" returntype="void">
		<cfargument name="name" displayName="Name" type="string" hint="Gallery name" required="true" />
		<cfargument name="description" displayName="Description" type="String" hint="Gallery description" required="true" />
		
		<cfquery datasource="#variables.datasource#">
		INSERT INTO albums (name, description)
		VALUES (
			<cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar"/>,
			<cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_varchar"/>
		)
		</cfquery>
		
		<cfreturn />
	</cffunction>

	<cffunction name="updateAlbum" displayname="Update Album" hint="updates an album record" access="public" output="false" returntype="void">
		<cfargument name="name" displayName="Name" type="string" hint="Gallery name" required="true" />
		<cfargument name="description" displayName="Description" type="string" hint="Gallery description" required="true" />
		<cfargument name="albumID" displayName="Album ID" type="numeric" hint="Album ID" required="true" />
		
		<cfquery datasource="#variables.datasource#">
		UPDATE albums
		SET 	name = <cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar"/>,
			description = <cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_varchar"/>
		WHERE id = <cfqueryparam value="#arguments.albumID#" cfsqltype="cf_sql_integer"/>
		</cfquery>
		
		<cfreturn />
	</cffunction>

	<cffunction name="deleteAlbum" displayname="Delete Album" hint="deletes and album record" access="public" output="false" returntype="void">
		<cfargument name="albumID" displayName="Album ID" type="numeric" hint="Album ID" required="true" />
		
		<cfquery datasource="#variables.datasource#">
		DELETE FROM albums
		WHERE id = <cfqueryparam value="#arguments.albumID#" cfsqltype="cf_sql_integer"/>
		</cfquery>
		
		<cfreturn />
	</cffunction>
</cfcomponent>