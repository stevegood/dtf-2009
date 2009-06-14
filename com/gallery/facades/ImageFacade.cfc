<cfcomponent displayname="Image Facade" hint="Contains methods exposing remote image methods" extends="com.gallery.facades.BaseFacade" output="false">
	<cfscript>
	variables.imageService = Application.gallery.ImageService;
	</cfscript>
	
	<cffunction name="getImage" displayname="Get Image" hint="Returns a struct containing image data" access="remote" output="false" returntype="struct">
		<cfargument name="imageID" displayName="Image ID" type="numeric" hint="The ID of the image to return" required="true" />
		
		<cfscript>
		var local = {};
		local.theImage = variables.imageService.getImageByID(arguments.imageID);
		</cfscript>

		<cfreturn local.theImage />
	</cffunction>

	<cffunction name="getAlbumImages" displayname="Get Gallery images" hint="Returns an array of structs containing image data" access="remote" output="false" returntype="array">
		<cfargument name="albumID" displayName="Album ID" type="numeric" hint="The ID of the album from which to return images" required="true" />
		
		<cfscript>
		var local = {};
		local.theImageArray = [];
		local.theImageArray = Duplicate(variables.imageService.getImagesByAlbumID(arguments.albumID));
		</cfscript>
		
		<cfreturn local.theImageArray />
	</cffunction>

	<cffunction name="addImage" displayname="Add image" hint="Adds an image to an album" access="remote" output="false" returntype="any">
		<cfargument name="filedata" type="string" required="true"/>
		<cfargument name="filename" type="string" required="true"/>
		<cfargument name="albumid" type="numeric" required="true"/>
		
		<cfscript>
		var local = {};
		local.imageID = variables.imageService.newImage(ArgumentCollection = arguments);
		</cfscript>
		
		<cfreturn local.imageID />
	</cffunction>
	
	<cffunction name="updateImageDetail" access="remote" returntype="boolean" output="false">
		<cfargument name="id" type="numeric" required="true"/>
		<cfargument name="displayName" type="string" required="false" default=""/>
		<cfargument name="description" type="string" required="false" default=""/>
		
		<cfset variables.imageService.updateImageDetail(ArgumentCollection = arguments) />
		
		<cfreturn true />
	</cffunction>
	
</cfcomponent>