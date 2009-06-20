
<cfset pageid = hash(CreateUUID()) />

<style>
#output_<cfoutput>#pageid#</cfoutput> {
	overflow: auto;
}
</style>

<div class="span-16">
	<h3>Resizing an Image</h3>
	<table>
		<tr>
			<td>
				<cfoutput>#application.output.formElements.getImageSelect()#</cfoutput>
			</td>
		</tr>
		<tr>
			<td>
				Image Width: <input id="imageWidth" type="text" value="256"/>
			</td>
		</tr>
		<tr>
			<td id="picker">
				Image Height: <input id="imageHeight" type="text" value="256" />
			</td>
		</tr>
		<tr>
			<td>
				<input id="submitBtn" type="button" value="Resize Image">
			</td>
		</tr>
		<tr>
			<td id="output_<cfoutput>#pageid#</cfoutput>"></td>
		</tr>
	</table>
</div>

<script type="text/javascript">
var pageid = '<cfoutput>#pageid#</cfoutput>';

$(document).ready(function(){	
	$('#submitBtn').click(function(){
		var target = '#output_' + pageid;
		if ($('#imageSelect').val() == 0){
			alert('Select an image!');
			$('#imageSelect').focus();
			return false;
		}
		$(target).load('/examples/resizingDisplay.cfm?fullPath=' + $('#imageSelect').val() + '&imageWidth=' + $('#imageWidth').val() + '&imageHeight=' + $('#imageHeight').val());
	});
});
</script>