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

	<cffunction name="create" displayname="Create" hint="Creates a new images record" access="public" output="false" returntype="void">
		<cfargument name="imageData" type="binary" required="true" hint="binary image data"/>
		<cfargument name="fileName" type="string" required="true" hint="name of the image file"/>
		<cfargument name="imageName" type="string" required="true" hint="name of the image"/>
		<cfargument name="imageDesc" type="string" required="true" hint="Image description"/>
		<cfargument name="imageHeight" type="numeric" required="true" hint="Image height"/>
		<cfargument name="imageWidth" type="numeric" required="true" hint="Image width"/>
		<cfargument name="albumID" type="numeric" required="true" hint="What album does this image belong to?"/>
		
		<cfscript>
		var local = {};
		
		// if the fileName is longer than 50 characters save the extension and shorten the fileName to 46 characters
		local.fileName = arguments.fileName;
		if (Len(local.fileName) > 50){
			local.extension = '.' & ListLast(local.fileName,'.');
			local.fileName = trim(Left(Replace(local.fileName,local.extension,'','ALL'),46)) & local.extension;
		}
		
		// if imageName is longer than 50 characters truncate to left 50 characters
		local.imageName = arguments.imageName;
		if (Len(local.imageName) > 50){
			local.imageName = Left(local.imageName,50);
		}
		
		// if imageDesc is longer than 255 characters truncate to left 255 characters
		local.imageDesc = arguments.imageDesc;
		if (Len(local.imageDesc) > 255){
			local.imageDesc Left(local.imageDesc,255);
		}
		</cfscript>
		
		<cfquery datasource="#variables.datasource#">
		INSERT INTO images (fileName, displayName, description, data, height, width, albumid)
		VALUES (
					<cfqueryparam value="#local.fileName#" cfsqltype="cf_sql_varchar" maxlength="50"/>,
					<cfqueryparam value="#local.imageName#" cfsqltype="cf_sql_varchar" maxlength="50"/>,
					<cfqueryparam value="#local.imageDesc#" cfsqltype="cf_sql_varchar" maxlength="255"/>,
					<cfqueryparam value="#arguments.imageData#" cfsqltype="cf_sql_blob"/>,
					<cfqueryparam value="#arguments.imageHeight#" cfsqltype="cf_sql_integer"/>,
					<cfqueryparam value="#arguments.imageWidth#" cfsqltype="cf_sql_integer"/>,
					<cfqueryparam value="#arguments.albumID#" cfsqltype="cf_sql_integer"/>
				)
		</cfquery>
		
		<cfreturn />
	</cffunction>
</cfcomponent>