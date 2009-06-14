<cfcomponent displayname="Image Service" hint="Image service" extends="com.gallery.services.BaseService" output="false">
	<cfscript>
	variables.imagesDAO = application.gallery.imagesDAO;
	variables.tempFilePath = '';
	</cfscript>
	
		
	<cffunction name="init" displayname="init" hint="psuedo constructor" access="public" output="false" returntype="ImageService">
		<cfargument name="thePath" type="string" required="false" default="#ExpandPath('/')#temp">
		<cfset super.init() />
		<cfscript>
		super.init();
		setTempFilePath(arguments.thePath);
		</cfscript>
		<cfreturn this />
	</cffunction>
	
	<cffunction name="setTempFilePath" access="public" hint="setter for variables.tempFilePath" output="false" returntype="void">
		<cfargument name="thePath" type="string" required="true"/>
		<cfset variables.tempFilePath = arguments.thePath />
		<cfreturn />
	</cffunction>
	
	<cffunction name="getTempFilePath" access="public" hint="getter for variables.tempFilePath" output="false" returntype="string">
		<cfreturn variables.tempFilePath />
	</cffunction>
	
	<cffunction name="getImageByID" displayname="Get Image By ID" hint="Returns a struct containing image data" access="public" output="false" returntype="Any">
		<cfargument name="imageID" displayName="Image ID" type="numeric" hint="the numeric ID of the image to return" required="true" />
		
		<cfscript>
		var local = {};
		// query for the image data
		local.qImage = variables.imagesDAO.getImageByID(arguments.imageID);
		
		local.args = {};
		local.args['id'] = local.qImage.id;
		local.args['fileName'] = local.qImage.fileName;
		local.args['displayName'] = local.qImage.displayName;
		local.args['description'] = local.qImage.description;
		local.args['data'] = local.qImage.data;
		local.args['width'] = local.qImage.width;
		local.args['height'] = local.qImage.height;
		local.args['albumID'] = local.qImage.albumid;
		
		local.image = buildImageStruct(ArgumentCollection = local.args);
		</cfscript>
		
		<cfreturn local.image />
	</cffunction>

	<cffunction name="getImagesByAlbumID" displayname="Get Images By Album ID" hint="Returns an array of structs containing image data" access="public" output="false" returntype="Array">
		<cfargument name="albumID" displayName="Album ID" type="numeric" hint="the numeric albumid" required="true" />
		<cfargument name="sortField" displayname="Sort Field" type="string" hint="the column on which to sort" required="false" default="id"/>
		<cfargument name="sortDirection" displayname="Sort Direction" type="string" hint="the direction in which to perform the sort (asc || desc)" required="false" default="asc"/>
		
		<cfscript>
		var local = {};
		local.qImages = variables.imagesDAO.getImagesByAlbumID(ArgumentCollection = arguments);
		local.ctr = 0;
		local.imageArray = [];
		</cfscript>
		
		<cfloop query="local.qImages">
			<cfscript>
			local.ctr = local.ctr + 1;
			
			// create a thumbnail of the image
			local.thumbStruct = makeThumbnail(data, height, width, ListLast(fileName,'.'), 50);
			
			local.args['id'] = id;
			local.args['fileName'] = fileName;
			local.args['displayName'] = displayName;
			local.args['description'] = description;
			local.args['data'] = local.thumbStruct.data;
			local.args['width'] = local.thumbStruct.width;
			local.args['height'] = local.thumbStruct.height;
			local.args['albumID'] = albumid;
			local.image = buildImageStruct(ArgumentCollection = local.args);
			ArrayAppend(local.imageArray, local.image);
			</cfscript>
		</cfloop>
		
		<cfreturn local.imageArray />
	</cffunction>
	
	<cffunction name="buildImageStruct" access="private" displayname="Build Image Struct" output="false" hint="takes a query row and converts it to a struct" returntype="struct">
		<cfargument name="id" type="numeric" required="true"/>
		<cfargument name="fileName" type="string" required="true"/>
		<cfargument name="displayName" type="string" required="true"/>
		<cfargument name="description" type="string" required="true"/>
		<cfargument name="data" type="binary" required="true"/>
		<cfargument name="width" type="numeric" required="true"/>
		<cfargument name="height" type="numeric" required="true"/>
		<cfargument name="albumID" type="numeric" required="true"/>
		
		<cfscript>
		var local = {};
		// create the struct to hold the image data use ['variableName'] syntax to preserve variable case
		local.image = {};
		local.image['id'] = arguments.id;
		local.image['fileName'] = arguments.fileName;
		local.image['format'] = ListLast(arguments.fileName,'.');
		local.image['displayName'] = arguments.displayName;
		//local.image['data'] = arguments.data;
		local.image['base64'] = blobToBase64(local.image.format, arguments.data);
		local.image['height'] = arguments.height;
		local.image['width'] = arguments.width;
		local.image['description'] = arguments.description;
		local.image['albumID'] = arguments.albumid;
		</cfscript>
		
		<cfreturn local.image />
	</cffunction>
	
	<cffunction name="makeThumbnail" displayname="Make Thumbnail" access="private" output="false" returntype="struct" hint="Creates a thumbnail image">
		<cfargument name="originalImage" type="binary" required="true" hint="The binary string of an image"/>
		<cfargument name="originalHeight" type="numeric" required="true" hint="The original image height"/>
		<cfargument name="originalWidth" type="numeric" required="true" hint="The original image width"/>
		<cfargument name="imageFormat" type="string" required="true" hint="The image format"/>
		<cfargument name="targetHeight" type="numeric" required="true" hint="The desired height after resizing"/>
		
		<cfscript>
		var local = {};
		local.divisor = arguments.originalHeight / arguments.targetHeight;
		local.newWidth = arguments.originalWidth / local.divisor;
		local.tempFileName = CreateUUID() & '.' & arguments.imageFormat;
		local.pathToTempFile = getTempFilePath() & '/' & local.tempFileName;
		</cfscript>
		
		<cfif NOT DirectoryExists(getTempFilePath())>
			<cfdirectory action="create" directory="#getTempFilePath()#"/>
		</cfif>
		
		<cfimage action="read" source="#arguments.originalImage#" name="local.newImage"/>
		
		<cfimage action="write" source="#local.newImage#" format="#arguments.imageFormat#" destination="#local.pathToTempFile#"/>
		
		<cfimage action="resize" source="#local.pathToTempFile#" name="local.newImage"
				height="#arguments.targetHeight#" width="#local.newWidth#"/>
		
		<!--- delete the temp image file --->
		<cffile action="delete" file="#local.pathToTempFile#"/>
		
		<cfscript>
		local.sNewImage = {};
		local.sNewImage['data'] = ImageGetBlob(local.newImage);
		local.sNewImage['height'] = arguments.targetHeight;
		local.sNewImage['width'] = local.newWidth;
		</cfscript>
		
		<cfreturn local.sNewImage />
	</cffunction>
	
	<cffunction name="blobToBase64" displayname="BLOB To Base64" access="private" output="false" returntype="string" hint="converts a blob to base64">
		<cfargument name="format" type="string" required="true" hint="image format"/>
		<cfargument name="blob" type="any" required="true" hint="blob data"/>
		
		<cfscript>
		var local = {};
		local.outputFileName = CreateUUID() & '.txt';
		local.tempDirectory = getTempFilePath() & '/';
		local.filePath = local.tempDirectory & local.outputFileName;
		</cfscript>
		
		<cfif NOT DirectoryExists(local.tempDirectory)>
			<cfdirectory action="create" directory="#local.tempDirectory#">
		</cfif>
		
		<cfimage action="read" source="#arguments.blob#" name="local.theImage"/>
		
		<cfscript>
		ImageWriteBase64(local.theImage, local.filePath, arguments.format, "yes");
		</cfscript>
		
		<cffile action="read" file="#local.filePath#" variable="local.theFile"/>
		
		<cfscript>
		local.output = local.theFile;
		</cfscript>
		
		<cffile action="delete" file="#local.filePath#"/>
		
		<cfreturn local.output />
	</cffunction>

	<cffunction name="newImage" displayname="New Image" access="public" output="false" returntype="any" hint="adds a new image to an album">
		<cfargument name="filedata" type="string" required="true"/>
		<cfargument name="filename" type="string" required="true"/>
		<cfargument name="folder" type="string" required="true"/>
		<cfargument name="albumid" type="numeric" required="true"/>
		
		<cfscript>
		var local = {};
		</cfscript>
		
		<cffile action="readbinary" file="#arguments.filedata#" variable="local.theFile">
		<cfimage action="read" source="#local.theFile#" name="local.theImage" />
		
		<cfsavecontent variable="local.content">
			<cfdump var="#local.theImage#">
		</cfsavecontent>
		
		<cfscript>
		local.image.imageData = local.theFile;
		local.image.imageFileName = arguments.filename;
		local.image.imageAlbumid = arguments.albumid;
		local.image.imageHeight = local.theImage.height;
		local.image.imageWidth = local.theImage.width;
		local.qImage = variables.imagesDAO.create(ArgumentCollection = local.image);
		local.imageid = local.qImage.id;
		</cfscript>
		
		<cfreturn local.imageid />
	</cffunction>
	
	<cffunction name="updateImageDetail" access="public" returntype="void" output="false">
		<cfargument name="id" type="numeric" required="true"/>
		<cfargument name="displayName" type="string" required="false" default=""/>
		<cfargument name="description" type="string" required="false" default=""/>
		
		<cfset variables.imagesDAO.updateImageDetail(ArgumentCollection = arguments) />
		
		<cfreturn />
	</cffunction>
	
</cfcomponent>