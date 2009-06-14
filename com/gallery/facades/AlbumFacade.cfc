<cfcomponent displayname="Album Facade" hint="Exposes gallery data to remote access" extends="com.gallery.facades.BaseFacade" output="false">
	<cfscript>
	variables.albumService = application.gallery.AlbumService;
	</cfscript>
	
	
	<cffunction name="getAlbums" displayname="Get Galleries" hint="Returns an array of structs containing gallery data" access="remote" output="false" returntype="Array">
		
		<cfscript>
		var local = {};
		local.albumArray = variables.albumService.getAlbums();
		</cfscript>
		
		<cfreturn local.albumArray />
	</cffunction>

	<cffunction name="createAlbum" displayname="Create Album" hint="Facilitates album creation" access="remote" output="false" returntype="any">
		<cfargument name="name" displayName="Name" type="string" hint="Gallery name" required="true" />
		<cfargument name="description" displayName="Description" type="String" hint="Gallery description" required="true" />
		
		<cfscript>
		var local = {};
		local.result = {};
		local.result['success'] = true;
		variables.albumService.createAlbum(ArgumentCollection = arguments);
		</cfscript>
		
		<cfreturn local.result />
	</cffunction>

	<cffunction name="updateAlbum" displayname="Update Album" hint="Facilitates the updating of an album" access="remote" output="false" returntype="any">
		<cfargument name="name" displayName="Name" type="string" hint="Gallery name" required="true" />
		<cfargument name="description" displayName="Description" type="string" hint="Gallery description" required="true" />
		<cfargument name="albumID" displayName="Album ID" type="numeric" hint="Album ID" required="true" />
		
		<cfscript>
		var local = {};
		local.result = {};
		local.result['success'] = true;
		variables.albumService.updateAlbum(ArgumentCollection = arguments);
		</cfscript>
		
		<cfreturn local.result />
	</cffunction>

	<cffunction name="deleteAlbum" displayname="Delete Album" hint="Facilitates deletion of an album" access="remote" output="false" returntype="any">
		<cfargument name="albumID" displayName="Album ID" type="numeric" hint="Album ID" required="true" />
		
		<cfscript>
		var local = {};
		local.result = {};
		local.result['success'] = true;
		variables.albumService.deleteAlbum(arguments.albumID);
		</cfscript>
		
		<cfreturn local.result />
	</cffunction>
</cfcomponent>