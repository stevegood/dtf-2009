<cfcomponent displayname="Gallery Service" hint="Gallery Service" extends="com.gallery.services.BaseService" output="false">
	<cfscript>
	variables.albumsDAO = application.gallery.albumsDAO;
	variables.imagesDAO = application.gallery.imagesDAO;
	</cfscript>

	<cffunction name="init" displayname="init" hint="pseudo constructor" access="public" output="false" returntype="AlbumService">
		<cfset super.init() />
		<cfreturn this />
	</cffunction>

	<cffunction name="getAlbums" displayname="Get Albums" hint="Returns an array of structs containing album data" access="public" output="false" returntype="array">
		<cfscript>
		var local = {};
		local.albumArray = [];
		local.qAlbums = variables.albumsDAO.getAlbums();
		</cfscript>
		
		<cfloop query="local.qAlbums">
			<cfscript>
			local.album = {};
			local.album['id'] = id;
			local.album['name'] = name;
			local.album['description'] = description;
			ArrayAppend(local.albumArray,local.album);
			</cfscript>
		</cfloop>
		
		<cfreturn local.albumArray />
	</cffunction>

	<cffunction name="createAlbum" displayname="Create Album" hint="Facilitates album creation" access="public" output="false" returntype="void">
		<cfargument name="name" displayName="Name" type="string" hint="Gallery name" required="true" />
		<cfargument name="description" displayName="Description" type="String" hint="Gallery description" required="true" />
		
		<cfset variables.albumsDAO.createAlbum(ArgumentCollection = arguments) />
		
		<cfreturn />
	</cffunction>

	<cffunction name="updateAlbum" displayname="Update Album" hint="Facilitates the updating of an album" access="public" output="false" returntype="void">
		<cfargument name="name" displayName="Name" type="string" hint="Gallery name" required="true" />
		<cfargument name="description" displayName="Description" type="string" hint="Gallery description" required="true" />
		<cfargument name="albumID" displayName="Album ID" type="numeric" hint="Album ID" required="true" />
		
		<cfset variables.albumsDAO.updateAlbum(ArgumentCollection = arguments) />
		
		<cfreturn />
	</cffunction>

	<cffunction name="deleteAlbum" displayname="Delete Album" hint="Facilitates deletion of an album" access="public" output="false" returntype="void">
		<cfargument name="albumID" displayName="Album ID" type="numeric" hint="Album ID" required="true" />
		
		<cfset variables.albumsDAO.deleteAlbum(arguments.albumID) />
		<cfset variables.imagesDAO.deleteImagesByAlbumID(arguments.albumid) />
		
		<cfreturn />
	</cffunction>
</cfcomponent>