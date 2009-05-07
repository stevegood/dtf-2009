<cfcomponent displayname="images" hint="images table dao" extends="com.gallery.dao.BaseDAO" output="false">

	<cffunction name="init" displayname="init" hint="pseudo constructor" access="public" output="false" returntype="images">
		<cfset super.init('dallastechfest') />
		<cfreturn this />
	</cffunction>

	<cffunction name="getImageByID" displayname="Get Image By ID" hint="Returns a single record for the matching image ID" access="public" output="false" returntype="Any">
		<cfargument name="imageID" displayName="Image ID" type="numeric" hint="the numeric ID of an image" required="true" />
		
		<cfset var local = {} />
		
		<cfquery datasource="#variables.datasource#" name="local.qImage">
		SELECT
			id,
			fileName,
			displayName,
			description,
			data,
			height,
			width,
			albumid
		FROM images
		WHERE id = <cfqueryparam value="#arguments.imageID#" cfsqltype="cf_sql_integer"/>
		</cfquery>
		
		<cfreturn local.qImage />
	</cffunction>

	<cffunction name="getImagesByAlbumID" displayname="Get Images By Album ID" hint="returns image records with a matching albumid" access="public" output="false" returntype="query">
		<cfargument name="albumID" displayName="Album ID" type="numeric" hint="the numeric albumid" required="true" />
		<cfargument name="sortField" displayname="Sort Field" type="string" hint="the column on which to sort" required="false" default="id"/>
		<cfargument name="sortDirection" displayname="Sort Direction" type="string" hint="the direction in which to perform the sort (asc || desc)" required="false" default="asc"/>
		
		<cfset var local = {} />
		
		<cfquery datasource="#variables.datasource#" name="local.qImages">
		SELECT
			id,
			fileName,
			displayName,
			description,
			data,
			height,
			width,
			albumid
		FROM images
		WHERE albumid = <cfqueryparam value="#arguments.albumID#" cfsqltype="cf_sql_integer"/>
		ORDER BY #arguments.sortField# #arguments.sortDirection#
		</cfquery>
		
		<cfreturn local.qImages />
	</cffunction>

	<cffunction name="deleteImagesByAlbumID" displayname="Delete Images By Album ID" hint="deletes all image records with a matching albumid" access="public" output="false" returntype="void">
		<cfargument name="albumID" type="numeric" required="true" hint="the Album ID"/>
		
		<cfquery datasource="#variables.datasource#">
		DELETE FROM images
		WHERE albumid = <cfqueryparam value="#arguments.albumID#" cfsqltype="cf_sql_integer"/>
		</cfquery>
		
		<cfreturn />
	</cffunction>
</cfcomponent>