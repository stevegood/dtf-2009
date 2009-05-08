<cfcomponent output="false">
	<cfscript>
	THIS.name = 'dallastechfest_session';
	</cfscript>
	
	<cffunction name="onApplicationStart">
		<cfscript>
		cacheCFCs();
		application.init = 1;
		</cfscript>
	</cffunction>
	
	<cffunction name="onRequestStart">
		<cfif isDefined('url.reinit')>
			<cfscript>
			cacheCFCs();
			application.init = 1;
			</cfscript>
		</cfif>
	</cffunction>
	
	<cffunction name="cacheCFCs">
		<cfif isDefined('application.init')>
			<cfset StructClear(application) />
		</cfif>
		<cfscript>
		// create a new struct to hold gallery objects in the application scope
		application.gallery = {};
		// dao instantiations
		application.gallery.imagesDAO = CreateObject('component','com.gallery.dao.images').init();
		application.gallery.albumsDAO = CreateObject('component','com.gallery.dao.albums').init();
		// service instantiations
		application.gallery.imageService = CreateObject('component','com.gallery.services.ImageService').init();
		application.gallery.albumService = CreateObject('component','com.gallery.services.AlbumService').init();
		</cfscript>
	</cffunction>
</cfcomponent>