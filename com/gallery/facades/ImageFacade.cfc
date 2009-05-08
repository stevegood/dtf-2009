<cfcomponent displayname="Image Facade" hint="Contains methods exposing remote image methods" extends="com.gallery.facades.BaseFacade" output="false">
	<cfscript>
	variables.imageService = Application.gallery.ImageService;
	</cfscript>
	
	<cffunction name="getImage" displayname="Get Image" hint="Returns a struct containing image data" access="remote" output="false" returntype="any">
		<cfargument name="imageID" displayName="Image ID" type="numeric" hint="The ID of the image to return" required="true" />
		<cfargument name="callback" displayName="callback" type="any" hint="JSONp callback, supply this if making cross domain requests." required="false" default="" />
		
		<cfscript>
		var local = {};
		local.theImage = variables.imageService.getImageByID(arguments.imageID);
		if (arguments.callback NEQ ""){
			local.theImage.data = "";
			local.theImage = serializeToJSONp(local.theImage);
		}
		</cfscript>

		<cfreturn local.theImage />
	</cffunction>

	<cffunction name="getAlbumImages" displayname="Get Gallery images" hint="Returns an array of structs containing image data" access="remote" output="false" returntype="any">
		<cfargument name="albumID" displayName="Album ID" type="numeric" hint="The ID of the album from which to return images" required="true" />
		<cfargument name="callback" displayName="callback" type="string" hint="JSONp call back, use when making cross domain requests" required="false" default="" />
		
		<cfscript>
		var local = {};
		local.theImageArray = variables.imageService.getImagesByAlbumID(arguments.albumID);
		if (arguments.callback NEQ ""){
			for (local.i = 0; local.i < ArrayLen(local.theImageArray);local.i++){
				local.theImageArray[local.i + 1].data = "";
			}
			local.theImageArray = serializeToJSONp(arguments.callback, local.theImageArray);
		}
		</cfscript>
		
		<cfreturn local.theImageArray />
	</cffunction>

	<cffunction name="addImage" displayname="Add image" hint="Adds an image to an album" access="remote" output="false" returntype="string">
		<cfargument name="callback" type="string" required="false" default=""/>
		
		<cfscript>
		var local = {};
		local.result = {};
		local.result['success'] = true;
		if (arguments.callback NEQ ""){
			local.result = serializeToJSONp(arguments.callback, local.result);
		}
		</cfscript>
		
		<cfsavecontent variable="local.result">
			<cfoutput>
				#local.result#
			</cfoutput>
		</cfsavecontent>
		
		<cfreturn local.result />
	</cffunction>
</cfcomponent>