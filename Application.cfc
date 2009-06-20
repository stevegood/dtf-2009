<cfcomponent output="false">
	<cfscript>
	THIS.name = 'dallastechfest_session';
	THIS.SessionManagement = true;
	THIS.SessionTimeout = CreateTimeSpan(0, 1, 0, 0);
	THIS.SetClientCookies = true;
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
	
	<cffunction name="onMissingTemplate">
		<cfargument name="template" type="string" required="true"/>
		<p><cfoutput>#arguments.template#</cfoutput> could not be located.  Please try again.</p>
	</cffunction>
	
	<cffunction name="onError">
		<cfdump var="#arguments#">
	</cffunction>
	
	<cffunction name="cacheCFCs">
		<cfif isDefined('application.init')>
			<cfset StructClear(application) />
		</cfif>
		<cfscript>
		application.service = {};
		application.service.captcha = CreateObject('component','com.slantsoft.service.CaptchaService').init();
		application.service.directory = CreateObject('component','com.slantsoft.service.DirectoryService').init();
		
		application.output = {};
		application.output.formElements = CreateObject('component','com.slantsoft.output.FormElements').init();
		
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