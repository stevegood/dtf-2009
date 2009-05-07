<!--- <cfdump var="#application.gallery.ImageService.getImagesByAlbumID(1)#"> --->



<!--- <cfscript>
newImageWritten = false;
theImage = ImageNew('http://www.google.com/intl/en_ALL/images/logo.gif');
imageName = ListLast(theImage.source,'/');
imageExtension = ListLast(imageName,'.');
if (imageExtension EQ 'gif'){
	newImageName = Replace(imageName,imageExtension,'png','ALL');
	ImageWrite(theImage,newImageName);
	newImageWritten = true;
	theImage = ImageNew(newImageName);
	
}
</cfscript>

<cfif newImageWritten>
	<cffile action="delete" file="#ExpandPath('/gallery/')##newImageName#">
</cfif>

<cfdump var="#theImage#">

<cfset blob = ImageGetBlob(theImage)/>

<cfquery datasource="dallastechfest">
INSERT INTO images (fileName, displayName, description, data, height, width, albumid)
VALUES (
	<cfqueryparam value="#ListLast(theImage.source,'/')#" cfsqltype="cf_sql_varchar"/>,
	<cfqueryparam value="Google Logo" cfsqltype="cf_sql_varchar"/>,
	<cfqueryparam value="This is the Google logo" cfsqltype="cf_sql_varchar"/>,
	<cfqueryparam value="#blob#" cfsqltype="cf_sql_blob"/>,
	<cfqueryparam value="#theImage.height#" cfsqltype="cf_sql_integer"/>,
	<cfqueryparam value="#theImage.width#" cfsqltype="cf_sql_integer"/>,
	<cfqueryparam value="1" cfsqltype="cf_sql_integer"/>
)
</cfquery> --->